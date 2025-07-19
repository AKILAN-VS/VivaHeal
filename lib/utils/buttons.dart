import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Standard Custom Button
Widget customButton({
  required String buttonLabel,
  VoidCallback? onPressed,
  height,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Text(
          buttonLabel,
          style: GoogleFonts.montserrat(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}

// Gradient Button
Widget gradientButton({
  required String buttonLabel,
  required VoidCallback onPressed,
  required double height, // Made type explicit for better safety
  required double width,
  Color grad1 = const Color(0xFF33BB78), // Made type explicit for better safety
  Color grad2 = const Color(0xFF73ADE3), // Made type explicit for better safety
  Color textcol = const Color.fromARGB(255, 255, 255, 255), 
  Color bordercol=const Color(0xFF33BB78),// Made type explicit for better safety
}) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
    width: double.infinity,
    height: width > 600 ? 60 : 40,
    decoration: BoxDecoration(
      border: Border.all(
        color: bordercol,
      ),
      gradient: LinearGradient(
        colors: [
          grad1, grad2, // blue
        ],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    child: Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: Text(
            buttonLabel,
            style: GoogleFonts.montserrat(
              fontSize: width > 600 ? 24 : 18,
              fontWeight: FontWeight.w700,
              color: textcol,
            ),
          ),
        ),
      ),
    ),
  );
}
