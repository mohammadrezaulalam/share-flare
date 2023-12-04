import 'package:flutter/material.dart';

class RoundDivider extends StatelessWidget {
  const RoundDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0, right: 4.0),
      child: Container(
        width: 4.0,
        height: 4.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey,), // You can set the color of the dot
      ),
    );
  }
}