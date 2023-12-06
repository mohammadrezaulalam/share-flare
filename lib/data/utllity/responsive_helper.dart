// responsive_helper.dart
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static late double screenWidth;
  static late double screenHeight;

  static void initialize(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
  }
}
