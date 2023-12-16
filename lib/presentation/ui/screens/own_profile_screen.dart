import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/user_controller.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/profile/other_users_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/own_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_tab.dart';

import '../utilities/colors.dart';

class OwnProfileScreen extends StatefulWidget {
  const OwnProfileScreen({super.key, required this.uid});
  final String uid;

  @override
  State<OwnProfileScreen> createState() => _OwnProfileScreenState();
}

class _OwnProfileScreenState extends State<OwnProfileScreen> {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      userProfileController.userData;
      userProfileController.listenToUserInfo();
      userProfileController.getUserData(widget.uid);
    });
  }

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Obx(() {
      return Visibility(
        visible: userProfileController.fetchUserModel.profilePhoto != null &&
            !userProfileController.isDataLoading,
        replacement: const Center(
          child: Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                  // color: Colors.red,
                  ),
            ),
            backgroundColor: Colors.white,
          ),
        ),
        child: Scaffold(
          backgroundColor: dark ? SFColors.darkBackgroundColor : SFColors.white,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(62),
            child: AppBar(
              flexibleSpace: Container(
                // color: SFColors.white,
                color: dark ? const Color(0xFF1D2939) : SFColors.white,
              ),
              backgroundColor: dark ? const Color(0xFF1D2939) : SFColors.white,
              title: Center(
                child: Text(
                  '${userProfileController.userData['userName']} Profile',
                  style: TextStyle(
                      color: dark ? SFColors.white : const Color(0xFF1D2939),
                      fontWeight: FontWeight.w700),
                ),
              ),
              elevation: 0,
            ),
          ),
          body: Container(
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
                          //userProfileController.activeUserUid == widget.uid
                          FirebaseAuth.instance.currentUser!.uid == widget.uid
                              ? OwnProfileHeaderWidget(
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
                                  follower: userProfileController.followers,
                                  following: userProfileController.following,
                                )
                              : OtherUserProfielHeader(
                                  selectedProfileId: userProfileController
                                      .currentProfileId
                                      .toString(),
                                  fullName:
                                      userProfileController.fullName.toString(),
                                  userName: userProfileController
                                      .userData['userName']
                                      .toString(),
                                  profilePhoto: userProfileController
                                      .userData['profilePhoto']
                                      .toString(),
                                  follower: userProfileController.followers,
                                  following: userProfileController.following,
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
          ),
        ),
      );
    });
  }
}
