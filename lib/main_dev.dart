import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo/api/api_endpoints.dart';
import 'package:demo/demo_app.dart';
import 'package:demo/redux/store/store.dart';
import 'package:demo/utils/enums.dart';
import 'package:demo/utils/flavor_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // await DatadogFlutter.initialize(
  //   clientToken: ApiEndpoints.dataDogClientToken,
  //   serviceName: ApiEndpoints.dataDogServiceName,
  //   environment: 'dev',
  //   iosRumApplicationId: "",
  //   androidRumApplicationId: ApiEndpoints.dataDogAndroidAppId,
  //   trackingConsent: TrackingConsent.granted,
  //   flavorName: 'dev',
  // );
  // Capture Flutter errors automatically:
  // FlutterError.onError = DatadogRum.instance.addFlutterError;
  FlavorConfig(
      flavor: Flavor.DEV,
      values: FlavorValues(baseUrl: ApiEndpoints.baseUrlDev),
      color: Colors.grey);
  final store = appStore();
  // Catch errors without crashing the app:
  // runZonedGuarded(() {
  //   runApp(demoApp(store: store));
  // }, (error, stackTrace) {
  //   DatadogRum.instance.addError(error, stackTrace);
  // });

  runApp(demoApp(store: store));
}
