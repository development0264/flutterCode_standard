import 'package:flutter/material.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/utils.dart';

class BaseWidget extends StatelessWidget {
  const BaseWidget({
    Key key,
    this.horizontalPadding,
    this.verticalPadding,
    this.resizeToAvoidBottomInset : false,
    @required this.baseChild,
  }) : super(key: key);

  /// This is the padding value for the horizontal space given by [double].
  ///
  /// By default, the null value is being passed.
  final double horizontalPadding;

  /// This is the padding value for the vertical space given by [double].
  ///
  /// By default, the null value is being passed.
  final double verticalPadding;

  /// This is the base widget used by the given padding widget given by [Widget].
  ///
  /// This is a required field.
  final Widget baseChild;

  /// This is the [bool] value for the resize of the screen when user opens the keyboard.
  ///
  /// By default, the [false] value is set.
  final bool resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.WhiteColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? Utils.screenWidth * 0.05,
          vertical: verticalPadding ?? Utils.screenHeight * 0.03,
        ),
        child: baseChild,
      ),
    );
  }
}
