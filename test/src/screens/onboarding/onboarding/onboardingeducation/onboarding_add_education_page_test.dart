import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

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
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_add_education_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingexperience/onboarding_add_experience_page.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/flavor_config.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:mockito/annotations.dart';
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
      if (request.url.path.contains(ApiEndpoints.addDocumentFile)) {
        return http.Response(
            json.encode(MockOnBoardingAddEducationData.documentUploadSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.addUpdateOnBoardingEducation)) {
        return http.Response(
            json.encode(MockOnBoardingAddEducationData.addEducationSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getOnBoard)) {
        return http.Response(
            json.encode(MockOnBoardingAddEducationData.onBoardingDataSuccessResponse), 200);
      }

      return http.Response(null, 400);
    });
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.onBoardingEducationScreen: (context) => OnBoardingAddExperiencePage(),
        },
      ),
    );
  }

  group('Other click events group for onboarding add education', () {
    testWidgets("Pumping root widget", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    testWidgets('Fields entry test', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.enterText(find.byKey(Key(Constants.schoolKey)), "test@mailinator.com");
      await tester.enterText(find.byKey(Key(Constants.studyFieldKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.degreeKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.gradeKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.activitiesAndSocietiesKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.descriptionKey)), "test@123");
    });

    testWidgets('Getting functions calls coverage', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));
      final OnBoardingAddEducationPageState onBoardingAddEducationPageState =
          tester.state(find.byType(OnBoardingAddEducationPage));

      onBoardingAddEducationPageState.onStartDateChanged(DateTime.now());
      onBoardingAddEducationPageState.onEndDateChanged(DateTime.now());
      onBoardingAddEducationPageState.hideEndDateToggle(false);
      onBoardingAddEducationPageState.pickEducationDocument();
      onBoardingAddEducationPageState.onDeleteDocumentClick();
    });

    testWidgets('Apply button click with validation but no document', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddEducationPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));
      final OnBoardingAddEducationPageState onBoardingAddEducationPageState =
          tester.state(find.byType(OnBoardingAddEducationPage));

      await tester.enterText(find.byKey(Key(Constants.schoolKey)), "test@mailinator.com");
      await tester.enterText(find.byKey(Key(Constants.studyFieldKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.degreeKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.gradeKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.activitiesAndSocietiesKey)), "test@123");
      await tester.enterText(find.byKey(Key(Constants.descriptionKey)), "test@123");

      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.educationApplyButtonKey)), warnIfMissed: false);
        await tester.pumpAndSettle(Duration(seconds: 4));
      });
      await tester.pump(Duration(seconds: 5));
    });
  });

  testWidgets('Apply button click with validation and document', (WidgetTester tester) async {
    await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddEducationPage()));
    await tester.pumpAndSettle(Duration(seconds: 3));
    final OnBoardingAddEducationPageState onBoardingAddEducationPageState =
        tester.state(find.byType(OnBoardingAddEducationPage));

    Uint8List decodedImage = base64Decode(MockOnBoardingAddEducationData.testImageData);
    onBoardingAddEducationPageState.selectedDocumentFile = File.fromRawPath(decodedImage);
    onBoardingAddEducationPageState.fileOrDocumentInformationRequest =
        FileOrDocumentInformationRequest(
      name: 'test',
      base64: MockOnBoardingAddEducationData.testImageData,
      fileType: 'Image',
    );

    await tester.enterText(find.byKey(Key(Constants.schoolKey)), "test@mailinator.com");
    await tester.enterText(find.byKey(Key(Constants.studyFieldKey)), "test@123");
    await tester.enterText(find.byKey(Key(Constants.degreeKey)), "test@123");
    await tester.enterText(find.byKey(Key(Constants.gradeKey)), "test@123");
    await tester.enterText(find.byKey(Key(Constants.activitiesAndSocietiesKey)), "test@123");
    await tester.enterText(find.byKey(Key(Constants.descriptionKey)), "test@123");

    await tester.runAsync(() async {
      await tester.tap(find.byKey(Key(Constants.educationApplyButtonKey)), warnIfMissed: false);
      await tester.pumpAndSettle(Duration(seconds: 4));
    });
    await tester.pump(Duration(seconds: 5));
  });
}

class MockOnBoardingAddEducationData {
  static final testImageData =
      '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';

  static final documentUploadSuccessResponse = {
    "data": {
      "fileOrDocumentInformations": [
        {
          "fileDocumentId": "2898052a-32d6-4ebe-9be6-650eeb1c60a2",
          "name": "icon",
          "base64":
              "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",
          "captions": null,
          "description": null,
          "fileUniqueName": null,
          "thumbnailPath": null,
          "url": null,
          "thumbnailUrl": null,
          "size": 0,
          "mimeType": "png",
          "extension": null,
          "width": 0,
          "height": 0,
          "fileType": "Image",
          "aspectRatio": null
        }
      ]
    },
    "message": "Success",
    "errors": [],
    "isSuccessful": true
  };

  static final addEducationSuccessResponse = {
    "data": [
      {
        "educationId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "userId": "3fa85f64-5717-4562-b3fc-2c963f66afa6",
        "schoolName": "string",
        "degree": "string",
        "fieldOfStudy": "string",
        "startMonthAndYearDate": "2021-09-16T10:10:32.751Z",
        "endMonthAndYearDate": "2021-09-16T10:10:32.751Z",
        "grade": "string",
        "activitiesAndSocieties": "string",
        "description": "string",
        "fileOrDocumentResponse": null
      }
    ],
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final onBoardingDataSuccessResponse = {
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
}
