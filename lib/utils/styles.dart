import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo/utils/palette.dart';

class Styles {
  /// This is the custom text style used throughout the application
  static customTextStyle({
    Color textColor: Palette.TextColor,
    double textSize: Palette.mediumFontSize,
    FontWeight fontWeight: FontWeight.normal,
  }) {
    return TextStyle(
      color: textColor,
      fontSize: textSize,
      fontWeight: fontWeight,
    );
  }

  /// This is the custom text input decoration used throughout the application
  static textInputDecoration(
      {bool isBorder: true,
      double borderRadius: 4,
      bool isDistinctRadius: false,
      String hint,
      String errorText,
      String labelText,
      Widget prefixIcon,
      Widget suffixIcon,
      EdgeInsets contentPadding,
      FocusNode focusNode}) {
    if (focusNode == null) {
      focusNode = FocusNode();
    }
    return InputDecoration(
      contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      filled: focusNode.hasFocus,
      fillColor: focusNode.hasFocus ? Palette.EnabledFilledColor : Palette.WhiteColor,
      border: isBorder
          ? OutlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.DisabledBorderColor),
            )
          : UnderlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.DisabledBorderColor),
            ),
      enabledBorder: isBorder
          ? OutlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.DisabledBorderColor),
            )
          : UnderlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.DisabledBorderColor),
            ),
      errorBorder: isBorder
          ? OutlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.ErrorRedColor),
            )
          : UnderlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.ErrorRedColor),
            ),
      disabledBorder: isBorder
          ? OutlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.DisabledBorderColor),
            )
          : UnderlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.DisabledBorderColor),
            ),
      focusedBorder: isBorder
          ? OutlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.EnabledBorderColor),
            )
          : UnderlineInputBorder(
              borderRadius: !isDistinctRadius
                  ? BorderRadius.circular(borderRadius)
                  : BorderRadius.only(
                      bottomRight: Radius.circular(8.0), topRight: Radius.circular(8.0)),
              borderSide: BorderSide(color: Palette.EnabledBorderColor),
            ),
      labelText: labelText ?? hint,
      labelStyle:
          Styles.customTextStyle(textSize: Palette.mediumFontSize, textColor: Palette.TextColor),
      hintText: hint,
      hintStyle: Styles.customTextStyle(
          textSize: Palette.mediumFontSize, textColor: Palette.DisabledBorderColor),
      errorText: errorText,
      errorStyle:
          Styles.customTextStyle(textSize: Palette.smallFontSize, textColor: Palette.ErrorRedColor),
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counterText: '',
    );
  }
}
