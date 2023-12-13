import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:share_flare/presentation/state_holders/login_controller.dart';
import 'package:share_flare/presentation/state_holders/registration_controller.dart';
import 'package:share_flare/presentation/state_holders/user_controller.dart';

import '../../state_holders/auth_controller.dart';

//FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var fireStore = FirebaseFirestore.instance;

//CONTROLLER
var signUpController = SignUpController.instance;
var signInController = SignInController.instance;
var userProfileController = UserProfileController.instance;
var authController = AuthController.instance;

