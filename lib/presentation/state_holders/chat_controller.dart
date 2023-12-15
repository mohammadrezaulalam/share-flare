import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:share_flare/data/models/message_test.dart';
import 'package:share_flare/data/models/user_model_registration.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';

class ChatController extends GetxController {
  static ChatController instance = Get.find();
  RxBool _isDataFetching = false.obs;

  //GETTER METHOD
  bool get isDataFetching => _isDataFetching.value;
//SEND MESSAGE
  Future<void> sendMessage(String receiverId, String message) async {
    //get current user info
    final String currentUserId = firebaseAuth.currentUser!.uid;
    final String currentUserEmail = firebaseAuth.currentUser!.email.toString();
    final Timestamp timestamp = Timestamp.now();

    //create a new message
    MessageTest newMessage = MessageTest(
      senderId: currentUserId,
      senderEmail: currentUserEmail,
      receiverId: receiverId,
      message: message,
      timestamp: timestamp,
    );
    //construct chat room id form current user id and receiver id(sorted to ensure uniqueness
    List<String> ids = [currentUserId, receiverId];
    ids.sort();
    String chatRoomId = ids
        .join("_"); //combine the ids into a single string to use as a chatRoom

    //add new message to database
    await fireStore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('message')
        .add(newMessage.toMap());
  }

//GET MESSAGE
  Stream<QuerySnapshot> getMessage(String userId, String otherUserId) {
    List<String> ids = [userId, otherUserId];
    ids.sort();
    String chatRoomId = ids.join("_");
    return fireStore
        .collection('chat_room')
        .doc(chatRoomId)
        .collection('message')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
  //GET ALL USERS ID (DOC NAME)
  Future<List<String>> fetchUserIds()async{

    try{
      //QuerySnapshot use in query in collection data
      QuerySnapshot querySnapshot = await fireStore.collection('users').get();
      //store all the id into a list
      List<String> userIds = querySnapshot.docs.map((doc) => doc.id).toList();
      print("value from get all user ids where use map :${userIds[2]}");

      print("Data fetching value : ${ _isDataFetching.value}");
      return userIds;
    }catch(e){
      print("Error fetching user IDs: $e");
      _isDataFetching.value=false;
      return [];
    }
  }
  //GET USER DATA ACCORDING TO THEIR ID
  Future<UserModelRegistration?> fetchUserData(String userId) async{
    _isDataFetching.value=true;
    update();
    try{
      //DocumentSnapshot use in query inside doc
      DocumentSnapshot userSnapshot = await fireStore.collection('users').doc(userId).get();
      if(userSnapshot.exists){
        // Convert the document snapshot data to your UserModelRegistration object
        UserModelRegistration user = UserModelRegistration.fromSnap(userSnapshot);
        /*print(user.email);

        print(user.lastName);
        print(user.follower[0]);
        print(user.userName);
        print(user.firstName);*/
        _isDataFetching.value=false;
        update();

        return user;
      }else{

        return null; // User does not exist
      }
    }catch(e){
      print("Error fetching user data: $e");

      return null;
    }
  }
}
