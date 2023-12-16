import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_flare/presentation/state_holders/auth_controller.dart';

import 'package:share_flare/application/state_holder_binder.dart';
import 'package:share_flare/data/utllity/responsive_helper.dart';
import 'package:share_flare/presentation/ui/screens/welcome_screen.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
//import '../presentation/ui/utilities/colors.dart';

import '../presentation/ui/screens/chat_screen.dart';
import '../presentation/ui/screens/main_bottom_nav_screen.dart';
import '../presentation/ui/utilities/auth_constant.dart';

import '../presentation/ui/utilities/theme/theme.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AuthController auth = Get.put(AuthController());
  // This widget is the root of your application.
  void isLoggedIn() async{
    print("before condition in welcome screen");
    await auth.getAuthStatus()?Get.offAll(()=>const MainBottomNavScreen(camera: true,)):null;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedIn();
  }
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
      // home: const ChatScreen(userName: 'Ismail',),
    );
  }
}
