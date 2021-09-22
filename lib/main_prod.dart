import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/khontext_app.dart';
import 'package:khontext/redux/store/store.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/flavor_config.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlavorConfig(flavor: Flavor.PROD, values: FlavorValues(baseUrl: ApiEndpoints.baseUrlProd), color: Colors.green);
  final store = appStore();
  runApp(KhontextApp(store: store));
}
