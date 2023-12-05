import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/screens/follower_screen.dart';
import 'package:share_flare/presentation/ui/screens/notification_screen.dart';
import 'package:share_flare/presentation/ui/screens/own_profile_screen.dart';
import 'package:share_flare/presentation/ui/widgets/notification/custom_follow_notification.dart';

import '../presentation/ui/utilities/colors.dart';
import '../presentation/ui/utilities/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Share Flare',
      theme: SFAppTheme.lightTheme,
      darkTheme: SFAppTheme.darkTheme,
      home:   FollowerScreen(),
    );
  }
}