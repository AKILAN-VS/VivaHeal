import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  // static TextStyle heading45() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 45,
  //     fontWeight: FontWeight.bold,
  //     color: const Color.fromARGB(255, 52, 52, 52),
  //   );
  // }

  // static TextStyle label15() {
  //   return GoogleFonts.montserrat(fontSize: 15, color: Colors.black);
  // }

  // static TextStyle label15b() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 15,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //   );
  // }

  // static TextStyle label12() {
  //   return GoogleFonts.montserrat(fontSize: 12, color: Colors.black);
  // }

  // static TextStyle label12b() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 12,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //   );
  // }

  // static TextStyle label14() {
  //   return GoogleFonts.montserrat(fontSize: 14, color: Colors.black);
  // }

  // static TextStyle label14b() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //   );
  // }

  // static TextStyle label14bgrey() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.grey,
  //   );
  // }

  // static TextStyle label15WithAsterisk() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 15,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.red,
  //   );
  // }

  // static TextStyle countryCode() {
  //   return GoogleFonts.montserrat(
  //     fontSize: 14,
  //     fontWeight: FontWeight.w500,
  //     color: Colors.black,
  //   );
  // }

  // static TextStyle hintText() {
  //   return GoogleFonts.montserrat(fontSize: 11, color: Colors.grey);
  // }

  static TextStyle monText({
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.w500,
    Color color = const Color.fromARGB(255, 0, 0, 0),
  }) {
    return GoogleFonts.montserrat(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }
}
