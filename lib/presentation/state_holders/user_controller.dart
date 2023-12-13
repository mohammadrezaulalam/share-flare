import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:share_flare/data/models/fetch_user_model.dart';

class UserProfileController extends GetxController {
  static UserProfileController instance = Get.find();
  final RxBool _isLoading = false.obs;

  RxBool isData = false.obs;

  bool get isLoading => _isLoading.value;

  FetchUserModel _fetchUserModel = FetchUserModel();

  FetchUserModel get fetchUserModel => _fetchUserModel;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> listenToUserInfo() async {
    _isLoading.value = true;

    try {
      User currentUser = _auth.currentUser!;

      DocumentSnapshot snap =
          await _firestore.collection('users').doc(currentUser.uid).get();

      _fetchUserModel = FetchUserModel.fromSnap(snap);
      if (_fetchUserModel.email?.isNotEmpty ?? false) {
        isData.value = true;
        _isLoading.value = false;
      }
    } catch (error) {
      //print('Error fetching user information: $error');
    } finally {
      _isLoading.value = false;
    }
  }
}
