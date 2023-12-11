import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/widgets/post/post_location_button.dart';

import 'post_music_button.dart';


class PostLocationButtonListView extends StatelessWidget {
  const PostLocationButtonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 30,
              width: 109,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (context, index) => const PostLocationButton(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


