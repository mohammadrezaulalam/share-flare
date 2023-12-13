import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/user_controller.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/profile/own_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_tab.dart';

import '../utilities/colors.dart';

class OwnProfileScreen extends StatefulWidget {
  const OwnProfileScreen({super.key});

  @override
  State<OwnProfileScreen> createState() => _OwnProfileScreenState();
}

class _OwnProfileScreenState extends State<OwnProfileScreen> {
  final UserProfileController userProfileController =
      Get.put(UserProfileController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Get.find<UserProfileController>().listenToUserInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Obx(() {
      return Visibility(
        visible: userProfileController.isData.value,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: Scaffold(
            backgroundColor:
                dark ? SFColors.darkBackgroundColor : SFColors.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(62),
              child: AppBar(
                flexibleSpace: Container(
                  // color: SFColors.white,
                  color: dark ? const Color(0xFF1D2939) : SFColors.white,
                ),
                backgroundColor:
                    dark ? const Color(0xFF1D2939) : SFColors.white,
                title: Center(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        color: dark ? SFColors.white : const Color(0xFF1D2939),
                        fontWeight: FontWeight.w700),
                  ),
                ),
                elevation: 0,
              ),
            ),
            body: Obx(() {
              if (userProfileController.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Container(
                  color: dark ? SFColors.darkBackgroundColor : SFColors.white,
                  child: DefaultTabController(
                    length: 2,
                    child: NestedScrollView(
                      headerSliverBuilder: (context, _) {
                        return [
                          SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                //ownProfileHeaderWidget(context),
                                OwnProfileHeaderWidget(
                                  firstName: userProfileController
                                      .fetchUserModel.firstName
                                      .toString(),
                                  lastName: userProfileController
                                      .fetchUserModel.lastName
                                      .toString(),
                                  userName: userProfileController
                                      .fetchUserModel.userName
                                      .toString(),
                                  profilePhoto: userProfileController
                                      .fetchUserModel.profilePhoto
                                      .toString(),
                                  follower: userProfileController
                                          .fetchUserModel.follower ??
                                      [],
                                  following: userProfileController
                                          .fetchUserModel.following ??
                                      [],
                                ),
                                Divider(
                                    thickness: 7,
                                    color: dark
                                        ? SFColors.darkBackgroundColor
                                        : Colors.grey[100]),
                              ],
                            ),
                          ),
                        ];
                      },
                      body: const ProfileTabBar(),
                    ),
                  ),
                );
              }
            })),
      );
    });
  }
}
