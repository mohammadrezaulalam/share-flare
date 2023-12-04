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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: SizedBox(
              height: 360,
              width: 295,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Enter your phone number and password",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 24),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Email",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 45,
                    width: double.infinity,
                    child: TextFormField(
                        controller: _emailTEController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1)),
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
                  const SizedBox(
                    height: 12,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    height: 45,
                    width: double.infinity,
                    child: TextFormField(
                        controller: _passTEController,
                        obscureText: hidePass,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          disabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1)),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.blue, width: 1)),
                          filled: false,
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
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                          activeColor: Colors.blue, //only check box
                          value: check1, //unchecked
                          onChanged: (bool? value) {
                            //value returned when checkbox is clicked
                            setState(() {
                              check1 = value;
                            });
                          }),
                      const Text("Save password")
                    ],
                  ),
                  const SizedBox(
                    height: 8,
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
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("Log in Successful")));
                          }
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
      ),
    );
  }
}
