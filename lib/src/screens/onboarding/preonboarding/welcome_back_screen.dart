import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class WelcomeBackScreen extends StatefulWidget {
  const WelcomeBackScreen({Key key}) : super(key: key);

  @override
  _WelcomeBackScreenState createState() => _WelcomeBackScreenState();
}

class _WelcomeBackScreenState extends State<WelcomeBackScreen> {
  /// Store instance to use further
  Store<AppState> store;

  /// [ProfileData] gives the data of the signed in user to print the name of the user
  ProfileData profileData;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key cancelButtonKey = Key(Constants.cancelButtonWelcomeBack);
  Key continueButtonKey = Key(Constants.continueButtonWelcomeBack);

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    profileData = store?.state?.signInState?.completeProfileResponseModel?.data;
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(baseChild: _rootWelcomeBackWidget());
  }

  /// Widget function which gives the root ui for the welcome back page
  Widget _rootWelcomeBackWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message:
              '${FormBuilderLocalizations.of(context).welcomeBackText} ${profileData?.firstName}',
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Palette.largeSpace),
          child: FormBuilderText(
            message: FormBuilderLocalizations.of(context).welcomeBackInfoText,
            textStyle: Styles.customTextStyle(
              textSize: Palette.mediumFontSize,
              textColor: Palette.TextColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.EXTRA_LARGE),
        Utils.getVerticalSpacing(SPACE_TYPE.EXTRA_LARGE),
        _buttonsLayout(),
      ],
    );
  }

  /// Widget function which gives the ui for the buttons on the page
  Widget _buttonsLayout() {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            key: cancelButtonKey,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).cancelText,
              textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor),
            ),
            backgroundColor: Palette.WhiteColor,
            onPressed: cancelButtonClick,
          ),
        ),
        SizedBox(width: Palette.mediumSpace),
        Expanded(
          child: BaseButtonWidget(
            key: continueButtonKey,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).continueBtnText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: continueButtonClick,
          ),
        ),
      ],
    );
  }

  /// Group of functions which gives particular functionalities like click events, state changes
  void cancelButtonClick() {
    print("Cancel button clicked");
  }

  void continueButtonClick() {
    Utils.navigateTo(context, RoutesConstants.onBoardingAddressScreen);
  }
}
