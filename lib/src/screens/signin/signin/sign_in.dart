import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signin/sign_in_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signin/sign_in_request_model.dart';
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

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  /// Global key for maintaining the state of the form.
  final _signInFormKey = GlobalKey<FormBuilderState>();

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key userNameKey = Key(Constants.signInUserName);
  Key passwordKey = Key(Constants.signInPassword);
  Key rememberMeKey = Key(Constants.rememberMe);
  Key visibilityKey = Key(Constants.visibilitySignIn);
  Key signUpKey = Key(Constants.signUpKey);
  Key continueButtonKey = Key(Constants.continueButtonSignIn);
  Key forgetPasswordKey = Key(Constants.forgetPasswordSignIn);

  /// [TextEditingController] for the entire sign in form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _userNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  /// [bool] value which holds the toggle flags.
  bool isRemember = false;
  bool isPasswordVisible = true;

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter formState;

  @override
  void initState() {
    super.initState();
    _userNameFocus.addListener(() {
      this.formState(() {});
    });

    _passwordFocus.addListener(() {
      this.formState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, SignInViewModel>(
        converter: (store) => SignInViewModel(store.state.signInState),
        builder: (context, vm) {
          checkError(vm);
          return Stack(
            children: [
              signInUi(),
              if (vm.signInState.isLoading) ...[
                BaseLoadingWidget(),
              ],
            ],
          );
        },
      ),
    );
  }

  ///TODO Place the logic for remember me when the logout button is placed.
  /// Widget function which gives the root ui for the sign in page along with all the widgets.
  Widget signInUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).seeYouBackText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).signInTitleText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        signInForm(),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        _accountActionsLayout(),
        Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
        BaseButtonWidget(
          key: continueButtonKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).signInText,
              textStyle: Styles.customTextStyle(textColor: Colors.white)),
          onPressed: continueBtnClick,
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _noAccountLayout(),
        SocialLoginWidget(context: context),
      ],
    );
  }

  /// Widget which gives the form for the sign in.
  Widget signInForm() {
    return FormBuilder(
      key: _signInFormKey,
      child: StatefulBuilder(builder: (BuildContext context, StateSetter showPasswordState) {
        this.formState = showPasswordState;
        return Column(
          children: [
            FormBuilderTextField(
              key: userNameKey,
              name: Constants.signInUserName,
              controller: _userNameController,
              textInputAction: TextInputAction.next,
              focusNode: _userNameFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).userNameHintText,
                focusNode: _userNameFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).emptyUsernameErrorText),
            ),
            Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
            FormBuilderTextField(
              key: passwordKey,
              name: Constants.signInPassword,
              controller: _passwordController,
              focusNode: _passwordFocus,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).passwordHintText,
                focusNode: _passwordFocus,
                suffixIcon: _visibilityWidget(),
              ),
              validator: FormBuilderValidators.compose([
                FormBuilderValidators.required(context,
                    errorText: FormBuilderLocalizations.of(context).emptyPasswordErrorText),
                FormBuilderValidators.minLength(context, 6,
                    errorText: FormBuilderLocalizations.of(context).passwordLengthErrorText)
              ]),
              obscureText: isPasswordVisible,
            ),
          ],
        );
      }),
    );
  }

  /// Widget function which gives the UI for the textfield visibility
  Widget _visibilityWidget(){
    return GestureDetector(
      key: visibilityKey,
      child: Icon(
        isPasswordVisible ? Icons.visibility : Icons.visibility_off,
        color: Palette.AppThemeColor,
      ),
      onTap: () => _onVisibilityChanged(),
    );
  }

  /// Widget function which gives the UI for the account actions button like [RememberMe] and
  /// [ForgotPassword].
  Widget _accountActionsLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FormBuilderCheckbox(
          key: rememberMeKey,
          name: Constants.rememberMe,
          decoration: Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
          initialValue: false,
          activeColor: Palette.AppThemeColor,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          contentPadding: EdgeInsets.zero,
          onChanged: (value) => onCheckboxChangeValue(value),
          title: FormBuilderText(
            message: FormBuilderLocalizations.of(context).rememberMeText,
            textStyle: Styles.customTextStyle(
                textSize: Palette.smallFontSize, textColor: Palette.TextColor),
          ),
        ),
        InkWell(
          key: forgetPasswordKey,
          onTap: () => _forgotPasswordClick(),
          splashColor: Colors.transparent,
          child: FormBuilderText(
            message: FormBuilderLocalizations.of(context).forgetPasswordText,
            textStyle: Styles.customTextStyle(
              textSize: Palette.smallFontSize,
              textColor: Palette.TextColor,
            ),
          ),
        ),
      ],
    );
  }

  /// Custom widget for the text saying if user don't have the account.
  Widget _noAccountLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).noAccountText,
          textStyle:
              Styles.customTextStyle(textSize: Palette.smallFontSize, textColor: Palette.TextColor),
        ),
        SizedBox(width: Palette.mediumSpace),
        InkWell(
          key: signUpKey,
          splashColor: Colors.transparent,
          onTap: moveToSignUpPage,
          child: Text(
            FormBuilderLocalizations.of(context).signUpText,
            style: Styles.customTextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  /// Function for navigating to the sign up page.
  void moveToSignUpPage() {
    Utils.navigateTo(context, RoutesConstants.signUp);
  }

  /// Group of functions which gives the click events for particular buttons.
  void continueBtnClick() {
    if (_signInFormKey.currentState.validate()) {
      var store = StoreProvider.of<AppState>(context);
      store.dispatch(
        SignInAction(
          context: context,
          signInRequestModel: SignInRequestModel(
            userName: _userNameController.text,
            password: _passwordController.text,
            rememberMe: isRemember,
          ),
        ),
      );
    }
  }

  void _forgotPasswordClick() {
    // Utils.navigateTo(context, RoutesConstants.forgotPassword);
    Utils.navigateTo(context, RoutesConstants.onBoardingAddressScreen);
  }

  void _onVisibilityChanged() {
    this.formState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void checkError(SignInViewModel vm) {
    if (vm?.signInState?.isLoading == false && vm?.signInState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.signInState.error);
    }
  }

  void onCheckboxChangeValue(bool value){
    isRemember = value;
    Utils.setBoolToPrefs(Constants.rememberMe, isRemember);
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    _userNameFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }
}

class SignInViewModel {
  final SignInState signInState;

  SignInViewModel(this.signInState);
}
