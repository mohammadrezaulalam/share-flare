import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/ui/screens/home_page.dart';
import 'package:share_flare/application/state_holder_binder.dart';
import 'package:share_flare/presentation/ui/screens/main_bottom_nav_screen.dart';



//import '../presentation/ui/utilities/colors.dart';
import '../presentation/ui/utilities/theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       initialBinding: StateHolderBinder(),
      debugShowCheckedModeBanner: false,
      title: 'Share Flare',
      theme: SFAppTheme.lightTheme,
      darkTheme: SFAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: MainBottomNavScreen(),
    );
  }

}