import 'package:flutter/material.dart';
import 'package:khontext/utils/utils.dart';

class Palette {
  /// colors
  static const AppThemeColor = Color(0x00FF949FB7);
  static const AppThemeColorTransparent = Color(0x0033596172);
  static const ErrorRedColor = Colors.redAccent;
  static const TextColor = Color(0x00FF757E91);
  static const DarkTextColor = Color(0x00FF323246);
  static const DisabledBorderColor = Color(0x00FFDADEE8);
  static const EnabledBorderColor = Color(0x00FFC1C8D7);
  static const EnabledFilledColor = Color(0x00FFFBFBFC);
  static const WhiteColor = Colors.white;
  static const HeaderBgColor = Color(0xFFF7F7F7);
  static const LightGrayColor = Color(0x00FFDADEE8);
  static const MediumGrayColor = Color(0x00FFE9ECF2);

  /// Font sizes
  static const smallFontSize = 14.0;
  static const mediumFontSize = 16.0;
  static const largeFontSize = 18.0;
  static const extraLargeFontSize = 24.0;

  /// Spaces
  static double smallSpace = Utils.screenHeight * 0.015;
  static double mediumSpace = Utils.screenHeight * 0.025;
  static double largeSpace = Utils.screenHeight * 0.045;
  static double extraLargeSpace = Utils.screenHeight * 0.07;
}
