import 'package:flutter/material.dart';
import 'package:share_flare/data/models/fetch_followers_model.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';

class FollowingListTap extends StatefulWidget {
  FollowingListTap({super.key, required this.followingList});

  FetchFollowerModel followingList;
  //List followingList;

  @override
  State<FollowingListTap> createState() => _FollowingListTapState();
}

class _FollowingListTapState extends State<FollowingListTap> {
  UserData user = UserData(isFollowedByMe: false);

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 19,
                backgroundColor: Color(0xFFFFEB3B),
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.followingList.firstName.toString() +
                        widget.followingList.lastName.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: dark ? SFColors.white : const Color(0xFF1D2939),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const Text(
                    "@shagor06",
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              // const SizedBox(
              //   width: 125,
              // ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                        onTap: () {
                          setState(() {
                            user.isFollowedByMe = !user.isFollowedByMe;
                          });
                        },
                        child: AnimatedContainer(
                          duration: Duration(microseconds: 300),
                          height: 40,
                          //width: ,
                          decoration: BoxDecoration(
                              color: user.isFollowedByMe
                                  ? Colors.grey[200]
                                  : Color(0xFF6993FF),
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: user.isFollowedByMe
                                    ? Colors.white24
                                    : Colors.transparent,
                              )),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 20),
                              child: Text(
                                user.isFollowedByMe ? 'Unfollow' : 'Follow',
                                style: TextStyle(
                                    color: user.isFollowedByMe
                                        ? Colors.black
                                        : Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
            thickness: 0, color: dark ? Colors.grey[200] : Colors.grey[300]),
      ],
    );
  }
}

class UserData {
  bool isFollowedByMe;

  UserData({required this.isFollowedByMe});
}
