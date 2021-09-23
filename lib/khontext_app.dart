import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:demo/api/base_api_provider.dart';
import 'package:demo/redux/app_state.dart';
import 'package:demo/src/demo_widgets/localization/form_builder_localizations.dart';
import 'package:demo/src/screens/signin/signin/sign_in.dart';
import 'package:demo/utils/constants.dart';
import 'package:demo/utils/routes_constants.dart';
import 'package:demo/utils/utils.dart';
import 'package:redux/redux.dart';

class demoApp extends StatefulWidget {
  final Store<AppState> store;

  const demoApp({Key key, this.store}) : super(key: key);

  @override
  _demoAppState createState() => _demoAppState();
}

class _demoAppState extends State<demoApp> with WidgetsBindingObserver {
  var hasPushedToCall = false;
  AppLifecycleState state;
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Utils.initiatePreferences();
    ApiProvider.client = http.Client();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'demo App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'WorkSans',
        ),
        navigatorKey: _navigator,
        // navigatorObservers: [DatadogObserver()],
        routes: {
          RoutesConstants.signIn: (context) => SignInPage(),
        },
        onGenerateRoute: (settings) => onGenerateRoute(settings),
        localizationsDelegates: [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('es', ''),
        ],
        home: Builder(builder: (rootContext) {
          Utils.setScreenSizes(rootContext);
          return SignInPage();
        }),
      ),
    );
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget child;
    Map<String, dynamic> argsMaps = Map();
    if (settings.arguments != null) {
      argsMaps = (settings.arguments as Map<String, dynamic>);
    }
    switch (settings.name) {
      default:
        child = SignInPage();
        break;
    }

    /// Conditions for the deep linking.
    /// The deep linking will give the route path as well as token in the [settings.name]
    /// So conditions have been placed to split the entire name path in the reset password screen
    /// and then move the path along with the split token value.
    if (settings.name.startsWith(Constants.changePasswordConst)) {
      String token = settings.name.split("/").last;
      print("The token --> $token");
      // child = ResetPasswordPage(userToken: token);
    }

    return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) {
          Utils.setScreenSizes(context);
          return child;
        });
  }

  void registerDeviceForCall() async {
    FirebaseMessaging message = FirebaseMessaging.instance;
    String _fcmToken = await message.getToken();
    Utils.setStringToPrefs(Constants.deviceToken, _fcmToken);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
