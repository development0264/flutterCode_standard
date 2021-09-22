import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';

class WelcomeScreenPage extends StatefulWidget {
  const WelcomeScreenPage({Key key}) : super(key: key);

  @override
  _WelcomeScreenPageState createState() => _WelcomeScreenPageState();
}

class _WelcomeScreenPageState extends State<WelcomeScreenPage> {
  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key continueButtonKey = Key(Constants.continueButtonWelcome);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      resizeToAvoidBottomInset: false,
      baseChild: _rootWelcomeScreenWidget(),
    );
  }

  /// Widget function which gives the root ui for the first welcome screen
  Widget _rootWelcomeScreenWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Utils.getVerticalSpacing(SPACE_TYPE.EXTRA_LARGE),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).welcomeText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).collectInfoText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
          textAlign: TextAlign.center,
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).needToKnowText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _bulletedTextWidget(text: FormBuilderLocalizations.of(context).needToKnow1Text),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _bulletedTextWidget(text: FormBuilderLocalizations.of(context).needToKnow2Text),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _bulletedTextWidget(text: FormBuilderLocalizations.of(context).needToKnow3Text),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        BaseButtonWidget(
          key: continueButtonKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).goNextText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: continueButtonClick,
        ),
      ],
    );
  }

  /// Widget function which gives the ui for the single row item which have the bullets
  /// in the left and the text passed in the right side.
  Widget _bulletedTextWidget({String text}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Utils.screenWidth * 0.01,
          width: Utils.screenWidth * 0.01,
          margin: EdgeInsets.only(top: Utils.screenWidth * 0.01),
          decoration: BoxDecoration(
            color: Palette.DarkTextColor,
            borderRadius: BorderRadius.circular(Utils.screenWidth * 0.02),
          ),
        ),
        SizedBox(width: Utils.screenWidth * 0.04),
        Expanded(
          child: FormBuilderText(
            message: text,
            textStyle: Styles.customTextStyle(
              textSize: Palette.smallFontSize,
              textColor: Palette.TextColor,
            ),
            maxLines: 10,
          ),
        ),
      ],
    );
  }

  /// Group of functions which gives particular functionalities like click events, state changes
  void continueButtonClick() {
    Utils.navigateTo(context, RoutesConstants.getStartedScreen);
  }
}
