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

//ignore: must_be_immutable
class GetStartedPage extends StatelessWidget {
  GetStartedPage({Key key}) : super(key: key);

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key startOnBoardingButtonKey = Key(Constants.startOnBoardingButton);

  @override
  Widget build(BuildContext context) {
    return BaseWidget(baseChild: _rootWelcomeScreenWidget(context));
  }

  /// Widget function which gives the root ui for the first welcome screen
  Widget _rootWelcomeScreenWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).getStartedText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).getStartedInfoText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.mediumFontSize,
            textColor: Palette.TextColor,
          ),
          maxLines: 5,
          textAlign: TextAlign.center,
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        BaseButtonWidget(
          key: startOnBoardingButtonKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).onBoardingText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => startOnBoardingButtonClick(context),
        ),
      ],
    );
  }

  /// Group of functions which gives particular functionalities like click events, state changes
  void startOnBoardingButtonClick(BuildContext context) {
    Utils.navigateTo(context, RoutesConstants.onBoardingAddressScreen);
  }
}
