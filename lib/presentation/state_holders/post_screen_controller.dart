

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_flare/data/models/post_model.dart';
import 'package:share_flare/presentation/state_holders/registration_controller.dart';
import 'package:uuid/uuid.dart';

class PostScreenController extends GetxController{

  final RxList<Uint8List> imageList = <Uint8List>[].obs;
  final TextEditingController descriptionTE = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;





  Future<void> loadGalleryImages() async {
    // Open the gallery and get the list of selected images
    List<Uint8List> galleryImages = await _pickMultipleImagesFromGallery();

    imageList.addAll(galleryImages); // Add the selected images to the list
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

  Future<String> uploadPost(String description, Uint8List file, String uid, String username, String profImage) async {
    // asking uid here because we don't want to make extra calls to firebase auth when we can just get it from our state management
    String res = "Error occurred";
    try {
      String photoUrl = await SignUpController.instance.uploadImgToStorage('posts', file, true);

      print('Download URL: $photoUrl'); // Add this line for debugging

      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        uid: uid,
        username: username,
        likes: [],
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
      );

      print('Post Object: $post'); // Add this line for debugging

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "success";
    } catch (err) {
      res = err.toString();
    }
    return res;
  }


}

