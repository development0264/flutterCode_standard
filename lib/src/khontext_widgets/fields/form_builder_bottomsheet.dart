import 'package:flutter/material.dart';
import 'package:demo/utils/palette.dart';
import 'package:demo/utils/utils.dart';

/// [Widget] passed by the child usages to show the child in the particular bottom sheet
class FormBuilderBottomSheet {
  static void openBottomSheet({
    @required BuildContext context,
    @required Widget child,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: false,
      enableDrag: false,
      barrierColor: Palette.AppThemeColorTransparent,
      backgroundColor: Palette.WhiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isDismissible: false,
      builder: (context) {
        return Container(
          height: Utils.screenHeight * 0.6,
          padding: EdgeInsets.symmetric(
            horizontal: Palette.mediumSpace,
            vertical: Palette.largeSpace,
          ),
          child: child,
        );
      },
    );
  }
}
