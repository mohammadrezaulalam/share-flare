import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

class OtherUserProfielHeader extends StatefulWidget {
  OtherUserProfielHeader({
    super.key,
    required this.fullName,
    required this.userName,
    required this.profilePhoto,
    required this.follower,
    required this.following,
  });

  String fullName;
  String userName;
  String profilePhoto;
  int following;
  int follower;

  @override
  State<OtherUserProfielHeader> createState() => _OtherUserProfielHeaderState();
}

class _OtherUserProfielHeaderState extends State<OtherUserProfielHeader> {
  @override
  Widget build(BuildContext context) {
    //widget.follower
    final dark = SFAppTheme.isDarkMode(context);
    return Container(
      width: double.infinity,
      decoration:
          BoxDecoration(color: dark ? const Color(0xFF1D2939) : SFColors.white),
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 45,
                  backgroundImage: NetworkImage(widget.profilePhoto.toString()),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Row(
                          children: [
                            Text(
                              "23",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              width: 3,
                            ),
                            Text(
                              "Posts",
                              style: TextStyle(
                                fontSize: 10,
                                letterSpacing: 0.4,
                              ),
                            )
                          ],
                        ),
                        const RoundDivider(),
                        Row(
                          children: [
                            Text(
                              widget.following.toString(),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "Following",
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        const RoundDivider(),
                        Row(
                          children: [
                            Text(
                              widget.follower.toString(),
                              style: const TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            const Text(
                              "Follower",
                              style: TextStyle(
                                letterSpacing: 0.4,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.userName,
                      style: const TextStyle(
                        letterSpacing: 0.4,
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Add your follow button logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            // Set the button color to light grey
                            minimumSize: const Size(15, 30),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    4)), // Set the minimum size of the button
                          ),
                          child: userProfileController.isFollowing
                              ? InkWell(
                                  onTap: () async {
                                    //print('Unfollow Button Pressed');
                                    userProfileController.followUser(
                                        FirebaseAuth.instance.currentUser!.uid,
                                        userProfileController.userData['uid']);
                                    setState(() {
                                      userProfileController.isFollowing = false;
                                      widget.follower--;
                                    });
                                  },
                                  child: const Text(
                                    "Unfollow",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                )
                              : InkWell(
                                  onTap: () async {
                                    //print('Follow Button Pressed');
                                    userProfileController.followUser(
                                        FirebaseAuth.instance.currentUser!.uid,
                                        userProfileController.userData['uid']);
                                    setState(() {
                                      userProfileController.isFollowing = true;
                                      widget.follower++;
                                    });
                                  },
                                  child: const Text(
                                    "Follow",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 12),
                                  ),
                                ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // Add your follow button logic here
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey[200],
                            // Set the button color to light grey
                            minimumSize: const Size(15, 30),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4)),
                            elevation: 0, // Set the minimum size of the button
                          ),
                          child: const Text(
                            "Message",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
