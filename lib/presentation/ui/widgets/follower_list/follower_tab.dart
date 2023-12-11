import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/utilities/theme/theme.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/follower_listview.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/following_listview.dart';


class FollowerTabBar extends StatelessWidget {
  const FollowerTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = SFAppTheme.isDarkMode(context);
    return  Column(
      children: <Widget>[
        Material(
        color:   dark ?  const Color(0xFF1D2939): SFColors.white,
          child:  Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
            child: Stack(
              children: [
                TabBar(

                  labelColor: Colors.black,
                  unselectedLabelColor: dark ? const Color(0xFF1D2939): const Color(0xFF1D2939),
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding: const EdgeInsets.only(right: 15),
                  splashFactory: NoSplash.splashFactory,
                  indicatorWeight: 1,
                  indicator: UnderlineTabIndicator(
                    borderSide: BorderSide(width: 1.0, color: dark ? SFColors.white : const Color(0xFF667085)),
                    insets: const EdgeInsets.symmetric(
                        horizontal: 0.0), // Adjust the width of the indicator
                  ),
                  indicatorColor: Colors.black,
                  tabs: [
                    Tab(
                      child:   Text("Following", style: TextStyle(fontSize: 13, color: dark ? SFColors.white : const Color(0xFF1D2939),fontWeight: FontWeight.w600),),
                    ),
                    Tab(
                      child:   Text("Follower", style: TextStyle(fontSize: 13, color: dark ? SFColors.white : const Color(0xFF1D2939),fontWeight: FontWeight.w600),),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        const Expanded(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: TabBarView(
              children: [
                FollowingListView(),
                FollowerListView(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
