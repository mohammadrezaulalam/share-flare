import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/follower_tab.dart';
import 'package:share_flare/presentation/ui/widgets/profile/own_profile_header.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_tab.dart';

class FollowerScreen extends StatefulWidget {
  const FollowerScreen({super.key});

  @override
  State<FollowerScreen> createState() => _FollowerScreenState();
}

class _FollowerScreenState extends State<FollowerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              'My Follower',
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

                  ],
                ),
              ),
            ];
          },
          body: const FollowerTabBar(


          ),
        ),
      ),
    );
  }
}
