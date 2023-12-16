import 'package:flutter/material.dart';
import 'package:share_flare/data/models/fetch_followers_model.dart';
import 'package:share_flare/presentation/ui/utilities/auth_constant.dart';
import 'package:share_flare/presentation/ui/widgets/custom_search_bar.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/following_list_tap.dart';

class FollowingListView extends StatelessWidget {
  FollowingListView({super.key, required this.followingList});

  List followingList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: CustomSearchBar(),
        ),
        const SizedBox(
          height: 20,
        ),
        Expanded(
          child: ListView.builder(
              itemCount: followingList.length,
              itemBuilder: (context, index) {
                FetchFollowerModel followers =
                    followUserController.userList[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: FollowingListTap(
                    followingList: followers,
                  ),
                );
              }),
        ),
      ],
    );
  }
}
