import 'package:flutter/material.dart';

import '../colors.dart';

class SFAppTheme {
  SFAppTheme._();

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: SFColors.white,
      //make Satoshi as a default text family for all over the app
      textTheme: Theme.of(context).textTheme.apply(fontFamily: "Satoshi"),
      //elevated button
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: SFColors.buttonActiveColor,
          foregroundColor: SFColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          textStyle: const TextStyle(
            fontFamily: 'Satoshi',
            letterSpacing: 0.8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      //text button
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: SFColors.buttonActiveColor,
          textStyle: const TextStyle(
            fontFamily: 'Satoshi',
            letterSpacing: 0.8,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
       //TextFormField style
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 118, 208, 226)),
              borderRadius: BorderRadius.circular(4)),
          enabledBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 118, 208, 226)),
              borderRadius: BorderRadius.circular(4)),
          focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color.fromARGB(255, 118, 208, 226)),
              borderRadius: BorderRadius.circular(4)),
        ),
      appBarTheme: const AppBarTheme(
        backgroundColor: SFColors.white,
      ),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: SFColors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: SFColors.black,
      ),
    );
  }
}
