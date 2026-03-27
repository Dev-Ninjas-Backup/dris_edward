import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getHeadingTextStyle({
  double fontsize = 30.0,
  FontWeight fontweight = FontWeight.w600,
  TextAlign textAlign = TextAlign.center,
  //Color color = AppColors.primaryTextColor,
}) {
  return GoogleFonts.inter(
    fontSize: fontsize,
    fontWeight: fontweight,
    //color: color,
  );
}

TextStyle getNormalTextStyle({
  double fontsize = 16.0,
  FontWeight fontweight = FontWeight.w400,
  TextAlign textAlign = TextAlign.center,
  //Color color = AppColors.primaryTextColor,
}) {
  return GoogleFonts.inter(
    fontSize: fontsize,
    fontWeight: fontweight,
    //color: color,
  );
}

TextStyle getButtonTextStyle({
  double fontsize = 20.0,
  FontWeight fontweight = FontWeight.w600,
  TextAlign textAlign = TextAlign.center,
  //Color color = AppColors.primaryTextColor,
}) {
  return GoogleFonts.inter(
    fontSize: fontsize,
    fontWeight: fontweight,
    //color: color,
  );
}
