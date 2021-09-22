import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/forgetpassword/forget_password_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/forgetpassword/forget_password_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_country_code.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/form_builder.dart';
import 'package:khontext/src/models/forgetpassword/forget_password_request_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key key}) : super(key: key);

  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  /// Global key for maintaining the state of the form.
  final _forgetPasswordFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire sign in form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _emailController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _emailFocus = FocusNode();

  /// [String] which gives the selected country code for the api.
  String dialCode = '+91';

  /// [bool] flags for the toggles
  bool isPhoneNumber = false;

  /// Store instance to use further
  Store<AppState> store;

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter formState;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    _emailFocus.addListener(() {
      this.formState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, ForgetPasswordViewModel>(
        converter: (store) => ForgetPasswordViewModel(store.state.forgetPasswordState),
        builder: (context, vm) {
          checkError(vm);
          return Stack(
            children: [
              _forgetPasswordRootUi(),
              if (vm.forgetPasswordState.isLoading) ...[
                BaseLoadingWidget(),
              ]
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives the root ui for the forget password page
  Widget _forgetPasswordRootUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).forgetPasswordText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).restorePasswordText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _emailInputUi(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _continueButton(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _goBackLayout(),
      ],
    );
  }

  /// Widget function which gives the text input for the email or phone number.
  /// Compulsory field
  Widget _emailInputUi() {
    return FormBuilder(
      key: _forgetPasswordFormKey,
      child: StatefulBuilder(
        builder: (context, setState) {
          this.formState = setState;
          return Row(
            children: [
              Visibility(
                visible: isPhoneNumber,
                child: CountryCodePickerForm(
                  isRadius: false,
                  selectedCountry: (Map<String, String> selectedCountry) =>
                      onCountryCodeChanged(selectedCountry['dial_code']),
                ),
              ),
              Expanded(
                child: FormBuilderTextField(
                  name: Constants.signUpEmail,
                  controller: _emailController,
                  focusNode: _emailFocus,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (changedText) => onInputTextChanged(changedText),
                  decoration: Styles.textInputDecoration(
                    hint: FormBuilderLocalizations.of(context).emailPhoneText,
                    focusNode: _emailFocus,
                    isDistinctRadius: isPhoneNumber,
                  ),
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(
                      context,
                      errorText: FormBuilderLocalizations.of(context).emailPhoneErrorText,
                    )
                  ]),
                ),
              ),
            ],
          );
        }
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
      onPressed: continueBtnClick,
    );
  }

  Widget _goBackLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).neverMindText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => onGoBackClick(),
          child: FormBuilderText(
            message: FormBuilderLocalizations.of(context).goBackText,
            textStyle: Styles.customTextStyle(
              textSize: Palette.mediumFontSize,
              textColor: Palette.DarkTextColor,
            ),
          ),
        ),
      ],
    );
  }

  /// Group of functions which performs the actions in this page.
  ///
  /// This actions contains functionalities like click events, change state of the field.
  void continueBtnClick() {
    if (_forgetPasswordFormKey.currentState.validate()) {
      store.dispatch(
        ForgetPasswordLinkAction(
          context: context,
          forgetPasswordRequestModel: ForgetPasswordRequestModel(
            email: isPhoneNumber ? '' : _emailController.text,
            countryCode: isPhoneNumber ? dialCode : '',
            phoneNumber: isPhoneNumber ? _emailController.text : '',
          ),
        ),
      );
    }
  }

  void onGoBackClick() {
    Navigator.of(context).pop();
  }

  void onInputTextChanged(String inputText) {
    if (inputText.length > 1) return;
    if (double.tryParse(inputText) != null) {
      this.formState(() {
        isPhoneNumber = true;
      });
    } else {
      this.formState(() {
        isPhoneNumber = false;
      });
    }
  }

  void onCountryCodeChanged(String code) {
    dialCode = code;
  }

  void checkError(ForgetPasswordViewModel vm) {
    if (vm?.forgetPasswordState?.error?.isNotEmpty == true &&
        vm?.forgetPasswordState?.currentAction == ForgetPasswordLinkErrorAction) {
      Utils.showToast(context: context, message: vm.forgetPasswordState.error);
      store.dispatch(ForgetPasswordClearAction());
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocus.dispose();
    super.dispose();
  }
}

class ForgetPasswordViewModel {
  final ForgetPasswordState forgetPasswordState;

  ForgetPasswordViewModel(this.forgetPasswordState);
}
