import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:demo/redux/actions/signin/sign_in_action.dart';
import 'package:demo/redux/app_state.dart';
import 'package:demo/src/demo_widgets/localization/form_builder_localizations.dart';
import 'package:demo/src/models/complete_profile_response_model.dart';
import 'package:demo/src/screens/signin/apiprovider/sign_in_api.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/routes_constants.dart';
import 'package:demo/utils/utils.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

/// [AppMiddleware] will provide the middleware for the actions and reducers to connect.
class AppMiddleware {
  /// [List] of middleware which will exist in the application.
  List<Middleware<AppState>> createMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),

      /// Sign in calls
      TypedMiddleware<AppState, SignInAction>(_userSignIn),

    ];
  }

  void _logAction(
      Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    print("Action => $action");
  }

  /// Function which will hold the logic and api call for the [SignInAction].
  void _userSignIn(
      Store<AppState> store, SignInAction action, NextDispatcher next) async {
    next(action);
    try {
      CompleteProfileResponseModel completeProfileResponseModel =
          await SignInApiCalls.signInUser(action.signInRequestModel);
      if (completeProfileResponseModel.isSuccessful &&
          completeProfileResponseModel?.data?.userId != Constants.nullUser) {
        String userName = _getFromName(completeProfileResponseModel);

        store.dispatch(SignInSuccessAction(
            completeProfileResponseModel: completeProfileResponseModel));
        Utils.navigateTo(action.context, RoutesConstants.identityVerification);
      } else {
        store.dispatch(SignInErrorAction(
            error: FormBuilderLocalizations.of(action.context).noUserText));
      }
    } catch (e) {
      store.dispatch(SignInErrorAction(
          error: FormBuilderLocalizations.of(action.context).noUserText));
    }
  }

  /// Function which takes in the context and route to move user to that particular page on the
  /// base of the api calls.
  void moveToNextRoute(
      BuildContext context, String nextRoute, Store<AppState> store) {
    // OnBoardingData onBoardingData = store.state.onBoardingState.onBoardingDataResponseModel.data;
    switch (nextRoute) {
      case RoutesConstants.onBoardingAddLanguagesScreen:
        /* if (onBoardingData?.language?.isNotEmpty == true) {
          Utils.navigateTo(context, RoutesConstants.onBoardingLanguagesScreen);
        } else {
          Utils.navigateTo(context, nextRoute);
        }*/
        break;
      case RoutesConstants.onBoardingLanguagesScreen:
        Utils.navigateReplacement(context, nextRoute);
        break;
      case RoutesConstants.onBoardingEducationScreen:
        Utils.navigateReplacement(context, nextRoute);
        break;
    }
  }

  String checkJobEssentialsErrors() {
    return null;
  }

  String _getFromName(CompleteProfileResponseModel completeProfileResponseModel,
      {bool isName: false}) {
    List<String> tempAd = [];
    List<String> list = [
      completeProfileResponseModel?.data?.firstName,
      completeProfileResponseModel?.data?.lastName
    ];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i].isNotEmpty) {
        tempAd.add(list[i]);
      }
    }

    if (isName) {
      return tempAd.join(' ');
    }
    return tempAd.join('_');
  }

  void showMessageToast({
    String message: '',
    @required BuildContext context,
  }) {
    print("the load 00000");
    Toast.show(
      message,
      context,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      gravity: 0,
    );
  }
}
