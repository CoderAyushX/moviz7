import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  //* static function for app theme
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
        //* primary theme
        primarySwatch: Colors.grey,
        fontFamily: GoogleFonts.lato().fontFamily,
        //* text theme
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
        //*appbar theme
        appBarTheme: const AppBarTheme(
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white70),
            titleTextStyle: TextStyle(
                color: Colors.white70,
                fontWeight: FontWeight.bold,
                fontSize: 20)));
  }
}
