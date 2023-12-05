import 'package:flutter/material.dart';

import '../colors.dart';

class SFAppTheme{
  SFAppTheme._();
  static bool isDarkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
  static ThemeData lightTheme = ThemeData(
      //useMaterial3: true,
      //fontFamily: 'Poppins',
      brightness: Brightness.light,
      scaffoldBackgroundColor: SFColors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: SFColors.white

    ),
  );

  static ThemeData darkTheme = ThemeData(
      //useMaterial3: true,
      //fontFamily: 'Poppins',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: SFColors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: SFColors.black,
    ),

  );
}