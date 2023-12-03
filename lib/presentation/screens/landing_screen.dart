import 'package:flutter/material.dart';

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
                const Text("Shareflare"),
                const SizedBox(height: 40,),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder( //to set border radius to button
                            borderRadius: BorderRadius.circular(4)
                        ),
                      ),
                      onPressed: () {},
                      child: const Text("Create Account",style: TextStyle(color: Colors.white),)),
                ),
                TextButton(onPressed: () {}, child: const Text("Log in",style: TextStyle(color: Colors.blue)))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
