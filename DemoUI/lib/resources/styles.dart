import 'fonts.dart';
import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  static TextStyle greyBold(double size) {
    return TextStyle(
        color: AppColors.greyMedium,
        fontSize: size,
        fontFamily: AppFonts.hiragino,
        fontWeight: FontWeight.bold);
  }

  static TextStyle blackBold(double size) {
    return TextStyle(
        fontSize: size,
        fontFamily: AppFonts.hiragino,
        fontWeight: FontWeight.bold);
  }

  static TextStyle greyText(double size) {
    return TextStyle(
        color: AppColors.greyMedium,
        fontSize: size,
        fontFamily: AppFonts.hiragino);
  }

  static TextStyle blackText(double size) {
    return TextStyle(
        fontSize: size,
        fontFamily: AppFonts.hiragino,
        fontWeight: FontWeight.bold);
  }

  static TextStyle primaryText(double size) {
    return TextStyle(
        color: AppColors.mainColor,
        fontSize: size,
        fontFamily: AppFonts.hiragino);
  }

  static TextStyle primaryBold(double size) {
    return TextStyle(
        color: AppColors.mainColor,
        fontSize: size,
        fontFamily: AppFonts.hiragino,
        fontWeight: FontWeight.bold);
  }

  static TextStyle redAccentText(double size) {
    return TextStyle(
        color: AppColors.redAccentColor,
        fontSize: size,
        fontFamily: AppFonts.hiragino);
  }

  static TextStyle redAccentBold(double size) {
    return TextStyle(
        color: AppColors.redAccentColor,
        fontSize: size,
        fontFamily: AppFonts.hiragino,
        fontWeight: FontWeight.bold);
  }

  static TextStyle cyantText(double size) {
    return TextStyle(
        color: AppColors.cyantColor,
        fontSize: size,
        fontFamily: AppFonts.hiragino);
  }

  static TextStyle cyantBold(double size) {
    return TextStyle(
        color: AppColors.cyantColor,
        fontSize: size,
        fontFamily: AppFonts.hiragino,
        fontWeight: FontWeight.bold);
  }
}
