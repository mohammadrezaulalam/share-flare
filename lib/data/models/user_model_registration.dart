import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModelRegistration {
  String firstName;
  String lastName;
  String userName;
  String profilePhoto; // we are saving photo url not photo that's why string
  String email;
  String uid;

  UserModelRegistration(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.profilePhoto,
      required this.email,
      required this.uid});

  //convert to map for json
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid,
    };
  }

// convert a DocumentSnapshot from Firestore into a User model
  static UserModelRegistration fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModelRegistration(
      firstName: snapshot['email'],
      lastName: snapshot['lastName'],
      userName: snapshot['userName'],
      profilePhoto: snapshot['profilePhoto'],
      email: snapshot['email'],
      uid: snapshot['uid'],
    );
  }
}
