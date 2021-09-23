import 'package:flutter/material.dart';
import 'package:demo/src/demo_widgets/fields/form_builder_text.dart';
import 'package:demo/utils/palette.dart';
import 'package:demo/utils/styles.dart';
import 'package:demo/utils/utils.dart';

class DropDownWidget extends StatelessWidget {
  final Function onPressed;
  final String titleText;
  final Color borderColor;

  const DropDownWidget({
    Key key,
    @required this.onPressed,
    @required this.titleText,
    this.borderColor: Palette.TextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      splashColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.screenWidth * 0.04,
          vertical: Utils.screenHeight * 0.017,
        ),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(5.0)),
          border: Border.all(color: borderColor, width: 1),
          color: Palette.WhiteColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormBuilderText(
              message: titleText,
              textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.AppThemeColor,
              ),
            ),
            Icon(Icons.arrow_drop_down_sharp, color: Palette.AppThemeColor),
          ],
        ),
      ),
    );
  }
}
