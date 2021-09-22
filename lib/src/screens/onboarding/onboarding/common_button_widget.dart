import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/widgets/button_widget.dart';

//ignore: must_be_immutable
class CommonButtonWidget extends StatelessWidget {
  final Function previousButtonClick;
  final Function nextButtonClick;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key previousButtonKey = Key(Constants.previousButtonKey);
  Key nextButtonKey = Key(Constants.nextStepBtnKey);

  CommonButtonWidget({Key key, this.previousButtonClick, this.nextButtonClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            key: previousButtonKey,
            backgroundColor: Palette.WhiteColor,
            borderColor: Palette.EnabledBorderColor,
            btnChild: FormBuilderText(
                message: 'Previous Step',
                textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor)),
            onPressed: previousButtonClick,
          ),
        ),
        SizedBox(width: Palette.smallSpace),
        Expanded(
          child: BaseButtonWidget(
            key: nextButtonKey,
            backgroundColor: Palette.AppThemeColor,
            borderColor: Palette.AppThemeColor,
            btnChild: FormBuilderText(
                message: 'Next Step',
                textStyle: Styles.customTextStyle(textColor: Palette.WhiteColor)),
            onPressed: nextButtonClick,
          ),
        ),
      ],
    );
  }
}
