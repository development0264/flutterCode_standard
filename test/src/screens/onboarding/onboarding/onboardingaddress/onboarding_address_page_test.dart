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
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/job_services_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_request_model.dart';
import 'package:khontext/src/models/postjobs/joblocality/post_job_location_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingaddress/onboarding_address_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_add_languages_page.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/flavor_config.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
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
      if (request.url.path.contains(ApiEndpoints.getOnboardService)) {
        return http.Response(json.encode(MockOnBoardingAddressData.onBoardServicesResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getOnBoard)) {
        return http.Response(
            json.encode(MockOnBoardingAddressData.onBoardingDataSuccessResponse), 200);
      } else if (request.url.path.contains('/maps/api/place/autocomplete/json')) {
        return http.Response(json.encode(MockOnBoardingAddressData.placeQueryResponse), 200);
      } else if (request.url.path.contains('/maps/api/place/details/json')) {
        return http.Response(json.encode(MockOnBoardingAddressData.locationResponse), 200);
      } else if (request.url.path.contains(ApiEndpoints.getOnboardAddressServices)) {
        OnBoardingAddressRequestModel onBoardingAddressRequestModel =
            onBoardingAddressRequestModelFromJson(request.body.toString());
        if (onBoardingAddressRequestModel.city == '158') {
          return http.Response(
              json.encode(MockOnBoardingAddressData.addOnBoardingAddressResponse), 200);
        } else {
          return http.Response(
              json.encode(MockOnBoardingAddressData.addOnBoardingAddressFailResponse), 200);
        }
      }

      return http.Response(null, 400);
    });
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.onBoardingAddLanguagesScreen: (context) => OnBoardingAddLanguagesPage(),
        },
      ),
    );
  }

  group('Other click events group', () {
    testWidgets("Pumping root widget", (WidgetTester tester) async {
      await tester.pumpWidget(KhontextApp(store: store));
      Utils.setStringToPrefs(Constants.userToken, MockSignInData.USER_TOKEN);
      await tester.runAsync(() async {
        Utils.initiatePreferences();
      });
    });

    testWidgets('Click events for Next up button in on boarding address page without validations',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddressPage()));
      await tester.tap(find.byKey(Key(Constants.nextStepBtnKey)));
      await tester.pump(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
      await tester.pump(Duration(seconds: 4));
    });

    testWidgets('Pumping in the address widget and testing different widgets with in the page',
        (WidgetTester tester) async {
      /// Global key for maintaining the state of the form.
      final _testFormKey = GlobalKey<FormBuilderState>();
      Widget addressWidget = BaseAddressWidget(
        locationFormKey: _testFormKey,
        clientAddressData: MockOnBoardingAddressData.getClientAddressData,
        onAddressChanged: (AddressReturnModel add) {
          print("The address returned ---> ${addressReturnModelToJson(add)}");
        },
      );
      await tester.pumpWidget(
        createWidgetForTesting(
          child: Scaffold(body: addressWidget),
        ),
      );
      await tester.pump();
      await tester.enterText(find.byKey(Key(Constants.streetAddKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.address2Key)), "158");
      await tester.enterText(find.byKey(Key(Constants.cityKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.stateKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.zipKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.countryKey)), "158");

      BaseAddressWidgetState state = tester.state(find.byType(BaseAddressWidget));
      state.singleSuggestionsItem(PostJobLocationPrediction());
      state.onSuggestionsCallback('Surat').then((value) {
        state.onSuggestionsClicked(value[0]);
      });
    });

    testWidgets('Click events for Next up button in on boarding address page in failure response',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddressPage()));
      await tester.enterText(find.byKey(Key(Constants.streetAddKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.address2Key)), "158");
      await tester.enterText(find.byKey(Key(Constants.cityKey)), "100");
      await tester.enterText(find.byKey(Key(Constants.stateKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.zipKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.countryKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.hourlyKey)), "10");
      await tester.enterText(find.byKey(Key(Constants.ratePerKey)), "5");
      await tester.enterText(find.byKey(Key(Constants.gasKey)), "2");
      await tester.pump(Duration(seconds: 4));
      await tester.ensureVisible(find.byKey(Key(Constants.nextStepBtnKey)));
      await tester.pumpAndSettle();
      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.nextStepBtnKey)), warnIfMissed: true);
        await tester.pump(Duration(seconds: 4));
      });
      await tester.pump(Duration(seconds: 4));
    });

    testWidgets('Click events for Next up button in on boarding address page in success response',
        (WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();
      await tester.pumpWidget(createWidgetForTesting(child: OnBoardingAddressPage()));
      await tester.enterText(find.byKey(Key(Constants.streetAddKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.address2Key)), "158");
      await tester.enterText(find.byKey(Key(Constants.cityKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.stateKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.zipKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.countryKey)), "158");
      await tester.enterText(find.byKey(Key(Constants.hourlyKey)), "10");
      await tester.enterText(find.byKey(Key(Constants.ratePerKey)), "5");
      await tester.enterText(find.byKey(Key(Constants.gasKey)), "2");
      await tester.pump(Duration(seconds: 4));
      await tester.ensureVisible(find.byKey(Key(Constants.nextStepBtnKey)));
      await tester.pumpAndSettle();
      await tester.runAsync(() async {
        await tester.tap(find.byKey(Key(Constants.nextStepBtnKey)), warnIfMissed: true);
      });
      await tester.pump(Duration(seconds: 4));
      verifyNever(mockObserver.didPush(any, any));
    });

    test('Testing the get onboarding data function', () {
      OnBoardingAddressPage onBoardingAddressPage = OnBoardingAddressPage();
      AddressReturnModel addressReturnModel = AddressReturnModel(
        subLocality1: '',
        city: '',
        country: '',
        locality: '',
        postalCode: '',
        selectedTimeZone: '',
        state: '',
        streetNumber: '',
        streetRoute: '',
        subLocality2: '',
        subLocality3: '',
      );
      OnBoardingAddressRequestModel onBoardingAddressRequestModel;
      onBoardingAddressRequestModel = onBoardingAddressPage.createState().getOnBoardingData(
            '50a556c3-5a80-42d7-b316-00b92f61efde',
            '8670c92f-6616-445b-9ea0-d1c9d41a467d',
            ['line1', 'line12'],
            ['line56', 'line34'],
            addressReturnModel,
          );

      expect(onBoardingAddressRequestModel.addressId, '50a556c3-5a80-42d7-b316-00b92f61efde');

      onBoardingAddressRequestModel = onBoardingAddressPage.createState().getOnBoardingData(
            null,
            '8670c92f-6616-445b-9ea0-d1c9d41a467d',
            ['line1', 'line12'],
            ['line56', 'line34'],
            addressReturnModel,
          );

      expect(onBoardingAddressRequestModel.addressId, null);

      OnBoardingAddressPageState onBoardingAddressPageState = onBoardingAddressPage.createState();
      onBoardingAddressPageState.onCheckboxChanged(
          JobServicesData(
            onboardQuizServiceId: 'f4a239a4-e683-4f3a-8e4b-df6237282a3d',
            name: 'Virtual translation',
            code: 'Virtual',
            description: 'The virtual translation.',
          ),
          true);

      print("The list hjere ----> ${onBoardingAddressPageState.selectedJobServicesList}");

      expect(
          onBoardingAddressPageState.selectedJobServicesList
              .contains('f4a239a4-e683-4f3a-8e4b-df6237282a3d'),
          true);

      onBoardingAddressPageState.onCheckboxChanged(
          JobServicesData(
            onboardQuizServiceId: 'f4a239a4-e683-4f3a-8e4b-df6237282a3d',
            name: 'Virtual translation',
            code: 'Virtual',
            description: 'The virtual translation.',
          ),
          true);

      expect(
          onBoardingAddressPageState.selectedJobServicesList
              .contains('f4a239a4-e683-4f3a-8e4b-df6237282a3d'),
          false);
    });
  });
}

class MockOnBoardingAddressData {
  static final getClientAddressData = ClientAddressData(
    addressId: 'test',
    streetNumber: '158',
    streetName: 'Test street',
    line1: 'Address line 1',
    line2: 'Address line 2',
    addressType: Constants.clientType,
    city: 'Surat',
    county: 'Gujarat',
    zipCode: '395009',
    timezone: 'test',
    country: 'India',
  );

  static final onBoardServicesResponse = {
    "data": [
      {
        "onboardQuizServiceId": "f4a239a4-e683-4f3a-8e4b-df6237282a3d",
        "name": "Virtual translation",
        "code": "Virtual",
        "description": "The virtual translation."
      },
      {
        "onboardQuizServiceId": "f04e52fe-6dcc-457c-9454-8fe949c1625b",
        "name": "Onsite/In-person translation",
        "code": "OnsiteInPerson",
        "description": "The onsite/In-person translation."
      },
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
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final onBoardingDataSuccessResponse = {
    "data": {
      "addressAndServices": {
        "addressId": "50a556c3-5a80-42d7-b316-00b92f61efde",
        "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
        "line1": "testNewAdd, line 2",
        "line2": "",
        "city": "TestCity",
        "state": "testState",
        "zipCode": "234567",
        "country": "India",
        "services": [
          {
            "onboardQuizServiceId": "f4a239a4-e683-4f3a-8e4b-df6237282a3d",
            "name": "Virtual translation",
            "code": "Virtual",
            "description": "The virtual translation."
          }
        ],
        "ratePerHour": "20",
        "ratePerPage": "25",
        "ratePerMileOrKm": "5",
        "about": ""
      },
      "language": null,
      "education": null,
      "experience": null,
      "identification": null
    },
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final onBoardingDataSuccessResponseWithoutAddress = {
    "data": {
      "addressAndServices": {
        "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
        "line1": "testNewAdd, line 2",
        "line2": "",
        "city": "TestCity",
        "state": "testState",
        "zipCode": "234567",
        "country": "India",
        "services": [
          {
            "onboardQuizServiceId": "f4a239a4-e683-4f3a-8e4b-df6237282a3d",
            "name": "Virtual translation",
            "code": "Virtual",
            "description": "The virtual translation."
          }
        ],
        "ratePerHour": "20",
        "ratePerPage": "25",
        "ratePerMileOrKm": "5",
        "about": ""
      },
      "language": null,
      "education": null,
      "experience": null,
      "identification": null
    },
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final placeQueryResponse = {
    "predictions": [
      {
        "description": "Surat, Gujarat, India",
        "matched_substrings": [
          {"length": 5, "offset": 0}
        ],
        "place_id": "ChIJYxUdQVlO4DsRQrA4CSlYRf4",
        "reference": "ChIJYxUdQVlO4DsRQrA4CSlYRf4",
        "structured_formatting": {
          "main_text": "Surat",
          "main_text_matched_substrings": [
            {"length": 5, "offset": 0}
          ],
          "secondary_text": "Gujarat, India"
        },
        "terms": [
          {"offset": 0, "value": "Surat"},
          {"offset": 7, "value": "Gujarat"},
          {"offset": 16, "value": "India"}
        ],
        "types": ["locality", "political", "geocode"]
      },
    ],
    "status": "OK"
  };

  static final locationResponse = {
    "html_attributions": [],
    "result": {
      "address_components": [
        {
          "long_name": "Surat",
          "short_name": "Surat",
          "types": ["locality", "political"]
        },
        {
          "long_name": "Surat",
          "short_name": "Surat",
          "types": ["administrative_area_level_2", "political"]
        },
        {
          "long_name": "Gujarat",
          "short_name": "GJ",
          "types": ["administrative_area_level_1", "political"]
        },
        {
          "long_name": "India",
          "short_name": "IN",
          "types": ["country", "political"]
        }
      ],
      "adr_address":
          "<span class=\"locality\">Surat</span>, <span class=\"region\">Gujarat</span>, <span class=\"country-name\">India</span>",
      "formatted_address": "Surat, Gujarat, India",
      "geometry": {
        "location": {"lat": 21.1702401, "lng": 72.83106070000001},
        "viewport": {
          "northeast": {"lat": 21.27058340704162, "lng": 72.94321056780348},
          "southwest": {"lat": 21.04781690239682, "lng": 72.70138193777503}
        }
      },
      "icon": "https://maps.gstatic.com/mapfiles/place_api/icons/v1/png_71/geocode-71.png",
      "icon_background_color": "#7B9EB0",
      "icon_mask_base_uri": "https://maps.gstatic.com/mapfiles/place_api/icons/v2/generic_pinlet",
      "name": "Surat",
      "photos": [
        {
          "height": 340,
          "html_attributions": [
            "<a href=\"https://maps.google.com/maps/contrib/116977742118118443997\">Manish Kumar</a>"
          ],
          "photo_reference":
              "Aap_uEC3H81EhQgIeORCMvxW1wHoYb5uOG-G07So4lWa3ouX2aMCLmkexEkm8fDo3tOh6Sz-rux8UVe0KI2aDM2bGKfL0ffxxgJ8ozz9GKhaVcXr2lDUcUmHU3coKPfCtFUm0WalZBLgEJ1mUHpCErNAsG7WN8UYGU6pqFNslL7zT9HRb1sS",
          "width": 652
        },
      ],
      "place_id": "ChIJYxUdQVlO4DsRQrA4CSlYRf4",
      "reference": "ChIJYxUdQVlO4DsRQrA4CSlYRf4",
      "types": ["locality", "political"],
      "url":
          "https://maps.google.com/?q=Surat,+Gujarat,+India&ftid=0x3be04e59411d1563:0xfe4558290938b042",
      "utc_offset": 330,
      "vicinity": "Surat",
      "website": "http://www.suratmunicipal.gov.in/"
    },
    "status": "OK"
  };

  static final addOnBoardingAddressResponse = {
    "data": {
      "addressId": "50a556c3-5a80-42d7-b316-00b92f61efde",
      "userId": "8670c92f-6616-445b-9ea0-d1c9d41a467d",
      "line1": "address testing",
      "line2": "current street",
      "city": "Surat",
      "state": "Gujarat",
      "zipCode": "395009",
      "country": "India",
      "services": [
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
      "about": "Test about"
    },
    "message": "Success",
    "errors": null,
    "isSuccessful": true
  };

  static final addOnBoardingAddressFailResponse = {
    "data": null,
    "message": "Error",
    "errors": ['Error in adding data'],
    "isSuccessful": false
  };
}
