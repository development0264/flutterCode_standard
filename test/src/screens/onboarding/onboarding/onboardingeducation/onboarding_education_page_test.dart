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
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_education_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingexperience/onboarding_add_experience_page.dart';
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
      if (request.url.path.contains(ApiEndpoints.deleteOnBoardingEducation)) {
        return http.Response(
            json.encode(MockOnBoardingAddExperienceData.deleteEducationSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getOnBoard)) {
        return http.Response(json.encode(MockOnBoardingAddExperienceData.onBoardingData), 200);
      }

      return http.Response(null, 400);
    });
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.onBoardingAddExperienceScreen: (context) => OnBoardingAddExperiencePage(),
          RoutesConstants.onBoardingAddEducationScreen: (context) => OnBoardingAddEducationPage(),
        },
      ),
    );
  }

  group('Other click events group education page', () {
    testWidgets("Pumping root widget", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    testWidgets('Testing the previous step button', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.previousButtonKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });

    testWidgets('Testing the click event of the add education', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.educationAddButtonKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });

    testWidgets('Pumping the current page', (WidgetTester tester) async {
      store.state.onBoardingState.onBoardingDataResponseModel =
          MockOnBoardingAddExperienceData.onBoardingDataSuccessResponse;

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.educationDeleteButtonKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
    });

    testWidgets('Testing the next step button', (WidgetTester tester) async{
      final mockObserver = MockNavigatorObserver();

      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.nextStepBtnKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });
  });
}

class MockOnBoardingAddExperienceData {
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
          },
          {
            "onboardQuizServiceId": "f04e52fe-6dcc-457c-9454-8fe949c1625b",
            "name": "Onsite/In-person translation",
            "code": "OnsiteInPerson",
            "description": "The onsite/In-person translation."
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
          "translatorLanguagesId": "08c084db-73df-4b8a-8421-4ccd7af53923",
          "languagesResponse": {
            "languageId": "ad522389-3276-48ed-9c9c-6293cab2a1af",
            "name": "Ligurian",
            "code": "lij",
            "locale": "",
            "directionality": "ltr",
            "localName": "b'LÃ­guru'"
          },
          "proficiencyLevelsResponse": {
            "proficiencyLevelId": "55ec99cb-1d01-451a-9c25-6d8063be279a",
            "name": "Advanced",
            "code": "Advanced",
            "description": "The advanced proficiency level."
          },
          "specializationsResponses": [
            {
              "specializationId": "53cb4bf6-fe41-4858-a836-87028fcc9984",
              "name": "Literary",
              "code": "Literary",
              "description": "The literary translation"
            }
          ]
        },
      ],
      "education": [
        {
          "educationId": "e54c2f2a-e4ca-440c-906e-a4bef7aba7f4",
          "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
          "schoolName": "school",
          "degree": "degree",
          "fieldOfStudy": "test",
          "startMonthAndYearDate": "2011-09-03T00:00:00",
          "endMonthAndYearDate": "2020-09-24T00:00:00",
          "grade": "grade",
          "activitiesAndSocieties": "activity",
          "description": "description",
          "fileOrDocumentResponse": {
            "fileDocumentId": "04670c23-ef58-47c8-8797-b5df9cb89760",
            "name": "IMG_20210914_160007",
            "base64": null,
            "captions": null,
            "description": null,
            "fileUniqueName": null,
            "thumbnailPath": null,
            "url": null,
            "thumbnailUrl": null,
            "size": 0,
            "mimeType": null,
            "extension": null,
            "width": 0,
            "height": 0,
            "fileType": "Image",
            "aspectRatio": null
          }
        }
      ],
      "experience": null,
      "identification": null
    },
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final onBoardingDataSuccessResponse = OnBoardingDataResponseModel.fromJson(onBoardingData);

  static final deleteEducationSuccessResponse = {
    "data": true,
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };
}
