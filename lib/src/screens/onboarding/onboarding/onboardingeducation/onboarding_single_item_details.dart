import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

//ignore: must_be_immutable
class OnBoardingSingleItemDetails extends StatelessWidget {
  OnBoardingSingleItemDetails({
    Key key,
    this.titleLine: '',
    this.subTitleLine: '',
    this.descriptionLine: '',
    this.onDeleteIconClick,
  }) : super(key: key);

  /// [String] which set to the ui for the title line.
  ///
  /// By default, an empty string is passed to eradicate any issue with ui
  final String titleLine;

  /// [String] which set to the ui for the sub title line.
  ///
  /// By default, an empty string is passed to eradicate any issue with ui
  final String subTitleLine;

  /// [String] which set to the ui for the description line.
  ///
  /// By default, an empty string is passed to eradicate any issue with ui
  final String descriptionLine;

  /// [Function] which provides a callback for the icon click.
  final Function onDeleteIconClick;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key deleteButtonKey = Key(Constants.educationDeleteButtonKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Utils.screenWidth * 0.05),
      margin: EdgeInsets.symmetric(vertical: Utils.screenHeight * 0.01),
      decoration: BoxDecoration(
        color: Palette.EnabledFilledColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormBuilderText(
                message: titleLine,
                textStyle: Styles.customTextStyle(
                  textColor: Palette.TextColor,
                  textSize: Palette.largeFontSize,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                key: deleteButtonKey,
                splashColor: Colors.transparent,
                onTap: () => onDeleteIconClick(),
                child: Icon(
                  Icons.delete_outline_outlined,
                  color: Palette.AppThemeColor,
                ),
              ),
            ],
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          FormBuilderText(
            message: subTitleLine,
            textStyle: Styles.customTextStyle(
              textColor: Palette.DarkTextColor,
              textSize: Palette.mediumFontSize,
            ),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          FormBuilderText(
            message: descriptionLine,
            textStyle: Styles.customTextStyle(
              textColor: Palette.AppThemeColor,
              textSize: Palette.mediumFontSize,
            ),
          )
        ],
      ),
    );
  }
}
