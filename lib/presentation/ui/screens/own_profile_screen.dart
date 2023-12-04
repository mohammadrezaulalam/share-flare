import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/profile/own_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_gridview.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_listview.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_tab.dart';
// import 'package:iconsax/iconsax.dart';

class OwnProfileScreen extends StatefulWidget {
  const OwnProfileScreen({super.key});

  @override
  State<OwnProfileScreen> createState() => _OwnProfileScreenState();
}

class _OwnProfileScreenState extends State<OwnProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          backgroundColor: Colors.white,
          title: const Center(
            child: Text(
              'My Profile',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
            ),
          ),
          elevation: 0,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    ownProfileHeaderWidget(context),
                    Divider(thickness: 8, color: Colors.grey[100]),
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
