import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelRegistration {
  String firstName;
  String lastName;
  String userName;
  String profilePhoto; // we are saving photo url not photo that's why string
  String email;
  String uid;
  List follower;
  List following;


  UserModelRegistration(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.profilePhoto,
      required this.email,
      required this.uid,
      required this.follower,
        required this.following
      });

  //convert to map for json
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid,
      'follower':follower,
      'following':following
    };
  }

// convert a DocumentSnapshot from Firestore into a User model
  static UserModelRegistration fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModelRegistration(
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      userName: snapshot['userName'],
      profilePhoto: snapshot['profilePhoto'],
      email: snapshot['email'],
      uid: snapshot['uid'],
        follower:snapshot['follower'],
        following:snapshot['following']

    );
  }
}
