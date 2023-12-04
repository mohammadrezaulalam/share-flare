import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_gridview.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_listview.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

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
                        horizontal: 20.0), // Adjust the width of the indicator
                  ),
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.grid_view_outlined,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          // Add some spacing between icon and text
                          Text("Grid view"),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list,
                            color: Colors.black,
                          ),
                          SizedBox(width: 8),
                          // Add some spacing between icon and text
                          Text("List view"),
                        ],
                      ),
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
                ProfileGridView(),
                ProfileListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
