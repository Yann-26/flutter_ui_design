import 'package:flutter/material.dart';
import 'package:app_use/ui/styles/colors.style.dart';
import 'package:app_use/ui/styles/constants.style.dart';

abstract class AppTheme {
  static ThemeData light = ThemeData(
    shadowColor: primaryColor.withOpacity(0.25),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    // fontFamily: "Avenir",
    scaffoldBackgroundColor: backgroundColor,
    backgroundColor: backgroundColor,
    canvasColor: canvasColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: backgroundColor,
      titleTextStyle: TextStyle(
        color: secondaryColor,
        fontSize: 20,
      ),
      iconTheme: IconThemeData(color: secondaryColor),
      actionsIconTheme: IconThemeData(color: secondaryColor),
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 18,
        color: darkColor,
      ),
      displayMedium: TextStyle(
        fontSize: 15,
        color: darkColor,
      ),
      displaySmall: TextStyle(
        fontSize: 15,
        color: darkColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 30,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headlineMedium: TextStyle(
        fontSize: 27,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      headlineSmall: TextStyle(
        fontSize: 24,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 25,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 21,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 18,
        color: primaryColor,
        fontWeight: FontWeight.bold,
      ),
      bodyLarge: TextStyle(
        fontSize: 20,
        color: darkColor,
      ),
      bodyMedium: TextStyle(
        fontSize: 17,
        color: darkColor,
      ),
      bodySmall: TextStyle(
        fontSize: 14,
        color: darkColor,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        color: textSecondaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: textSecondaryColor,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        color: textSecondaryColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.5),
        ),
        elevation: 12.0,
        textStyle: const TextStyle(color: backgroundColor),
        minimumSize: BUTTON_MIN_SIZE,
        maximumSize: BUTTON_MAX_SIZE,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: primaryColor,
        side: const BorderSide(
          color: primaryColor,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22.5),
        ),
        elevation: 0,
        textStyle: const TextStyle(color: primaryColor),
        minimumSize: BUTTON_MIN_SIZE,
        maximumSize: BUTTON_MAX_SIZE,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryColor,
        minimumSize: BUTTON_MIN_SIZE,
        maximumSize: BUTTON_MAX_SIZE,
      ),
    ),
    buttonTheme: ButtonThemeData(
      buttonColor: primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.0),
      ),
    ),
  );
  static ThemeData dark = ThemeData(
    shadowColor: darkPrimaryColor.withOpacity(0.25),
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    // fontFamily: "Avenir",
    scaffoldBackgroundColor: darkPageBackgroundColor,
    backgroundColor: darkBackgroundColor,
    canvasColor: darkCanvasColor,
    colorScheme: ThemeData().colorScheme.copyWith(
          brightness: Brightness.dark,
          secondary: darkSecondaryColor,
        ),
  );
}
