import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.custom(
      gridDelegate: SliverQuiltedGridDelegate(
        crossAxisCount: 1, // Set crossAxisCount to 1 for a single column
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        repeatPattern: QuiltedGridRepeatPattern.inverted,
        pattern: const[
          QuiltedGridTile(1, 1),
          QuiltedGridTile(2, 1),
        ],
      ),
      childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => StaggeredTileItem1(index: index),
        childCount: 12,
      ),
    );
  }
}


class StaggeredTileItem1 extends StatelessWidget {
  final int index;

  const StaggeredTileItem1({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    // Adjust the size based on your requirements
    double tileHeight = index.isEven ? 200.0 : 100.0;

    return Container(
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
      ), // Adjust the color based on your requirements
      child: Center(
        child: Text('Item $index'),
      ),
    );
  }
}
