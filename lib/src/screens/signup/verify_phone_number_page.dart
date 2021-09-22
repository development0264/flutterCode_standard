import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signup/send_phone_verification_action.dart';
import 'package:khontext/redux/actions/signup/verify_phone_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/reducers/signup/sign_up_reducer.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:khontext/widgets/verificationwidget/verification_page.dart';
import 'package:redux/redux.dart';

class VerifyPhoneNumberPage extends StatefulWidget {
  final String phoneNumber;
  final String countryCode;

  const VerifyPhoneNumberPage({Key key, this.phoneNumber, this.countryCode}) : super(key: key);

  @override
  _VerifyPhoneNumberPageState createState() => _VerifyPhoneNumberPageState();
}

class _VerifyPhoneNumberPageState extends State<VerifyPhoneNumberPage> {
  /// Variable for the [SignUpState] to get the details of the sign in user
  UserProfileResponseModel userProfileResponseModel;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    userProfileResponseModel = store.state.signUpState.userProfileResponseModel;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, VerifyPhoneViewModel>(
      converter: (store) => VerifyPhoneViewModel(store.state.signUpState),
      builder: (context, vm) {
        checkError(vm);
        return Stack(
          children: [
            VerificationPage(
              mainTitle: FormBuilderLocalizations.of(context).verifyIdentityText,
              smallTitle:
                  "${FormBuilderLocalizations.of(context).verifyPhoneSecurityText} ${widget.countryCode} ${widget.phoneNumber}",
              continueButtonClick: (codeReceived) => continueBtnClick(codeReceived),
              resendCode: resendClicked,
            ),
            if (vm.signUpState.isLoading) ...[
              BaseLoadingWidget(),
            ],
          ],
        );
      },
    );
  }

  /// Group of functions which performs the actions in this page.
  ///
  /// This actions contains functionalities like click events, change state of the field, api calls.
  void continueBtnClick(String code) {
    store.dispatch(
      VerifyPhoneAction(
        context: context,
        verifyPhoneModel: VerifyPhoneModel(
          userId: userProfileResponseModel.data,
          verificationCode: code,
        ),
      ),
    );
  }

  void resendClicked() {
    store.dispatch(
      SendPhoneVerificationAction(
        context: context,
        isResend: true,
        sendVerificationPhoneModel: SendVerificationPhoneModel(
          userId: userProfileResponseModel.data,
          toNumber: widget.phoneNumber,
          countryCode: widget.countryCode,
        ),
      ),
    );
  }

  void checkError(VerifyPhoneViewModel vm) {
    if (vm?.signUpState?.error?.isNotEmpty == true &&
        (vm?.signUpState?.currentAction == VerifyPhoneErrorAction ||
            vm?.signUpState?.currentAction == sendPhoneVerificationError)) {
      Utils.showToast(context: context, message: vm.signUpState.error);
    } else if (vm?.signUpState?.verifyPhoneResponseModel?.isSuccessful == true &&
        vm?.signUpState?.verifyPhoneResponseModel?.data == true &&
        vm?.signUpState?.currentAction == VerifyPhoneSuccessAction) {
      Utils.navigateTo(context, RoutesConstants.userRolePage);
    }
  }
}

class VerifyPhoneViewModel {
  final SignUpState signUpState;

  VerifyPhoneViewModel(this.signUpState);
}
