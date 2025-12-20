import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


bool get isDarkMode {
  // final mode = Get.find<ThemeController>().isDarkMode;
  // return mode;
  return false;
}


TextStyle lightTextStyle(
    {double fontSize = 18, Color? color}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color ?? (isDarkMode ? Colors.white : Colors.black),
    fontWeight: FontWeight.w400,
  );
}

TextStyle regularTextStyle({
  double? fontSize,
  Color? color,
}) {
  return GoogleFonts.poppins(
    fontSize: fontSize ?? 14,
    fontWeight: FontWeight.w400,
    color: color ?? (isDarkMode ? Colors.white : Colors.black),
  );
}

TextStyle mediumTextStyle({
double? fontSize,
Color? color,
}) { return
  GoogleFonts.poppins(
      color: color ?? (isDarkMode ? Colors.white : Colors.black),
      fontSize: fontSize ?? 14,
      fontWeight: FontWeight.w500
  );
}


TextStyle littleDarkTextStyle(
    {double fontSize = 18, Color? color}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color ?? (isDarkMode ? Colors.white : Colors.black),
    fontWeight: FontWeight.w600,
  );
}

TextStyle darkTextStyle(
    {double fontSize = 18, Color? color}) {
  return GoogleFonts.poppins(
    fontSize: fontSize,
    color: color ?? (isDarkMode ? Colors.white : Colors.black),
    fontWeight: FontWeight.w700,
  );
}