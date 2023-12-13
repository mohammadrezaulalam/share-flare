import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../ui/screens/auth/login_screen.dart';
import '../ui/screens/main_bottom_nav_screen.dart';
import '../ui/screens/welcome_screen.dart';
import '../ui/utilities/auth_constant.dart';

class LoginController extends GetxController {
  static LoginController instance = Get.find();
  RxBool _isSignInLoading = false.obs;
  RxBool _isLoggedInSuccessful = false.obs;
  RxBool _saveUserToAutoLogin=false.obs;

  late Rx<User?> _user;
  RxBool get isSignInLoading => _isSignInLoading;
  //onReady() override,It is called automatically when the controller is initialized and ready to be used.
  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(firebaseAuth.currentUser);
    _user.bindStream(firebaseAuth.authStateChanges());
    ever(_user, _setInitialScreen);
  }

  _setInitialScreen(User? user){
    if(user==null){
      Get.offAll(()=>const WelcomeScreen());

    }
  }

  //user login method
  Future<bool> userLogin(String email, String password) async {
    _isSignInLoading.value = true;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .then((value) {
          Get.snackbar('Success', 'Login successful',
              backgroundColor: Colors.green,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);
          print("Login Success");
          _isSignInLoading.value = false;
          _isLoggedInSuccessful.value=true;
          if(_isLoggedInSuccessful.value && _saveUserToAutoLogin.value){
            authController.setAuthStatus(true);
          }
          Get.offAll(() => const MainBottomNavScreen());
          return true;

        }).catchError((error) {
          Get.snackbar('Error to Login', 'Invalid email or password',
              backgroundColor: Colors.red,
              colorText: Colors.white,
              snackPosition: SnackPosition.BOTTOM);



          print('Firebase Authentication Error: $error');
          return false;
        });
      } else {
        Get.snackbar('Incomplete Field', 'Please insert email and password',
            backgroundColor: Colors.red,
            colorText: Colors.white,
            snackPosition: SnackPosition.BOTTOM);
        return false;
      }
    } catch (e) {
      Get.snackbar('Unexpected Error', 'An unexpected error occurred',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
      print('Unexpected Error: $e');
      return false;
    } finally {
      _isSignInLoading.value = false;
    }

    return false;
  }

  //save user login auth
  void saveUserAuth(bool save){
    save=!save;
    _saveUserToAutoLogin.value=!save;
    print("Auto Login value change : ${_saveUserToAutoLogin.value}");
  }

  //signOut
  void signOut(){
    firebaseAuth.signOut();
    authController.logOut();
  }

}

