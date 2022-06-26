import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static ThemeData? lightTheme(BuildContext context) {
    return ThemeData(
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.lato().fontFamily,
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white70),
            titleTextStyle: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 22)));
  }
}
