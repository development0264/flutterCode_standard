import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/khontext_app.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/store/store.dart';
import 'package:khontext/src/screens/onboarding/preonboarding/get_started_screen.dart';
import 'package:khontext/src/screens/onboarding/preonboarding/welcome_screen.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/flavor_config.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:mockito/mockito.dart';
import 'package:redux/redux.dart';

import '../../signin/signin/sign_in_test.dart';

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
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        home: child,
        routes: {
          RoutesConstants.getStartedScreen: (context) => GetStartedPage(),
        },
      ),
    );
  }

  testWidgets("Pumping Welcome screen page and button clicks", (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();
    await tester.pumpWidget(KhontextApp(store: store));
    await tester.pumpWidget(createWidgetForTesting(child: WelcomeScreenPage()));
    await tester.tap(find.byKey(Key(Constants.continueButtonWelcome)));
    await tester.pump(Duration(seconds: 4));
    verifyNever(mockObserver.didPush(any, any));
  });
}
