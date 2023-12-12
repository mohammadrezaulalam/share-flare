import 'dart:ffi';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share_flare/data/models/user_model_registration.dart';
import 'package:share_flare/presentation/ui/screens/auth/login_screen.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
import 'package:flutter/material.dart';

import '../ui/screens/main_bottom_nav_screen.dart';

class SignUpController extends GetxController {
  static SignUpController instance = Get.find();

  //text controller
  final TextEditingController emailTE = TextEditingController();
  final TextEditingController passwordTE = TextEditingController();
  final TextEditingController rePasswordTE = TextEditingController();

  final TextEditingController firstNameTE = TextEditingController();
  final TextEditingController lastNameTE = TextEditingController();
  final TextEditingController userNameTE = TextEditingController();

  bool _isLoading = false;

  RxString _imagePath = ''.obs;

  //getter method
  bool get isLoading => _isLoading;

  //setter method
  void isLoadingCallInAppBar(bool value) {
    _isLoading = value;
    clearTheControllers();
    update();
  }

  //clear the controller
  void clearTheControllers() {
    emailTE.clear();
    passwordTE.clear();
    rePasswordTE.clear();
    firstNameTE.clear();
    lastNameTE.clear();
    userNameTE.clear();
    _imagePath.value = '';
  }

  //picked Image
  String get profilePhoto => _imagePath.value;

  void pickedImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      //put image path
      _imagePath.value = pickedImage.path.toString();
      Get.snackbar('Profile Picture',
          'You have successfully selected your profile picture!');
    }
  }

//method for upload the firebase storage(image upload)
  Future<String> _uploadToStorage(String imagepath) async {
    File image = File(imagepath); // string to File convert
    Reference ref = firebaseStorage
        .ref()
        .child('profilePics')
        .child(firebaseAuth.currentUser!.uid);
    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

//registering the user, make this method for Future<bool> only for use await and .then() method in signup screen
  Future<bool> registerUser() async {
    //make sure every parameter has data
    try {
      if (firstNameTE.text.isNotEmpty &&
          lastNameTE.text.isNotEmpty &&
          userNameTE.text.isNotEmpty &&
          emailTE.text.isNotEmpty &&
          // image !=null &&
          profilePhoto.isNotEmpty &&
          passwordTE.text.isNotEmpty) {
        _isLoading = true;
        update();
        UserCredential cred = await firebaseAuth.createUserWithEmailAndPassword(
            email: emailTE.text.trim(), password: passwordTE.text);
        String downloadUrl = await _uploadToStorage(profilePhoto);

        //add model class
        UserModelRegistration user = UserModelRegistration(
            firstName: firstNameTE.text,
            lastName: lastNameTE.text,
            userName: userNameTE.text,
            profilePhoto: downloadUrl,
            email: emailTE.text,
            uid: cred.user!.uid,
            follower: [],
            following: []);

        //add data to firestore database
        await fireStore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson())
            .then((value) {
          _isLoading = false;
          update();
          Get.snackbar("Success", 'Registration has been Successful',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
          Get.offAll(() => const LoginScreen(isComesFromRegistration: true));
          clearTheControllers();
          return true; //
        });

/*        // Add user information to the 'users' collection
        await fireStore.collection('users').doc(cred.user!.uid).set(user.toJson());

        // Add user information to the 'follower' subcollection
        await fireStore.collection('users').doc(cred.user!.uid).collection("followers").doc('list of followers people').set(user.toJson());

        // Add user information to the 'following' subcollection
        await fireStore.collection('users').doc(cred.user!.uid).collection("following").doc('List of following people').set(user.toJson());*/

      } else {
        Get.snackbar(
          "Error Creating Account",
          'Please enter all the fields',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        _isLoading = false;
        update();
        return false;
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      _isLoading = false;
      update();
      return false;
    }
    _isLoading = false;

    update();
    return false;
  }
}
