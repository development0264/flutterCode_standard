import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/signin/verify_identity_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/redux/states/signin/verify_identity_state.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/signin/verify_identity_request_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:khontext/widgets/verificationwidget/verification_page.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

class IdentityVerificationPage extends StatefulWidget {
  const IdentityVerificationPage({Key key}) : super(key: key);

  @override
  _IdentityVerificationPageState createState() => _IdentityVerificationPageState();
}

class _IdentityVerificationPageState extends State<IdentityVerificationPage> {
  /// Variable for the [SignInState] to get the details of the sign in user
  ProfileData profileData;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    profileData = store.state.signInState.completeProfileResponseModel.data;
    if (profileData?.userId?.isNotEmpty == true && profileData?.userId != Constants.nullUser) {
      _sendVerificationCode();
    } else {
      _moveUserBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, IdentityVerificationViewModel>(
      converter: (store) => IdentityVerificationViewModel(store.state.verifyIdentityState),
      builder: (context, vm) {
        checkError(vm);
        return Stack(
          children: [
            VerificationPage(
              mainTitle: FormBuilderLocalizations.of(context).verifyIdentityText,
              smallTitle: FormBuilderLocalizations.of(context).codeSentText,
              continueButtonClick: (codeReceived) => continueBtnClick(codeReceived),
              resendCode: resendClicked,
            ),
            if (vm.verifyIdentityState.isLoading) ...[
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
      VerifyIdentityAction(
        context: context,
        verifyIdentityRequestModel: VerifyIdentityRequestModel(
          userId: profileData.userId,
          verificationCode: code,
        ),
      ),
    );
  }

  void resendClicked() {
    _sendVerificationCode();
  }

  void _moveUserBack() {
    Utils.showToast(context: context, message: FormBuilderLocalizations.of(context).noUserText);
    Navigator.of(context).pop();
  }

  void _sendVerificationCode() {
    store.dispatch(SendIdentificationCodeAction(context: context, userId: profileData.userId));
  }

  void checkError(IdentityVerificationViewModel vm){
    if(vm?.verifyIdentityState?.error?.isNotEmpty == true){
      Utils.showToast(context: context, message: vm.verifyIdentityState.error);
    }
  }
}

class IdentityVerificationViewModel {
  final VerifyIdentityState verifyIdentityState;

  IdentityVerificationViewModel(this.verifyIdentityState);
}
