import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/screens/follower_screen.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/round_divider.dart';

Widget ownProfileHeaderWidget(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 45,
                backgroundColor: Color(0xFFFFEB3B),
              ),
              const SizedBox(
                width: 6,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Jhon Doe",
                    style: TextStyle(
                      color: dark ? SFColors.white : const Color(0xFF1D2939),
                      letterSpacing: 0.4,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "@jhon324",
                    style: TextStyle(
                      color: dark ? SFColors.white : const Color(0xFF1D2939),
                      letterSpacing: 0.4,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Text(
                            "23",
                            style: TextStyle(
                              color: dark
                                  ? SFColors.white
                                  : const Color(0xFF1D2939),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            "Posts",
                            style: TextStyle(
                              color: dark
                                  ? SFColors.white
                                  : const Color(0xFF1D2939),
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
                            "125",
                            style: TextStyle(
                              color: dark
                                  ? SFColors.white
                                  : const Color(0xFF1D2939),
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const FollowerScreen(isFollowerTab: false,));
                            },
                            child: Text(
                              "Following",
                              style: TextStyle(
                                color: dark
                                    ? SFColors.white
                                    : const Color(0xFF1D2939),
                                letterSpacing: 0.4,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                      const RoundDivider(),
                      Row(
                        children: [
                          Text(
                            "234",
                            style: TextStyle(
                              color: dark
                                  ? SFColors.white
                                  : const Color(0xFF1D2939),
                              letterSpacing: 0.4,
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                () => const FollowerScreen(isFollowerTab: true,),
                              );
                            },
                            child: Text(
                              "Follower",
                              style: TextStyle(
                                color: dark
                                    ? SFColors.white
                                    : const Color(0xFF1D2939),
                                letterSpacing: 0.4,
                                fontSize: 10,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 15,
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
