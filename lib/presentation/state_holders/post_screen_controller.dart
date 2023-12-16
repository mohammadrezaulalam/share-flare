import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_flare/data/models/post_model.dart';
import 'package:share_flare/presentation/state_holders/registration_controller.dart';
import 'package:share_flare/presentation/ui/screens/post_screen.dart';
import 'package:share_flare/presentation/ui/utilities/utiles.dart';
import 'package:uuid/uuid.dart';

class PostScreenController extends GetxController {
  final List<Uint8List> imageList = <Uint8List>[];
  final TextEditingController descriptionTE = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  Future<void> loadGalleryImages() async {
    // Open the gallery and get the list of selected images
    List<Uint8List> galleryImages = await _pickMultipleImagesFromGallery();

    imageList.addAll(galleryImages);

  }

  // Example method for picking multiple images from the gallery
  Future<List<Uint8List>> _pickMultipleImagesFromGallery() async {
    List<Uint8List> selectedImages = [];

    // Use ImagePicker to pick multiple images from the gallery
    List<XFile>? galleryFiles = await ImagePicker().pickMultiImage();

    if (galleryFiles != null) {
      for (XFile file in galleryFiles) {
        // Read the image file and add it to the list
        List<int> bytes = await file.readAsBytes();
        selectedImages.add(Uint8List.fromList(bytes));
      }
    }

    return selectedImages;
  }
  Future<void> pickImageFromCamera() async {
    Uint8List? file = await pickImage(ImageSource.camera);
    if (file != null) {
      // Add the picked image to the imageList
      imageList.add(file);

      // Update the UI to reflect the changes
      update();
    }
  }

  void clearTheControllers() {
    descriptionTE.clear();
    imageList.clear();

  }




  Future<String> uploadPost(String description, List<Uint8List> files,
      String uid, String username, String profImage) async {
    String res = "Error occurred";
    try {
      List<String> photoUrls = [];

      // Upload each image separately and collect their download URLs
      for (Uint8List file in files) {
        String photoUrl = await RegistrationController.instance
            .uploadImgToStorage('posts', file, true);
        photoUrls.add(photoUrl);
      }

      // Create a post object with the list of download URLs
      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        profImage: profImage,
        // Assuming 'postUrls' is a List<String> in your 'Post' class
        postUrl: 'photoUrls',
      );

      // Save the post to Firestore
      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}