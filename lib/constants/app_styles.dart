import 'package:flutter/material.dart';
import 'package:scaper_mobile/constants/app_colors.dart';

class Styles {
  static TextStyle lightTextStyle({
    Color color = Colors.black,
    double size = 14,
    TextDecoration decoration = TextDecoration.none,
    bool italic = false,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w300,
      color: color,
      decoration: decoration,
      letterSpacing: -0.5,
      fontStyle: italic ? FontStyle.italic : FontStyle.normal,
    );
  }

  static TextStyle regularTextStyle({
    Color color = Colors.black,
    double size = 14,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    TextDecorationStyle decorationStyle = TextDecorationStyle.solid,
    Color decorationColor = AppColors.primaryColor,
    double decorationThickness = 1.0,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w400,
      color: color,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: -0.5,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  static TextStyle mediumTextStyle({
    Color color = Colors.black,
    double size = 16,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w500,
      color: color,
      letterSpacing: -0.5,
      fontStyle: fontStyle,
      decoration: decoration,
    );
  }

  static TextStyle semiBoldTextStyle({
    Color color = Colors.black,
    double size = 16,
    FontStyle fontStyle = FontStyle.normal,
    TextDecoration decoration = TextDecoration.none,
    TextDecorationStyle decorationStyle = TextDecorationStyle.solid,
    Color decorationColor = AppColors.primaryColor,
    double decorationThickness = 1.0,
  }) {
    return TextStyle(
      fontSize: size,
      fontWeight: FontWeight.w600,
      color: color,
      fontStyle: fontStyle,
      letterSpacing: -0.5,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }

  static TextStyle boldTextStyle({
    Color color = Colors.black,
    double size = 16,
    TextDecoration decoration = TextDecoration.none,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontSize: size,
      letterSpacing: -0.5,
      fontWeight: FontWeight.w700,
      color: color,
      decoration: decoration,
      fontStyle: fontStyle,
    );
  }
}
