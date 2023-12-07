import 'package:flutter/material.dart';
class AppTitle extends StatelessWidget {
  const AppTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      'ShareFlare',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontFamily: 'Lobster',
        fontWeight: FontWeight.w500,
      ),
    );
  }
}