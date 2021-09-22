import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signin/verify_identity_actions.dart';
import 'package:khontext/redux/actions/signup/verify_email_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/verify_identity_state.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signup/mail_request_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:khontext/widgets/verificationwidget/verification_page.dart';
import 'package:redux/redux.dart';

class VerifyEmailPage extends StatefulWidget {
  final String userEmail;

  const VerifyEmailPage({Key key, @required this.userEmail}) : super(key: key);

  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
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
    return StoreConnector<AppState, VerifyEmailViewModel>(
      converter: (store) =>
          VerifyEmailViewModel(store.state.signUpState, store.state.verifyIdentityState),
      builder: (context, vm) {
        checkError(vm);
        return Stack(
          children: [
            VerificationPage(
              mainTitle: FormBuilderLocalizations.of(context).welcomeText,
              smallTitle: FormBuilderLocalizations.of(context).confirmEmailText,
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
      VerifyEmailAction(
        context: context,
        verifyEmailModel: VerifyEmailModel(
          userId: userProfileResponseModel.data,
          verificationCode: code,
        ),
      ),
    );
  }

  void resendClicked() {
    store.dispatch(
      SendVerifyEmailAction(
        context: context,
        sendVerifyMailRequestModel: SendVerifyMailRequestModel(
          userId: userProfileResponseModel.data,
          toEmail: widget.userEmail,
        ),
      ),
    );
  }

  void checkError(VerifyEmailViewModel vm) {
    if (vm?.signUpState?.currentAction == VerifyIdentitySuccessAction &&
        vm?.signUpState?.verifyEmailResponseModel?.isSuccessful == true &&
        vm?.signUpState?.verifyEmailResponseModel?.data == true) {
      Utils.showToast(
          context: context, message: FormBuilderLocalizations.of(context).emailSentText);
    } else if (vm?.signUpState?.currentAction == VerifyEmailSuccessAction &&
        vm?.signUpState?.verifyEmailResponseModel?.isSuccessful == true &&
        vm?.signUpState?.verifyEmailResponseModel?.data == true) {
      Utils.navigateTo(context, RoutesConstants.addPhoneNumberSignUp);
    } else if (vm?.signUpState?.error?.isNotEmpty == true &&
        vm?.signUpState?.currentAction == VerifyEmailErrorAction) {
      Utils.showToast(context: context, message: vm?.signUpState?.error);
    }
  }
}

class VerifyEmailViewModel {
  final SignUpState signUpState;
  final VerifyIdentityState verifyIdentityState;

  VerifyEmailViewModel(this.signUpState, this.verifyIdentityState);
}
