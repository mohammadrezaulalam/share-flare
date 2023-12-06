import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/data/utllity/responsive_helper.dart';
import 'package:share_flare/presentation/ui/screens/home_page.dart';
import 'package:share_flare/application/state_holder_binder.dart';
import 'package:share_flare/presentation/ui/screens/welcome_screen.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
//import '../presentation/ui/utilities/colors.dart';
import '../presentation/ui/utilities/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ResponsiveHelper.initialize(
        context); // initialize responsive class width and height
    // Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
    return GetMaterialApp(
      initialBinding: StateHolderBinder(),
      debugShowCheckedModeBanner: false,
      title: 'Share Flare',
      theme: SFAppTheme.lightTheme(context),
      darkTheme: SFAppTheme.darkTheme(context),
      themeMode: ThemeMode.system,
      // home: const HomePage(),
      home: const WelcomeScreen(),
    );
  }
}
