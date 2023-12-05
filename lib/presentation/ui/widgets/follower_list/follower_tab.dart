import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/follower_list_tap.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/following_list.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_gridview.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_listview.dart';

class FollowerTabBar extends StatelessWidget {
  const FollowerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Material(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
            child: Stack(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: Colors.black),
                    insets: EdgeInsets.symmetric(
                        horizontal: 0.0), // Adjust the width of the indicator
                  ),
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      child:   Text("Following", style: TextStyle(fontSize: 12,),),
                    ),
                    Tab(
                      child:   Text("Follower", style: TextStyle(fontSize: 12,),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TabBarView(
              children: [
              FollowerListTap(),
                FollowingListTap()
              ],
            ),
          ),
        ),
      ],
    );
  }
}
