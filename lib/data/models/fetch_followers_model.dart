class FetchFollowerModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? profilePhoto; // we are saving photo url not photo that's why string
  String? email;
  String? uid;
  List? follower;
  List? following;

  FetchFollowerModel(
      {this.firstName,
      this.lastName,
      this.userName,
      this.profilePhoto,
      this.email,
      this.uid,
      this.follower,
      this.following});

  //convert to map for json
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'userName': userName,
      'profilePhoto': profilePhoto,
      'email': email,
      'uid': uid,
      'follower': follower,
      'following': following
    };
  }

  /// For fetching List of Users
  factory FetchFollowerModel.fromJson(Map<String, dynamic> json) {
    return FetchFollowerModel(
      firstName: json['firstName'],
      lastName: json['lastName'],
      userName: json['userName'],
      profilePhoto: json['profilePhoto'],
      email: json['email'],
      uid: json['uid'],
      follower: json['follower'],
      following: json['following'],
    );
  }
}
