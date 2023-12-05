import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final TextEditingController _passTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool? check1 = false;
  bool hidePass = true;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Form(
                key: _formKey,
                child: SizedBox(
                  height: 400,
                  width: 295,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter your phone number and password",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 24),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        "Email",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                              controller: _emailTEController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1)),
                                filled: false,
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                hintText: "Email",
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.email_outlined),
                                  onPressed: () {},
                                ),
                              ),
                              validator: (String? emailText) {
                                if (emailText?.isEmpty ?? true) {
                                  return "Enter email address";
                                } else if (emailText!.isEmail == false) {
                                  return "Enter a valid address";
                                }
                                return null;
                              }),
                        ),
                      ),
                      const Text(
                        "Password",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: TextFormField(
                              controller: _passTEController,
                              obscureText: hidePass,
                              keyboardType: TextInputType.visiblePassword,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                enabledBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.blue, width: 1)),
                                contentPadding:
                                    const EdgeInsets.symmetric(vertical: 10),
                                hintText: "Password",
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.lock),
                                  onPressed: () {},
                                ),
                                suffixIcon: IconButton(
                                  icon: hidePass
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      hidePass = !hidePass;
                                    });
                                  },
                                ),
                              ),
                              validator: (String? passText) {
                                if (passText?.isEmpty ?? true) {
                                  return "Enter Password";
                                }
                                return null;
                              }),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 18,
                            width: 18,
                            child: Checkbox(
                                activeColor: Colors.blue, //only check box
                                value: check1, //unchecked
                                onChanged: (bool? value) {
                                  //value returned when checkbox is clicked
                                  setState(() {
                                    check1 = value;
                                  });
                                }),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Text("Save password")
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                  //to set border radius to button
                                  borderRadius: BorderRadius.circular(4)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                isLoading = true;
                                setState(() {});
                              }
                              // if (_formKey.currentState!.validate()) {
                              //   if (mounted) {
                              //     ScaffoldMessenger.of(context).showSnackBar(
                              //         const SnackBar(
                              //             content: Text("Log in Successful")));
                              //   }
                              // Get.to(()=>const HomeScreen());

                              //}
                            },
                            child: const Text(
                              "Create Account",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isLoading)
              const Opacity(
                opacity: 0.8,
                child: ModalBarrier(dismissible: true, color: Colors.white),
              ),
            if (isLoading)
              const Center(
                  child: CupertinoActivityIndicator(
                radius: 40.0, // Customize the size
                animating: true, // Control animation
                color: Colors.grey,
              )),
          ],
        ),
      ),
    );
  }
}
