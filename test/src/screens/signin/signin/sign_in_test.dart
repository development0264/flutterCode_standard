import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/khontext_app.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/store/store.dart';
import 'package:khontext/src/models/signin/sign_in_request_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/screens/forgotpassword/forget_password_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingaddress/onboarding_address_page.dart';
import 'package:khontext/src/screens/onboarding/preonboarding/welcome_screen.dart';
import 'package:khontext/src/screens/signin/apiprovider/sign_in_api.dart';
import 'package:khontext/src/screens/signin/signin/sign_in.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/flavor_config.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  Store<AppState> store;
  setUpAll(() {
    FlavorConfig(
        flavor: Flavor.DEV,
        values: FlavorValues(baseUrl: ApiEndpoints.baseUrlDev),
        color: Colors.grey);
    store = appStore();
  });

  Widget createWidgetForTesting({Widget child}) {
    ApiProvider.client = MockClient((request) async {
      if (request.url.path.contains(ApiEndpoints.signInUser)) {
        SignInRequestModel signInRequestModel = signInRequestModelFromJson(request.body.toString());

        if (signInRequestModel.userName == 'hemil@mailinator.com' &&
            signInRequestModel.password == 'test@123') {
          return http.Response(json.encode(MockSignInData.successLoginResponse), 200);
        } else {
          return http.Response(json.encode(MockSignInData.failLoginResponse), 200);
        }
      } else if (request.url.path.contains(ApiEndpoints.userChatToken)) {
        return http.Response(json.encode(MockSignInData.chatTokenSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getUserAddressList)) {
        return http.Response(json.encode(MockSignInData.userAddressListSuccess), 200);
      }

      return http.Response(null, 400);
    });
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.forgotPassword: (context) => ForgetPasswordPage(),
          RoutesConstants.signUp: (context) => CreateAccountPage(),
          RoutesConstants.welcomeScreen: (context) => WelcomeScreenPage(),
          RoutesConstants.onBoardingAddressScreen: (context) => OnBoardingAddressPage(),
        },
      ),
    );
  }

  group("Other click events", () {
    testWidgets("Pumping root widget", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      Utils.setStringToPrefs(Constants.userToken, MockSignInData.USER_TOKEN);
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    /// Test case which will show the different button click events.
    testWidgets('Click events for sign up button in sign in page', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: SignInPage()));
      await tester.tap(find.byKey(Key(Constants.signUpKey)));
      await tester.pump(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });

    /// Test case which will show the different button click events.
    testWidgets('Click events for forget password button in sign in page',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: SignInPage()));
      await tester.tap(find.byKey(Key(Constants.forgetPasswordSignIn)));
      await tester.pump(Duration(seconds: 2));
      verifyNever(mockObserver.didPush(any, any));
    });

    /// Test case which will show the different button click events.
    testWidgets('Click events for visibility icon button in sign in page',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: SignInPage()));

      await tester.tap(find.byKey(Key(Constants.visibilitySignIn)));
      await tester.pump(Duration(seconds: 2));
      verifyNever(mockObserver.didPush(any, any));
    });

    test('Test the sign in page checkbox value change function', () {
      SignInPage().createState().onCheckboxChangeValue(false);
    });
  });

  group('Sign in button click group', () {
    testWidgets("Pumping root widget and sign in page", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    testWidgets("Sign in root widget test with wrong data", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: SignInPage()));
      await tester.enterText(find.byKey(Key(Constants.signInUserName)), "test@mailinator.com");
      await tester.enterText(find.byKey(Key(Constants.signInPassword)), "test@123");
      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.continueButtonSignIn)), warnIfMissed: false);
        await tester.pump();
      });
      await tester.pump(Duration(seconds: 4));
    });

    testWidgets("Sign in root widget test with true data", (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: SignInPage()));
      await tester.enterText(find.byKey(Key(Constants.signInUserName)), "hemil@mailinator.com");
      await tester.enterText(find.byKey(Key(Constants.signInPassword)), "test@123");
      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.continueButtonSignIn)), warnIfMissed: false);
        await tester.pump(Duration(seconds: 5));
      });
    });

    test('Sign in api call with correct data', () async {
      CompleteProfileResponseModel completeProfileResponseModel =
          await SignInApiCalls.signInUser(SignInRequestModel(
        userName: 'hemil@mailinator.com',
        password: 'test@123',
        rememberMe: false,
      ));

      expect(completeProfileResponseModel.errors, isEmpty);
    });

    test('Sign in api call with false data', () async {
      CompleteProfileResponseModel completeProfileResponseModel =
          await SignInApiCalls.signInUser(SignInRequestModel(
        userName: 'test@mailinator.com',
        password: 'test@123',
        rememberMe: false,
      ));

      expect(completeProfileResponseModel.data.userId, Constants.nullUser);
    });
  });
}

class MockSignInData {
  static const USER_TOKEN = '8670c92f-6616-445b-9ea0-d1c9d41a467d';
  static final failLoginResponse = {
    "data": {
      "userId": "00000000-0000-0000-0000-000000000000",
      "firstName": null,
      "lastName": null,
      "username": null,
      "token": null,
      "email": null,
      "phone": null,
      "isEmailVerified": false,
      "isPhoneVerified": false,
      "roles": [],
      "customerId": null,
      "accountId": null,
      "isAccount": false,
      "isExternalAccountCard": false,
      "isAccountLink": false,
      "isAccountVerified": false,
      "isIdVerified": false,
      "checkrId": null,
      "checkrReportId": null,
      "checkrReportResult": null
    },
    "message": "",
    "errors": [],
    "isSuccessful": true
  };

  static final successLoginResponse = {
    "data": {
      "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
      "firstName": "Test",
      "lastName": "user",
      "username": null,
      "token": null,
      "email": "hemil@mailinator.com",
      "phone": "0011223355",
      "isEmailVerified": true,
      "isPhoneVerified": true,
      "roles": [],
      "customerId": null,
      "accountId": null,
      "isAccount": false,
      "isExternalAccountCard": false,
      "isAccountLink": false,
      "isAccountVerified": false,
      "isIdVerified": false,
      "checkrId": null,
      "checkrReportId": null,
      "checkrReportResult": null
    },
    "message": "",
    "errors": [],
    "isSuccessful": true
  };

  static final chatTokenSuccessResponse = {
    "data":
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCIsImN0eSI6InR3aWxpby1mcGE7dj0xIn0.eyJpc3MiOiJTSzBlMTIwN2QxYjk1Y2UxZDg1ZDY1NGVmMzRkMGRmMWQxIiwiZXhwIjoxNjMwNTgwMDU5LCJqdGkiOiJTSzBlMTIwN2QxYjk1Y2UxZDg1ZDY1NGVmMzRkMGRmMWQxLTE2MzA1NzY0NTkiLCJzdWIiOiJBQ2ZmM2Y0MmMxNDMyOGRiOTI1ZjhiODNmYTlkYzU4Y2I0IiwiZ3JhbnRzIjp7ImlkZW50aXR5IjoiODY3MGM5MmYtNjYxNi00NDViLTllYTAtZDFjOWQ0MWE0NjdkIiwiY2hhdCI6eyJzZXJ2aWNlX3NpZCI6IklTNTlhMTIwM2E1NWQxNGFjNTg3NzYxYjgyMjYyNmI2YjkifX19.ARf999B7zWb66KvOxH0vUvaJFdeTJdkxxQXIQazvSCQ",
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final userAddressListSuccess = {
    "data": [],
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };
}
