import 'package:flutter/material.dart';
import 'package:share_flare/data/models/fetch_followers_model.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

class FollowerListTap extends StatefulWidget {
  FollowerListTap({super.key, required this.followerList});

  FetchFollowerModel followerList;

  @override
  State<FollowerListTap> createState() => _FollowerListTapState();
}

class _FollowerListTapState extends State<FollowerListTap> {
  UserData user = UserData(isFollowedByMe: false);

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 16, left: 8.0, right: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 19,
                backgroundColor: Color(0xFFFFEB3B),
              ),
              const SizedBox(
                width: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.followerList.firstName.toString() +
                        widget.followerList.lastName.toString(),
                    style: TextStyle(
                        fontSize: 14,
                        color: dark ? SFColors.white : const Color(0xFF1D2939),
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 0,
                  ),
                  const RoundDivider(),
                  const Text(
                    "Follow",
                    style: TextStyle(
                      color: Color(0XFF6993FF),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: 70,
              ),
              Expanded(
                child: GestureDetector(
                    onTap: () {
                      setState(() {
                        user.isFollowedByMe = !user.isFollowedByMe;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(microseconds: 300),
                      height: 34,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: Colors.transparent,
                          )),
                      child: Center(
                        child: GestureDetector(
                            onTap: () {
                              _followRemoveShowBottomSheet(context);
                              setState(() {});
                            },
                            child: const Text(
                              'Remove',
                              style: TextStyle(
                                  color: Color(0XFF1D2939),
                                  fontWeight: FontWeight.w600),
                            )),
                      ),
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _followRemoveShowBottomSheet(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(11), topRight: Radius.circular(11)),
        ),
        context: context,
        builder: (context) {
          return SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CircleAvatar(
                        radius: 19,
                        backgroundColor: Color(0xFFFFEB3B),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Md Shagor",
                            style: TextStyle(
                                fontSize: 14,
                                color: dark
                                    ? Colors.white
                                    : const Color(0xFF1D2939),
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Divider(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Remove',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.red),
                    )),
              ],
            ),
          );
        });
  }
}

class UserData {
  bool isFollowedByMe;

  UserData({required this.isFollowedByMe});
}
