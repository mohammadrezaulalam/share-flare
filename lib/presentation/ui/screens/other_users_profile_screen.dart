import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/profile/other_users_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_tab.dart';
// import 'package:iconsax/iconsax.dart';

class OtherUsersProfileScreen extends StatefulWidget {
  const OtherUsersProfileScreen({super.key});

  @override
  State<OtherUsersProfileScreen> createState() =>
      _OtherUsersProfileScreenState();
}

class _OtherUsersProfileScreenState extends State<OtherUsersProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? SFColors.darkBackgroundColor : SFColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            flexibleSpace: Container(
              color: dark
                  ? const Color(0xFF1D2939)
                  : SFColors.white, // Set the background color explicitly
            ),
            backgroundColor: dark ? const Color(0xFF1D2939) : SFColors.white,
            title: Text(
              'Ostad_app',
              style: TextStyle(
                  color: dark ? SFColors.white : const Color(0xFF1D2939)),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: dark ? SFColors.white : const Color(0xFF1D2939),
              ),
            )),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    otherProfilesHeaderWidget(context),
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
}
