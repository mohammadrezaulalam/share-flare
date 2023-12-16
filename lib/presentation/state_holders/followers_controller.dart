// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:share_flare/data/models/fetch_user_model.dart';

// class FollowersController extends GetxController {
//   final RxList<FetchUserModel> userList = <FetchUserModel>[].obs;

//   Future<void> getUsers() async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await FirebaseFirestore.instance.collection('users').get();

//       var res = userList.value = querySnapshot.docs
//           .map((doc) => FetchUserModel.fromJson(doc.data()))
//           .toList();
//     } catch (e) {
//       print("Error fetching users: $e");
//     }
//   }

//   Future<void> getUsersByIds(List<String> userIds) async {
//     try {
//       QuerySnapshot<Map<String, dynamic>> querySnapshot =
//           await FirebaseFirestore.instance
//               .collection('users')
//               .where('id', whereIn: userIds)
//               .get();

//       userList.value = querySnapshot.docs
//           .map((doc) => FetchUserModel.fromJson(doc.data()))
//           .toList();
//     } catch (e) {
//       print("Error fetching users by IDs: $e");
//     }
//   }
// }
