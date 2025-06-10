import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:matule/core/brand/brand_colors.dart';

class BrandText {
  static TextStyle get headlineLargeWhite => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 30,
      color: Colors.white,
      fontWeight: FontWeight.w900,
      letterSpacing: 0,
    ),
  );
  static TextStyle get headlineLargeBlack => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 30,
      color: Colors.black,
      fontWeight: FontWeight.w900,
      letterSpacing: 0,
    ),
  );

  static TextStyle get bodySmallWhite => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
  );
  static TextStyle get bodySmallBlack => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
  );

  static TextStyle get bodyLargeWhite => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
  );
  static TextStyle get bodyLargBlack => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
  );

  static TextStyle get titleLarge => GoogleFonts.raleway(
    textStyle: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
  );

  static TextStyle get subText => GoogleFonts.poppins(
    textStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(106, 106, 106, 1),
    ),
  );

  static TextStyle get accentText => GoogleFonts.poppins(
    textStyle: TextStyle(
      color: BrandColors.accent,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    )
    // 2tfd
  );
}
