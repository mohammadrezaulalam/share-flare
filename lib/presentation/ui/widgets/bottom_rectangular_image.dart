import 'package:flutter/material.dart';
import 'package:share_flare/presentation/ui/utilities/assets_path.dart';

class BottomRectangularImage extends StatelessWidget {
  const BottomRectangularImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Image.asset(
          SFAssetsPath.rectangleImage,
        ),
      ),
    );
  }
}
