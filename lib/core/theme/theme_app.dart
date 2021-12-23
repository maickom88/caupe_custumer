import 'package:flutter/material.dart';

import 'theme.dart';

class ThemeApp {
  static TextTheme textTheme() => TextTheme();

  static ThemeData theme() {
    return ThemeData(
      fontFamily: AppTypography.fontFamily,
      primarySwatch: Colors.purple,
      primaryColor: AppColor.primaryColor,
      secondaryHeaderColor: AppColor.secondaryColor,
      appBarTheme: buildAppBarTheme(),
      inputDecorationTheme: buildInputDecorationTheme(),
      elevatedButtonTheme: buildElevatedButtonThemeData(),
    );
  }

  static AppBarTheme buildAppBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColor.primaryColor,
      ),
    );
  }

  static InputDecorationTheme buildInputDecorationTheme() {
    return InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }

  static ElevatedButtonThemeData buildElevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(AppTypography.t18()),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 15, vertical: 13)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: AppDefault.defaultBorderRadius(radius: 10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          Color(0xff303030),
        ),
      ),
    );
  }
}
