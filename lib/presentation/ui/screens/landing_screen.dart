import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shareflare/presentation/ui/screens/login_screen.dart';

import 'login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            height: 156,
            width: 295,
            child: Column(
              children: [
                Text(
                  "ShareFlare",
                  style: GoogleFonts.lobster(
                      textStyle: const TextStyle(fontSize: 32)),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 36,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                            //to set border radius to button
                            borderRadius: BorderRadius.circular(4)),
                      ),
                      onPressed: () {},
                      child: const Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                TextButton(
                    onPressed: () {
                      Get.offAll(() => const LoginScreen());
                    },
                    child: const Text("Log in",
                        style: TextStyle(color: Colors.blue)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
