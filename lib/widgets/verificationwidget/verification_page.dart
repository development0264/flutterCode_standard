import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/widgets/verificationwidget/resend_timer_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';

class VerificationPage extends StatefulWidget {
  final String mainTitle;
  final String smallTitle;
  final Function continueButtonClick;
  final Function resendCode;

  const VerificationPage({
    Key key,
    @required this.mainTitle,
    @required this.smallTitle,
    @required this.continueButtonClick,
    @required this.resendCode,
  }) : super(key: key);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  /// Global key for maintaining the state of the form.
  final _verifyFormKey = GlobalKey<FormBuilderState>();

  /// [StateSetter] variable to set the state.
  /// This field will be used only to refresh the particular fields state used with.
  StateSetter showCodeState;
  StateSetter timerChangeState;

  /// [TextEditingController] for the entire sign in form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _codeController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _codeFocus = FocusNode();

  /// [bool] value which holds the toggle flags.
  bool isShowCode = false;

  /// Variable used for showing the timer left for resending the code.
  int timerLeft = 58;

  @override
  void initState() {
    super.initState();
    _codeFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(baseChild: _identityVerificationUi());
  }

  /// Widget function which gives the root ui for the identity verification
  Widget _identityVerificationUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: widget.mainTitle,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        FormBuilderText(
          message: widget.smallTitle,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _codeInputForm(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _continueButton(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        ResendTimerWidget(resendClicked: () => widget.resendCode()),
      ],
    );
  }

  /// Widget function which gives the text input for the code.
  Widget _codeInputForm() {
    return FormBuilder(
      key: _verifyFormKey,
      child: StatefulBuilder(
        builder: (BuildContext context, StateSetter showCodeState) {
          this.showCodeState = showCodeState;
          return FormBuilderTextField(
            name: Constants.codeField,
            controller: _codeController,
            focusNode: _codeFocus,
            keyboardType: TextInputType.number,
            maxLength: 6,
            decoration: Styles.textInputDecoration(
              hint: FormBuilderLocalizations.of(context).enterCodeText,
              focusNode: _codeFocus,
              suffixIcon: GestureDetector(
                child: Icon(
                  isShowCode ? Icons.visibility : Icons.visibility_off,
                  color: Palette.AppThemeColor,
                ),
                onTap: () => _onVisibilityChanged(),
              ),
            ),
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).enterCodeErrorText)
            ]),
            obscureText: isShowCode,
          );
        },
      ),
    );
  }

  /// Widget function for the continue button ui
  Widget _continueButton() {
    return BaseButtonWidget(
      minWidth: Utils.screenWidth,
      btnChild: FormBuilderText(
        message: FormBuilderLocalizations.of(context).continueBtnText,
        textStyle: Styles.customTextStyle(
          textColor: Colors.white,
        ),
      ),
      onPressed: () => continueBtnClick(),
    );
  }

  /// Group of functions which performs the actions in this page.
  ///
  /// This actions contains functionalities like click events, change state of the field, api calls.
  void _onVisibilityChanged() {
    this.showCodeState(() {
      isShowCode = !isShowCode;
    });
  }

  void continueBtnClick() {
    if (_verifyFormKey.currentState.validate()) {
      widget.continueButtonClick(_codeController.text);
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _codeFocus.dispose();
    super.dispose();
  }
}
