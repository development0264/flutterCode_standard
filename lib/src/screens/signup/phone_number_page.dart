import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signup/check_phone_number_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/reducers/signup/sign_up_reducer.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_country_code.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/phone_number_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PhoneNumberPage extends StatefulWidget {
  const PhoneNumberPage({Key key}) : super(key: key);

  @override
  _PhoneNumberPageState createState() => _PhoneNumberPageState();
}

class _PhoneNumberPageState extends State<PhoneNumberPage> {
  /// Global key for maintaining the state of the form.
  final _phoneNumberFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire sign up form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _phoneController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _phoneFocus = FocusNode();

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter phoneState;

  /// [String] which gives the selected country code for the api.
  String dialCode = '+91';

  @override
  void initState() {
    super.initState();
    _phoneFocus.addListener(() {
      this.phoneState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      baseChild: StoreConnector<AppState, CheckPhoneViewModel>(
        converter: (store) => CheckPhoneViewModel(store, store.state.signUpState),
        builder: (context, vm) {
          checkError(vm);
          return Stack(
            children: [
              _rootPhoneView(),
              if (vm.signUpState.isLoading) ...[
                BaseLoadingWidget(),
              ],
            ],
          );
        },
      ),
    );
  }

  Widget _rootPhoneView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).welcomeText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.extraLargeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).phoneConfirmText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.TextColor,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _phoneForm(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _continueButton(),
      ],
    );
  }

  /// Widget function which gives the phone form.
  Widget _phoneForm() {
    return FormBuilder(
      key: _phoneNumberFormKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CountryCodePickerForm(
            isRadius: false,
            selectedCountry: (Map<String, String> selectedCountry) =>
                onCountryCodeChanged(selectedCountry['dial_code']),
          ),
          Expanded(
            child: StatefulBuilder(builder: (context, stateSetter) {
              this.phoneState = stateSetter;
              return FormBuilderTextField(
                name: Constants.signUpPhoneNumber,
                controller: _phoneController,
                focusNode: _phoneFocus,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.phone,
                decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).phoneNumberHintText,
                  focusNode: _phoneFocus,
                  isDistinctRadius: true,
                ),
                validator: FormBuilderValidators.required(context,
                    errorText: FormBuilderLocalizations.of(context).emptyPhoneNumberErrorText),
              );
            }),
          ),
        ],
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
      onPressed: () => _continueButtonClick(),
    );
  }

  /// Group of functions which gives the click events for particular buttons.
  void _continueButtonClick() {
    if (_phoneNumberFormKey.currentState.validate()) {
      String phoneNumber = _phoneController.text;
      var store = StoreProvider.of<AppState>(context);
      UserProfileResponseModel responseModel = store.state.signUpState.userProfileResponseModel;
      store.dispatch(
        CheckPhoneNumberAction(
          context: context,
          userId: responseModel.data,
          phoneNumber: PhoneNumberRequestModel(
            countryCode: dialCode,
            phoneNumber: phoneNumber,
          ),
        ),
      );
    }
  }

  void onCountryCodeChanged(String code) {
    dialCode = code;
  }

  void checkError(CheckPhoneViewModel vm) {
    if (vm?.signUpState?.isLoading == false &&
        vm?.signUpState?.error?.isNotEmpty == true &&
        (vm?.signUpState?.currentAction == CheckPhoneNumberErrorAction ||
            vm?.signUpState?.currentAction == sendPhoneVerificationError)) {
      Utils.showToast(message: vm.signUpState.error, context: context);
    }
  }

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }
}

class CheckPhoneViewModel {
  final Store<AppState> store;
  final SignUpState signUpState;

  CheckPhoneViewModel(this.store, this.signUpState);
}
