import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/profile/own_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_tab.dart';

import '../utilities/colors.dart';
// import 'package:iconsax/iconsax.dart';

class OwnProfileScreen extends StatefulWidget {
  const OwnProfileScreen({super.key});

  @override
  State<OwnProfileScreen> createState() => _OwnProfileScreenState();
}

class _OwnProfileScreenState extends State<OwnProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return Scaffold(
      backgroundColor: dark ? SFColors.darkBackgroundColor : SFColors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          backgroundColor: dark ? const Color(0xFF1D2939) : SFColors.white,
          title: Center(
            child: Text(
              'My Profile',
              style:
                  TextStyle(color: dark ? SFColors.white : const Color(0xFF1D2939), fontWeight: FontWeight.w700),
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
                      ownProfileHeaderWidget(context),
                      Divider(thickness: 7, color: dark? SFColors.darkBackgroundColor : Colors.grey[100]),
                    ],
                  ),
                ),
              ];
            },
            body: const ProfileTabBar(),
          ),
        ),
      ),
    );
  }
}
