import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/forgetpassword/forget_password_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/forgetpassword/forget_password_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/forgetpassword/reset_password_request_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class ResetPasswordPage extends StatefulWidget {
  final String userToken;

  const ResetPasswordPage({Key key, this.userToken}) : super(key: key);

  @override
  _ResetPasswordPage createState() => _ResetPasswordPage();
}

class _ResetPasswordPage extends State<ResetPasswordPage> {
  /// Global key for maintaining the state of the form.
  final _resetPasswordFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire sign in form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  /// [bool] value which holds the toggle flags.
  bool isRemember = false;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter passwordFormState;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);

    _confirmPasswordFocus.addListener(() {
      this.passwordFormState(() {});
    });

    _newPasswordFocus.addListener(() {
      this.passwordFormState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, ResetPasswordViewModel>(
        converter: (store) => ResetPasswordViewModel(store.state.forgetPasswordState),
        builder: (context, vm) {
          return Stack(
            children: [
              _resetPasswordRootUi(),
              if (vm.forgetPasswordState.isLoading &&
                  vm.forgetPasswordState.currentAction == ResetPasswordAction) ...[
                BaseLoadingWidget(),
              ]
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives the root ui for the reset password page
  Widget _resetPasswordRootUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).changePasswordText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).enterNewPasswordText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _formFields(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _saveButton(),
      ],
    );
  }

  /// Widget function which gives the text input for the new password, confirm new password.
  /// Compulsory field
  Widget _formFields() {
    return FormBuilder(
      key: _resetPasswordFormKey,
      child: StatefulBuilder(builder: (context, setState) {
        this.passwordFormState = setState;
        return Column(
          children: [
            FormBuilderTextField(
              name: Constants.signInPassword,
              controller: _newPasswordController,
              textInputAction: TextInputAction.next,
              focusNode: _newPasswordFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).passwordHintText,
                focusNode: _newPasswordFocus,
                suffixIcon: GestureDetector(
                  child: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Palette.AppThemeColor,
                  ),
                  onTap: () => _onVisibilityChanged(),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: FormBuilderLocalizations.of(context).emptyPasswordErrorText),
                FormBuilderValidators.minLength(context, 6,
                    errorText: FormBuilderLocalizations.of(context).passwordLengthErrorText)
              ]),
              obscureText: isPasswordVisible,
            ),
            Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
            FormBuilderTextField(
              name: Constants.signUpConfirmPassword,
              controller: _confirmPasswordController,
              focusNode: _confirmPasswordFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).confirmPasswordHintText,
                focusNode: _confirmPasswordFocus,
                suffixIcon: GestureDetector(
                  child: Icon(
                    isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                    color: Palette.AppThemeColor,
                  ),
                  onTap: () => _onConfirmPasswordVisibility(),
                ),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: FormBuilderLocalizations.of(context).emptyPasswordErrorText),
                FormBuilderValidators.minLength(context, 6,
                    errorText: FormBuilderLocalizations.of(context).passwordLengthErrorText),
                FormBuilderValidators.equal(context, _newPasswordController.text,
                    errorText:
                        FormBuilderLocalizations.of(context).confirmPasswordValidationErrorText),
              ]),
              obscureText: isConfirmPasswordVisible,
            ),
          ],
        );
      }),
    );
  }

  /// Widget function for the save and exit button ui
  Widget _saveButton() {
    return BaseButtonWidget(
      minWidth: Utils.screenWidth,
      btnChild: FormBuilderText(
        message: FormBuilderLocalizations.of(context).saveBtnText,
        textStyle: Styles.customTextStyle(textColor: Colors.white),
      ),
      onPressed: () => _saveButtonClick(),
    );
  }

  /// Group of functions which will give the functionalities like click events, state change.
  void _onConfirmPasswordVisibility() {
    this.passwordFormState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  void _onVisibilityChanged() {
    this.passwordFormState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _saveButtonClick() {
    if (_resetPasswordFormKey.currentState.validate()) {
      store.dispatch(
        ResetPasswordAction(
          context: context,
          resetPasswordRequestModel: ResetPasswordRequestModel(
            resetToken: widget.userToken,
            password: _newPasswordController.text,
          ),
        ),
      );
    }
  }

  void checkError(ResetPasswordViewModel vm) {
    if (vm?.forgetPasswordState?.error?.isNotEmpty == true &&
        vm?.forgetPasswordState?.currentAction == ResetPasswordErrorAction) {
      Utils.showToast(context: context, message: vm.forgetPasswordState.error);
    }
  }

  @override
  void dispose() {
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _newPasswordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }
}

class ResetPasswordViewModel {
  final ForgetPasswordState forgetPasswordState;

  ResetPasswordViewModel(this.forgetPasswordState);
}
