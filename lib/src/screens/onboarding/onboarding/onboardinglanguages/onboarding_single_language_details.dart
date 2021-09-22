import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

//ignore: must_be_immutable
class OnBoardingSingleLanguageDetails extends StatelessWidget {
  OnBoardingSingleLanguageDetails({
    Key key,
    @required this.singleItemData,
    this.showDeleteIcon: true,
    this.onDeleteIconClick,
  }) : super(key: key);

  /// [AddLanguageResponseData] gives the data for the widget.
  ///
  /// No default values, this is a must required field.
  final AddLanguageResponseData singleItemData;

  /// [bool] which gives the visibility of the delete icon
  /// This is used for hiding the icon in the entire module view page
  /// By default, it is set as [true]
  final bool showDeleteIcon;

  /// [Function] which provides a callback for the icon click.
  final Function onDeleteIconClick;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key deleteButtonKey = Key(Constants.deleteButtonKey);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(Utils.screenWidth * 0.05),
      margin: EdgeInsets.symmetric(vertical: Palette.smallSpace),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Palette.EnabledFilledColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FormBuilderText(
                message: singleItemData.languagesResponse.name,
                textStyle: Styles.customTextStyle(
                  textColor: Palette.DarkTextColor,
                  fontWeight: FontWeight.bold,
                  textSize: Palette.mediumFontSize,
                ),
              ),
              Visibility(
                visible: showDeleteIcon,
                child: InkWell(
                  key: deleteButtonKey,
                  splashColor: Colors.transparent,
                  onTap: () => onDeleteIconClick(),
                  child: Icon(
                    Icons.delete_outline_outlined,
                    color: Palette.EnabledBorderColor,
                    size: 21.0,
                  ),
                ),
              ),
            ],
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          _chipItem(singleItemData.proficiencyLevelsResponse.name),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          Divider(color: Palette.MediumGrayColor, thickness: 1),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                singleItemData.specializationsResponses.map((e) => _chipItem(e.name)).toList(),
          ),
        ],
      ),
    );
  }

  /// Widget function which gives the ui for the single chip item of the added language
  Widget _chipItem(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Palette.MediumGrayColor,
        borderRadius: BorderRadius.circular(3.0),
      ),
      child: FormBuilderText(
        message: text,
        textStyle: Styles.customTextStyle(
          textColor: Palette.TextColor,
          textSize: Palette.mediumFontSize,
        ),
      ),
    );
  }
}
