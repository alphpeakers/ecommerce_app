import 'package:flutter/material.dart';

const fontfamil = 'Poppins';
const fontfamil2 = 'Roboto';

class AppTheme {
  static const Color primary = Color(0xFF5B9EE1);
  static const Color secondary = Color(0xFF1A2530);
  static const Color grey = Color(0xFF707B81);
  static const Color background = Color(0xFFF8F9FA);
  static const Color warning = Color(0xFFF87265);
  static const Color info = Color(0xFF1A2530);
  static const Color lightGrey = Color(0xFFE9EDEF);
  static const Color dark = Color(0xFF343A40);
  static const Color white = Color(0xFFFFFFFF);
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    scaffoldBackgroundColor: background,
    textTheme: const TextTheme(
      headlineMedium:
          TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400, color: grey),
      headlineLarge: TextStyle(
          color: info,
          fontSize: 42.0,
          fontFamily: fontfamil,
          fontWeight: FontWeight.w500),
      headlineSmall: TextStyle(
          color: secondary,
          fontSize: 18.0,
          fontFamily: fontfamil2,
          fontWeight: FontWeight.w600),
      titleSmall: TextStyle(
        color: white,
        fontSize: 15.0,
        fontFamily: fontfamil,
      ),
      titleMedium: TextStyle(
        color: white,
        fontSize: 25.0,
        fontFamily: fontfamil,
      ),
      displayLarge: TextStyle(
        fontFamily: fontfamil,
        fontSize: 26.0,
        fontWeight: FontWeight.w600,
        color: secondary,
      ),
      displayMedium: TextStyle(
        fontFamily: fontfamil2,
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: secondary,
      ),
      displaySmall: TextStyle(
        fontFamily: fontfamil,
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        color: info,
      ),
      bodyLarge: TextStyle(
        fontFamily: fontfamil,
        fontSize: 16.0,
        fontWeight: FontWeight.w400,
        color: Colors.black87,
      ),
      bodyMedium: TextStyle(
        fontFamily: fontfamil2,
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: secondary,
      ),
      bodySmall: TextStyle(fontSize: 15.0, color: primary),
      labelMedium: TextStyle(
        fontFamily: fontfamil,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      labelLarge: TextStyle(
        fontFamily: fontfamil,
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: grey,
      ),
      labelSmall: TextStyle(
        fontFamily: fontfamil,
        fontSize: 15.0,
        fontWeight: FontWeight.w400,
        color: grey,
      ),
    ),
  );
}
