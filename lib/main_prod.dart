import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:demo/api/api_endpoints.dart';
import 'package:demo/demo_app.dart';
import 'package:demo/redux/store/store.dart';
import 'package:demo/utils/enums.dart';
import 'package:demo/utils/flavor_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlavorConfig(flavor: Flavor.PROD, values: FlavorValues(baseUrl: ApiEndpoints.baseUrlProd), color: Colors.green);
  final store = appStore();
  runApp(demoApp(store: store));
}
