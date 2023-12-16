import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:share_flare/data/models/fetch_user_model.dart';

class UserProfileController extends GetxController {
  static UserProfileController instance = Get.find();

  final RxBool _isData = false.obs;

  bool get isData => _isData.value;

  final RxBool _isDataLoading = false.obs;

  bool get isDataLoading => _isDataLoading.value;

  FetchUserModel _fetchUserModel = FetchUserModel();

  FetchUserModel get fetchUserModel => _fetchUserModel;

  var userData = {}.obs;
  //var usersData;

  int postLength = 0;
  int followers = 0;
  int following = 0;
  String fullName = '';
  bool isFollowing = false;
  String currentProfileId = '';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //String activeUserUid = FirebaseAuth.instance.currentUser!.uid;

  Future<void> listenToUserInfo() async {
    try {
      _isData.value = true;
      User currentUser = _auth.currentUser!;

      DocumentSnapshot snap =
          await _firestore.collection('users').doc(currentUser.uid).get();

      _fetchUserModel = FetchUserModel.fromSnap(snap);
      // if (_fetchUserModel.email?.isNotEmpty ?? false) {
      //   _isData.value = true;
      // }
      _isData.value = false;
      update();
    } catch (error) {
      print('Error fetching user information: $error');
    }
  }

  getUserData(String uid) async {
    try {
      _isDataLoading.value = true;
      var userSnap = await _firestore.collection('users').doc(uid).get();

      //Get Post Length
      // var postSnap = await _firestore
      //     .collection('posts')
      //     .where('uid', isEqualTo: _auth.currentUser!.uid)
      //     .get();

      userData.value = userSnap.data()!;
      //postLength = postSnap.docs.length;
      followers = userSnap.data()!['follower'].length;
      following = userSnap.data()!['following'].length;
      fullName = userSnap.data()!['firstName'] + userSnap.data()!['lastName'];
      currentProfileId = userSnap.data()!['uid'];
      //print(currentProfileId);
      print(userData);
      isFollowing =
          userSnap.data()!['follower'].contains(_auth.currentUser!.uid);
      _isDataLoading.value = false;
      update();
    } catch (e) {
      _isDataLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> followUser(String uid, String followId) async {
    try {
      DocumentSnapshot snap =
          await _firestore.collection('users').doc(uid).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followId)) {
        await _firestore.collection('users').doc(followId).update({
          'follower': FieldValue.arrayRemove([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayRemove([followId])
        });
      } else {
        await _firestore.collection('users').doc(followId).update({
          'follower': FieldValue.arrayUnion([uid])
        });

        await _firestore.collection('users').doc(uid).update({
          'following': FieldValue.arrayUnion([followId])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //Future<void> getFollower() {}

  incrementFollower() {
    isFollowing = true;
    followers++;
  }

  decrementtFollower() {
    isFollowing = false;
    followers--;
  }
}
