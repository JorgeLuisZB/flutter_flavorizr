import 'package:flutter/cupertino.dart';
import 'package:connect/app/themes/colors_theme.dart';

TextStyle muliRegular({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.normal,
  String fontFamily = 'Muli',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle muliBold({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.bold,
  String fontFamily = 'Muli',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle muliExtraBold({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  FontWeight fontWeight = FontWeight.w900,
  String fontFamily = 'Muli',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
  );
}

TextStyle licensePlateRegular({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 16,
  String fontFamily = 'LicensePlate',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: fontFamily,
  );
}

TextStyle footerTextRegular({
  Color color = ThemeColor.primaryBlack,
  double fontSize = 12,
  String fontFamily = 'Montserrat',
}) {
  return TextStyle(
    color: color,
    fontSize: fontSize,
    fontFamily: fontFamily,
  );
}
