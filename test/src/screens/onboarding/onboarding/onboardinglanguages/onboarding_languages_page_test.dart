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
import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_add_education_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_add_languages_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_languages_page.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/flavor_config.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

import '../../../signin/signin/sign_in_test.dart';

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
      if (request.url.path.contains(ApiEndpoints.deleteOnBoardingLanguage)) {
        return http.Response(
            json.encode(MockOnBoardingLanguagesData.deleteLanguageSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getOnBoard)) {
        return http.Response(json.encode(MockOnBoardingLanguagesData.onBoardingData), 200);
      }

      return http.Response(null, 400);
    });
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.onBoardingAddEducationScreen: (context) => OnBoardingAddEducationPage(),
          RoutesConstants.onBoardingAddLanguagesScreen: (context) => OnBoardingAddLanguagesPage(),
        },
      ),
    );
  }

  group('Other click events group languages page', () {
    testWidgets("Pumping root widget", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    testWidgets('Testing the previous step button', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.previousButtonKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });

    testWidgets('Testing the click event of the add language', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.addButtonKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });

    testWidgets('Pumping the current page', (WidgetTester tester) async {
      store.state.onBoardingState.onBoardingDataResponseModel =
          MockOnBoardingLanguagesData.onBoardingDataSuccessResponse;

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.deleteButtonKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
    });

    testWidgets('Testing the next step button', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.nextStepBtnKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });
  });
}

class MockOnBoardingLanguagesData {
  static final onBoardingData = {
    "data": {
      "addressAndServices": {
        "addressId": "50a556c3-5a80-42d7-b316-00b92f61efde",
        "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
        "line1": "",
        "line2": "",
        "city": "Surat",
        "state": "Gujara",
        "zipCode": "395009",
        "country": "India",
        "services": [
          {
            "onboardQuizServiceId": "a4bb235c-0603-4292-8a9b-7273356d3475",
            "name": "Documents translation",
            "code": "Documents",
            "description": "The documents translation."
          },
          {
            "onboardQuizServiceId": "b0f8c91a-3f19-462e-bf65-fe274a5fb25f",
            "name": "On demand translation",
            "code": "OnDemand",
            "description": "The on demand translation."
          }
        ],
        "ratePerHour": "10",
        "ratePerPage": "12",
        "ratePerMileOrKm": "5",
        "about": ""
      },
      "language": [
        {
          "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
          "translatorLanguagesId": "ba21e0d0-cd78-4cea-865e-d14d65d53bf0",
          "languagesResponse": {
            "languageId": "c5bdb827-c8da-4e1d-afdd-74923d0633d4",
            "name": "Abkhazian",
            "code": "ab",
            "locale": "",
            "directionality": "ltr",
            "localName": "b'ÐÒ§ÑÑÐ°'"
          },
          "proficiencyLevelsResponse": {
            "proficiencyLevelId": "770c8d5c-36c2-4258-bb7b-b6504150e236",
            "name": "Basic",
            "code": "Basic",
            "description": "The basic proficiency level."
          },
          "specializationsResponses": [
            {
              "specializationId": "64b2329f-1fe7-4749-8259-4d2b38abb6ab",
              "name": "Legal",
              "code": "Legal",
              "description": "The legal transtion"
            }
          ]
        }
      ],
      "education": null,
      "experience": null,
      "identification": null
    },
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final onBoardingDataSuccessResponse = OnBoardingDataResponseModel.fromJson(onBoardingData);

  static final deleteLanguageSuccessResponse = {
    "data": true,
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };
}
