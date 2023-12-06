import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:share_flare/data/utllity/responsive_helper.dart';
import 'package:share_flare/presentation/ui/utilities/colors.dart';
import 'package:share_flare/presentation/ui/widgets/app_title.dart';
import 'package:share_flare/presentation/ui/widgets/bottom_rectangular_image.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isShowPassword = false;
  bool isShowRepeatPassword = false;
  final TextEditingController emailTE = TextEditingController();
  final TextEditingController passwordTE = TextEditingController();
  final TextEditingController rePasswordTE = TextEditingController();
  final TextEditingController firstNameTE = TextEditingController();
  final TextEditingController lastNameTE = TextEditingController();
  final TextEditingController userNameTE = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _passwordsMatch = false;
  String? emailCheck;
  String? passwordCheck;
  String? reEnterpasswordCheck;
  String? firstNameCheck;
  String? lastNameCheck;
  String? userNameCheck;

  bool isButtonEnable() {
    bool check = (emailCheck?.isNotEmpty ?? false) &&
        (passwordCheck?.isNotEmpty ?? false) &&
        (reEnterpasswordCheck?.isNotEmpty ?? false) &&
        (firstNameCheck?.isNotEmpty ?? false) &&
        (lastNameCheck?.isNotEmpty ?? false) &&
        (userNameCheck?.isNotEmpty ?? false);

    return check;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: SFColors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          color: SFColors.white, // Set the background color explicitly
        ),
        backgroundColor: SFColors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.black54,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.screenWidth * 0.1,
          vertical: ResponsiveHelper.screenHeight * 0.015,
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppTitle(),
                const SizedBox(
                  height: 25,
                ),
                //first name
                const Text('First Name'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  onChanged: (value) {
                    firstNameCheck = value;
                    setState(() {});
                  },
                  controller: firstNameTE,
                  decoration: const InputDecoration(
                    hintText: 'Input your first name',
                    // prefixIcon: Icon(Icons.email),

                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //last name
                const Text('Last Name'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: lastNameTE,
                  onChanged: (value) {
                    lastNameCheck = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: 'Input your last name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //user Name
                const Text('User Name'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: userNameTE,
                  onChanged: (value) {
                    userNameCheck = value;
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                    hintText: 'Input your user name',
                    prefixIcon: Icon(Icons.person),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                //email
                const Text('Email'),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                    controller: emailTE,
                    onChanged: (value) {
                      emailCheck = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                      hintText: 'Input Email',
                      // prefixIcon: Icon(Icons.email),

                      prefixIcon: Icon(Icons.email),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email address';
                      } else if (!RegExp(
                              r'^[a-zA-Z0-9.+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]+$')
                          .hasMatch(value)) {
                        return 'Invalid email address';
                      } else {
                        return null;
                      }
                    }),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: passwordTE,
                  onChanged: (value) {
                    passwordCheck = value;
                    setState(() {});
                  },
                  obscureText: isShowPassword,
                  decoration: InputDecoration(
                    hintText: 'Input Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          isShowPassword = !isShowPassword;
                        });
                      },
                      child: isShowPassword
                          ? const Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.black,
                            )
                          : const Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.black,
                            ),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),

                //re-enter password
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Repeat-Password',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),

                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: rePasswordTE,
                  onChanged: (value) {
                    reEnterpasswordCheck = value;
                    if (passwordTE.text == value) {
                      _passwordsMatch = true;
                    }
                    if (passwordTE.text != value) {
                      _passwordsMatch = false;
                    }
                    setState(() {});
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 're-enter your password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: reEnterpasswordCheck?.isNotEmpty ?? false
                        ? _passwordsMatch
                            ? Icon(Icons.check, color: Colors.green)
                            : Icon(Icons.close, color: Colors.red)
                        : null,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    } else if (value != passwordTE.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      isButtonEnable()
                          ? Get.snackbar(
                              'Success',
                              'Requesting in server',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.blue,
                              colorText: Colors.white,
                            )
                          : null;

                      if (!_formKey.currentState!.validate()) {
                        return;
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: isButtonEnable()
                            ? SFColors.buttonActiveColor
                            : SFColors.buttonDisableColor),
                    child: Text("NEXT"),
                  ),
                ),

                const SizedBox(
                  height: 30,
                  child: BottomRectangularImage(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
