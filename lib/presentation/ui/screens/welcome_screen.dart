import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:share_flare/data/utllity/responsive_helper.dart';
import 'package:share_flare/presentation/ui/screens/auth/registration_screen.dart';
import 'package:share_flare/presentation/ui/widgets/app_title.dart';
import 'package:share_flare/presentation/ui/widgets/bottom_rectangular_image.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white, // Set your desired background color here
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.screenWidth * 0.1,
          vertical: ResponsiveHelper.screenHeight * 0.015,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              const AppTitle(),
              SizedBox(
                height: ResponsiveHelper.screenHeight * 0.05,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                  ),
                  onPressed: () {
                    Get.to(() => const RegistrationScreen());
                  },
                  child: const Text(
                    "Create Account",
                    // style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Get.to(()=>const SignInScreen());
                    },
                    child: const Text("Log In"),
                  ),
                  /*    GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.keyboard_arrow_down_sharp,
                      color: Colors.blueAccent,
                    ),
                  ) */
                ],
              ),
              const BottomRectangularImage(),
            ],
          ),
        ),
      ),
    );
  }
}
