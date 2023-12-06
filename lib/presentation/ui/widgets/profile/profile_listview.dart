import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProfileListView extends StatelessWidget {
  const ProfileListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  MasonryGridView.builder(
        itemCount: 11,
      mainAxisSpacing: 10,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1),
        itemBuilder: (context, index) =>
            Container(decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), // Adjust the radius as needed
            ),
    child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                    'assets/images/img_${index + 1}.png',fit: BoxFit.cover,),
              ),
            ),

    );
  }
}


// class StaggeredTileItem1 extends StatelessWidget {
//   final int index;
//
//   const StaggeredTileItem1({super.key, required this.index});
//
//   @override
//   Widget build(BuildContext context) {
//     // Adjust the size based on your requirements
//     double tileHeight = index.isEven ? 200.0 : 100.0;
//
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.yellow,
//         borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
//       ), // Adjust the color based on your requirements
//       child: Center(
//         child: Text('Item $index'),
//       ),
//     );
//   }
// }
