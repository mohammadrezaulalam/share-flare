import 'package:flutter/material.dart';

import '../colors.dart';

class SFAppTheme{
  SFAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      //fontFamily: 'Poppins',
      brightness: Brightness.light,
      scaffoldBackgroundColor: SFColors.white,
  );

  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      //fontFamily: 'Poppins',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: SFColors.black,
  );
}