import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_gridview.dart';
import 'package:share_flare/presentation/ui/widgets/profile/profile_listview.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return  Column(
      children: <Widget>[
        Material(
           color: dark ? SFColors.darkBackgroundColor : SFColors.white,
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
            child: Stack(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator:  UnderlineTabIndicator(
                    borderSide: BorderSide(width: 2.0, color: dark ? SFColors.white : const Color(0xFF1D2939)),
                    insets: const EdgeInsets.symmetric(
                        horizontal: 29.0), // Adjust the width of the indicator
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
                            color: dark ? SFColors.white : const Color(0xFF1D2939),
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          // Add some spacing between icon and text
                          Text("Grid view", style: TextStyle(fontSize: 12,color: dark ? SFColors.white : const Color(0xFF1D2939)),),
                        ],
                      ),
                    ),
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.list,
                            color: dark ? SFColors.white : const Color(0xFF1D2939),
                        size: 16,
                          ),
                          const SizedBox(width: 8),
                          // Add some spacing between icon and text
                          Text("List view", style: TextStyle(fontSize: 12,color: dark ? SFColors.white : const Color(0xFF1D2939))),
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
