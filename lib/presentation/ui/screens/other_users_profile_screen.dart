import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/profile/other_users_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_gridview.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_listview.dart';
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'Ostad_app',
              style: TextStyle(color: Colors.black),
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black54,
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
