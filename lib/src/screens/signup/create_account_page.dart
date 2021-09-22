import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signup/create_user_profile_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:khontext/widgets/social_login_widget.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  /// Global key for maintaining the state of the form.
  final _createAccountFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire sign up form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _newPasswordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();

  /// [bool] value which holds the toggle flags.
  bool isRemember = false;
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter firstNameState;
  StateSetter lastNameState;
  StateSetter emailState;
  StateSetter newPasswordState;
  StateSetter confirmPasswordState;

  @override
  void initState() {
    super.initState();
    _setPageFocus();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      resizeToAvoidBottomInset: true,
      baseChild: StoreConnector<AppState, SignUpViewModel>(
        converter: (store) => SignUpViewModel(store.state.signUpState),
        builder: (context, vm) {
          checkError(vm);
          return Stack(
            children: [
              SingleChildScrollView(
                child: createAccountRootView(),
              ),
              if (vm.signUpState.isLoading) ...[
                BaseLoadingWidget(),
              ],
            ],
          );
        },
      ),
    );
  }

  /// Widget function which gives the root view for the entire signup.
  Widget createAccountRootView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).createAccountText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).createAccountRequestText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.mediumFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _createAccountForm(),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _termsLayout(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        BaseButtonWidget(
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).signUpText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => _signUpButtonClick(),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _alreadyAccountLayout(),
        SocialLoginWidget(context: context),
      ],
    );
  }

  Widget _createAccountForm() {
    return FormBuilder(
      key: _createAccountFormKey,
      child: Column(
        children: [
          StatefulBuilder(builder: (context, stateSetter) {
            this.firstNameState = stateSetter;
            return FormBuilderTextField(
              name: Constants.signUpFirstName,
              controller: _firstNameController,
              focusNode: _firstNameFocus,
              textInputAction: TextInputAction.next,
              decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).firstNameHintText,
                  focusNode: _firstNameFocus),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).emptyFirstNameErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, stateSetter) {
            this.lastNameState = stateSetter;
            return FormBuilderTextField(
              name: Constants.signUpLastName,
              controller: _lastNameController,
              focusNode: _lastNameFocus,
              textInputAction: TextInputAction.next,
              decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).lastNameHintText,
                  focusNode: _lastNameFocus),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).emptyLastNameErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, stateSetter) {
            this.emailState = stateSetter;
            return FormBuilderTextField(
              name: Constants.signUpEmail,
              controller: _emailController,
              focusNode: _emailFocus,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onChanged: (_) => submitEmailValue(),
              decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).emailHintText, focusNode: _emailFocus),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: FormBuilderLocalizations.of(context).emptyEmailErrorText),
                FormBuilderValidators.email(context,
                    errorText: FormBuilderLocalizations.of(context).emailValidationErrorText),
              ]),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter showPasswordState) {
              this.newPasswordState = showPasswordState;
              return FormBuilderTextField(
                name: Constants.signInPassword,
                controller: _newPasswordController,
                focusNode: _newPasswordFocus,
                textInputAction: TextInputAction.next,
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
                      errorText: FormBuilderLocalizations.of(context).passwordLengthErrorText),
                ]),
                obscureText: isPasswordVisible,
              );
            },
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(
            builder: (BuildContext context, StateSetter showPasswordState) {
              this.confirmPasswordState = showPasswordState;
              return FormBuilderTextField(
                name: Constants.signUpConfirmPassword,
                controller: _confirmPasswordController,
                focusNode: _confirmPasswordFocus,
                decoration: Styles.textInputDecoration(
                  hint: 'Confirm Password',
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
                  FormBuilderValidators.equal(
                    context,
                    _newPasswordController.text,
                    errorText:
                        FormBuilderLocalizations.of(context).confirmPasswordValidationErrorText,
                  ),
                ]),
                obscureText: isConfirmPasswordVisible,
              );
            },
          ),
        ],
      ),
    );
  }

  /// Widget function which gives the UI for the terms and conditions.
  Widget _termsLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        FormBuilderCheckbox(
          name: Constants.rememberMe,
          decoration: Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
          initialValue: false,
          activeColor: Palette.AppThemeColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          contentPadding: EdgeInsets.zero,
          onChanged: (value) {
            isRemember = value;
            Utils.setBoolToPrefs(Constants.rememberMe, isRemember);
          },
          title: FormBuilderText(
            message: "",
            textStyle: Styles.customTextStyle(
                textSize: Palette.smallFontSize, textColor: Palette.TextColor),
          ),
        ),
        _termsTextLayout(),
      ],
    );
  }

  /// Widget function which gives the UI for the terms text layout.
  Widget _termsTextLayout() {
    return Expanded(
      child: RichText(
        text: TextSpan(
            text: FormBuilderLocalizations.of(context).iAgreeText,
            style: Styles.customTextStyle(
                textSize: Palette.smallFontSize, textColor: Palette.TextColor),
            children: [
              TextSpan(
                text: FormBuilderLocalizations.of(context).termsAndServicesText,
                style: Styles.customTextStyle(
                    textSize: Palette.smallFontSize,
                    textColor: Palette.TextColor,
                    fontWeight: FontWeight.bold),
              ),
              TextSpan(
                  text: FormBuilderLocalizations.of(context).andText,
                  style: Styles.customTextStyle(
                      textSize: Palette.smallFontSize, textColor: Palette.TextColor)),
              TextSpan(
                text: FormBuilderLocalizations.of(context).privacyPolicyText,
                style: Styles.customTextStyle(
                    textSize: Palette.smallFontSize,
                    textColor: Palette.TextColor,
                    fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }

  /// Custom widget for the text saying if user have the account already.
  Widget _alreadyAccountLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).alreadyAccountText,
          textStyle:
              Styles.customTextStyle(textSize: Palette.smallFontSize, textColor: Palette.TextColor),
        ),
        SizedBox(width: Palette.smallSpace),
        InkWell(
          splashColor: Colors.transparent,
          onTap: () {},
          child: Text(
            FormBuilderLocalizations.of(context).signInNowText,
            style: Styles.customTextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  /// Function is created as a fix for the issue which is created when email is submitted
  /// but the value not being updated, so to fix we place a setState to save the value.
  void submitEmailValue() {
    this.emailState(() {
      _createAccountFormKey.currentState.save();
    });
  }

  /// Group of functions which gives the functionalities like click events for particular buttons,
  /// state change functions.
  void _setPageFocus() {
    _firstNameFocus.addListener(() {
      this.firstNameState(() {});
    });

    _lastNameFocus.addListener(() {
      this.lastNameState(() {});
    });

    _emailFocus.addListener(() {
      this.emailState(() {});
    });

    _newPasswordFocus.addListener(() {
      this.newPasswordState(() {});
    });

    _confirmPasswordFocus.addListener(() {
      this.confirmPasswordState(() {});
    });
  }

  void _onConfirmPasswordVisibility() {
    this.confirmPasswordState(() {
      isConfirmPasswordVisible = !isConfirmPasswordVisible;
    });
  }

  void _onVisibilityChanged() {
    this.newPasswordState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void _signUpButtonClick() {
    if (_createAccountFormKey.currentState.validate()) {
      if (isRemember) {
        var store = StoreProvider.of<AppState>(context);
        store.dispatch(
          CreateUserProfileAction(
            context: context,
            userProfileModel: UserProfileModel(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              emailName: _emailController.text,
              password: _newPasswordController.text,
            ),
          ),
        );
      } else {
        Utils.showToast(
            context: context, message: FormBuilderLocalizations.of(context).checkTermsText);
      }
    }
  }

  void checkError(SignUpViewModel vm) {
    if (vm.signUpState?.error?.isNotEmpty == true &&
        vm.signUpState.currentAction == CreateUserProfileErrorAction) {
      Utils.showToast(context: context, message: vm.signUpState.error);
    } else if (vm.signUpState?.userProfileResponseModel?.isSuccessful == true &&
        vm.signUpState?.currentAction == CreateUserProfileSuccessAction) {
      Utils.navigationWithArguments(context, RoutesConstants.verifyEmailSignUp, {
        RoutesConstantsArguments.userEmailArgs: _emailController.text,
      });
    }
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameFocus.dispose();
    _lastNameFocus.dispose();
    _emailFocus.dispose();
    _newPasswordFocus.dispose();
    _confirmPasswordFocus.dispose();
    super.dispose();
  }
}

class SignUpViewModel {
  final SignUpState signUpState;

  SignUpViewModel(this.signUpState);
}
