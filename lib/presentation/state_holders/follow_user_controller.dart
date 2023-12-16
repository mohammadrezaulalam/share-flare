import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:share_flare/data/models/fetch_followers_model.dart';

class FollowUserController extends GetxController {
  static FollowUserController instance = Get.find();
  final RxBool _isDataLoading = false.obs;
  bool get isDataLoading => _isDataLoading.value;

  final RxList<FetchFollowerModel> userList = <FetchFollowerModel>[].obs;

  Future<void> getUsers() async {
    try {
      _isDataLoading.value = true;
      userList.clear();
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance.collection('users').get();

      userList.value = querySnapshot.docs
          .map((doc) => FetchFollowerModel.fromJson(doc.data()))
          .toList();
      _isDataLoading.value = false;
    } catch (e) {
      print("Error fetching users: $e");
    }
  }

  Future<void> getUsersByIds(List<String> userIds) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('uid', whereIn: userIds)
              .get();

      userList.value = querySnapshot.docs
          .map((doc) => FetchFollowerModel.fromJson(doc.data()))
          .toList();
      print('Printed From Controller');
      print(userList[1].email);
    } catch (e) {
      print("Error fetching users by IDs: $e");
    }
  }
}
