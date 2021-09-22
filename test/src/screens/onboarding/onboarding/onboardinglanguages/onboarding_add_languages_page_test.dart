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
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_add_education_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_add_languages_page.dart';
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
      if (request.url.path.contains(ApiEndpoints.languages)) {
        return http.Response(json.encode(MockOnBoardingLanguageData.languagesSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.specializations)) {
        return http.Response(
            json.encode(MockOnBoardingLanguageData.specializationsSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.proficiencyLevel)) {
        return http.Response(
            json.encode(MockOnBoardingLanguageData.proficiencySuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.addUpdateOnBoardingLanguage)) {
        return http.Response(
            json.encode(MockOnBoardingLanguageData.addLanguageSuccessResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getOnBoard)) {
        return http.Response(json.encode(MockOnBoardingLanguageData.onBoardingData), 200);
      }

      return http.Response(null, 400);
    });
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.onBoardingEducationScreen: (context) => OnBoardingAddEducationPage(),
        },
      ),
    );
  }

  group('Other click events group', () {
    testWidgets("Pumping root widget", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    testWidgets('Click events for language', (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.languageViewKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
    });

    testWidgets('Click on the specializations', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));
      final OnBoardingAddLanguagesPageState onBoardingAddLanguagesPageState =
          tester.state(find.byType(OnBoardingAddLanguagesPage));

      onBoardingAddLanguagesPageState.onNewSpecializationsSelected(
        SpecializationsData(
          specializationId: '64b2329f-1fe7-4749-8259-4d2b38abb6ab',
          name: 'Legal',
          code: 'Legal',
          description: 'The legal transtion',
        ),
      );
      onBoardingAddLanguagesPageState.specializationDataList = [
        SpecializationsData(
          specializationId: '64b2329f-1fe7-4749-8259-4d2b38abb6ab',
          name: 'Legal',
          code: 'Legal',
          description: 'The legal transtion',
        ),
      ];
      onBoardingAddLanguagesPageState.selectedSpecializationsChips();
      await tester.pumpAndSettle(Duration(seconds: 3));
      onBoardingAddLanguagesPageState.onNewSpecializationsSelected(
        SpecializationsData(
          specializationId: '64b2329f-1fe7-4749-8259-4d2b38abb6ab',
          name: 'Legal',
          code: 'Legal',
          description: 'The legal transtion',
        ),
      );
      await tester.tap(find.byKey(Key(Constants.specializationViewKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
    });

    testWidgets('Click on the proficiency', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddLanguagesPage()));
      await tester.pumpAndSettle(Duration(seconds: 3));

      await tester.tap(find.byKey(Key(Constants.proficiencyViewKey)));
      await tester.pumpAndSettle(Duration(seconds: 4));
    });

    testWidgets('Click event for the main apply button', (WidgetTester tester) async {
      OnBoardingAddLanguagesPage onBoardingAddLanguagesPage = OnBoardingAddLanguagesPage();
      await tester.pumpWidget(createWidgetForTesting(child: onBoardingAddLanguagesPage));
      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.applyButtonKey)), warnIfMissed: false);
        await tester.pumpAndSettle(Duration(seconds: 4));
      });
      await tester.pump(Duration(seconds: 5));
    });

    testWidgets('State change values', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddLanguagesPage()));
      final OnBoardingAddLanguagesPageState onBoardingAddLanguagesPageState =
          tester.state(find.byType(OnBoardingAddLanguagesPage));

      onBoardingAddLanguagesPageState
          .disableGlowProperty(OverscrollIndicatorNotification(leading: false));

      onBoardingAddLanguagesPageState
          .pickerApplyClick(onBoardingAddLanguagesPageState.specializationsState);

      onBoardingAddLanguagesPageState
          .specializationChipDelete('c580b9fb-a5c8-4a28-acba-67aef0a6a1b8');
    });

    testWidgets('Testing for the button click along with the api', (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddLanguagesPage()));
      final OnBoardingAddLanguagesPageState onBoardingAddLanguagesPageState =
          tester.state(find.byType(OnBoardingAddLanguagesPage));

      onBoardingAddLanguagesPageState.languageDataList = [
        LanguagesData.fromJson({
          "languageId": "c5bdb827-c8da-4e1d-afdd-74923d0633d4",
          "name": "Abkhazian",
          "code": "ab",
          "locale": "",
          "directionality": "ltr",
          "localName": "b'ÐÒ§ÑÑÐ°'"
        }),
        LanguagesData.fromJson({
          "languageId": "e1648b06-0813-4d11-ab59-6e9fb2accfe2",
          "name": "Gujarati",
          "code": "gu",
          "locale": "",
          "directionality": "ltr",
          "localName": "b'àªà«àªàª°àª¾àª¤à«'"
        }),
      ];

      onBoardingAddLanguagesPageState.specializationDataList = [
        SpecializationsData.fromJson({
          "specializationId": "64b2329f-1fe7-4749-8259-4d2b38abb6ab",
          "name": "Legal",
          "code": "Legal",
          "description": "The legal transtion"
        }),
        SpecializationsData.fromJson({
          "specializationId": "c580b9fb-a5c8-4a28-acba-67aef0a6a1b8",
          "name": "IndustryAndTechnical",
          "code": "Industry and Technical",
          "description": "The industry and technical translation"
        }),
      ];

      onBoardingAddLanguagesPageState.proficiencyDataList = [
        ProficiencyData.fromJson({
          "proficiencyLevelId": "770c8d5c-36c2-4258-bb7b-b6504150e236",
          "name": "Basic",
          "code": "Basic",
          "description": "The basic proficiency level."
        }),
      ];

      onBoardingAddLanguagesPageState.onNewLanguageSelected('Abkhazian');
      onBoardingAddLanguagesPageState.onNewProficiencySelected('Basic');
      onBoardingAddLanguagesPageState.onNewSpecializationsSelected(SpecializationsData(
        specializationId: "64b2329f-1fe7-4749-8259-4d2b38abb6ab",
        name: "Legal",
        code: "Legal",
        description: "The legal transtion",
      ));

      Utils.setStringToPrefs(Constants.userToken, MockSignInData.USER_TOKEN);
      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.applyButtonKey)), warnIfMissed: false);
        await tester.pumpAndSettle(Duration(seconds: 4));
      });
    });
  });
}

class MockOnBoardingLanguageData {
  static final languagesSuccessResponse = {
    "data": [
      {
        "languageId": "c5bdb827-c8da-4e1d-afdd-74923d0633d4",
        "name": "Abkhazian",
        "code": "ab",
        "locale": "",
        "directionality": "ltr",
        "localName": "b'ÐÒ§ÑÑÐ°'"
      },
      {
        "languageId": "e1648b06-0813-4d11-ab59-6e9fb2accfe2",
        "name": "Gujarati",
        "code": "gu",
        "locale": "",
        "directionality": "ltr",
        "localName": "b'àªà«àªàª°àª¾àª¤à«'"
      },
      {
        "languageId": "c75fa38d-db54-4fd5-a1ce-2c68feaadc67",
        "name": "Hindi",
        "code": "hi",
        "locale": "",
        "directionality": "ltr",
        "localName": "b'à¤¹à¤¿à¤¨à¥à¤¦à¥'"
      },
    ],
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final specializationsSuccessResponse = {
    "data": [
      {
        "specializationId": "64b2329f-1fe7-4749-8259-4d2b38abb6ab",
        "name": "Legal",
        "code": "Legal",
        "description": "The legal transtion"
      },
      {
        "specializationId": "c580b9fb-a5c8-4a28-acba-67aef0a6a1b8",
        "name": "IndustryAndTechnical",
        "code": "Industry and Technical",
        "description": "The industry and technical translation"
      },
      {
        "specializationId": "5b992771-98bd-43ed-96df-90fab19a5db9",
        "name": "SignLanguage",
        "code": "Sign Language",
        "description": "The sign language translation"
      },
      {
        "specializationId": "1efe8b87-bba1-4f47-bba1-9cf98df1db4e",
        "name": "General",
        "code": "General",
        "description": "The general language translation"
      },
      {
        "specializationId": "0316d44c-ac9c-4c9f-9d78-ce916f61d3fe",
        "name": "Medical",
        "code": "Medical",
        "description": "The medical translation"
      },
      {
        "specializationId": "53cb4bf6-fe41-4858-a836-87028fcc9984",
        "name": "Literary",
        "code": "Literary",
        "description": "The literary translation"
      },
      {
        "specializationId": "dd181178-e3e9-4557-a050-992e3f10259a",
        "name": "BusinessAndFinance",
        "code": "Business and Finance",
        "description": "The business and finance translation"
      }
    ],
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final proficiencySuccessResponse = {
    "data": [
      {
        "proficiencyLevelId": "770c8d5c-36c2-4258-bb7b-b6504150e236",
        "name": "Basic",
        "code": "Basic",
        "description": "The basic proficiency level."
      },
      {
        "proficiencyLevelId": "0ba111d7-5d36-4925-857a-7577e5ce27d4",
        "name": "Medium",
        "code": "Medium",
        "description": "The medium proficiency level."
      },
      {
        "proficiencyLevelId": "55ec99cb-1d01-451a-9c25-6d8063be279a",
        "name": "Advanced",
        "code": "Advanced",
        "description": "The advanced proficiency level."
      }
    ],
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final addLanguageSuccessResponse = {
    "data": [
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
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

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
}
