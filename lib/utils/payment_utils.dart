import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:demo/redux/app_state.dart';
import 'package:demo/utils/constants.dart';
import 'package:redux/redux.dart';

class PaymentUtils{
  /// const for the [MethodChannel] platform.
  static const paymentBridgePlatform = const MethodChannel(Constants.paymentBridgeName);

  static void initialPaymentChannel(Store<AppState> store, GlobalKey<NavigatorState> _navigator){
    paymentBridgePlatform.setMethodCallHandler((call){
      switch(call.method){

      }
      return null;
    });
  }
}