import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/custom_search_bar.dart';
import 'package:share_flare/presentation/ui/widgets/follower_list/following_list_tap.dart';


class FollowingListView extends StatelessWidget {
  const FollowingListView({super.key});

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
            itemCount: 11,
            itemBuilder: (context, index) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
              ),
              child: const FollowingListTap(),
            ),
          ),
        ),
      ],
    );
  }
}


