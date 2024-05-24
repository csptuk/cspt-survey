import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kAppBarBackgroundColor = Color(0xFFEED371);
const Color kBodyBackgroundColor = Color(0xFFFBF0AB);
const Color kSecondaryColor = Color(0xFFFCCD6C);
const Color kLoadingLineColor = Color(0xFFEC2359);
// const Color kActiveButtonColor = Color(0xFF831D1C);
// const Color kActiveButtonColor = Color(0xFFEC2359);
const Color kActiveButtonColor = Colors.black;
const Color kCursorColor = Colors.black;
const Color kFocusedTextFieldColor = Colors.black;
const Color kButtonBackgroundColor = Color(0xFFFBF0AB);
// const Color kButtonTextColor = Color(0xFFEC2359);
// const Color kButtonTextColor = Color(0xFF831D1C);
const Color kButtonTextColor = Colors.black;

TextStyle kLabelTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
  ),
);

TextStyle kButtonTextStyle = GoogleFonts.poppins(
  textStyle: const TextStyle(
    color: kButtonTextColor,
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  ),
);

BorderRadius kBorderRadius = BorderRadius.circular(10.0);
List<BoxShadow> kBoxShadowList = [
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
  BoxShadow(
    color: Colors.grey.withOpacity(0.2),
    spreadRadius: 1,
    blurRadius: 2,
  ),
];
