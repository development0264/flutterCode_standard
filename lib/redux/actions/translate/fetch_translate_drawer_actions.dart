import 'package:flutter/material.dart';

/// Group of functions which gives the actions for the [PostJobPage].
/// This group contains [TranslateDrawerDataFetchAction] which takes in the queries and gives out the response as
/// either [TranslateDrawerDataSuccessAction] or [TranslateDrawerDataErrorAction].
class TranslateDrawerDataFetchAction {
  final BuildContext context;

  TranslateDrawerDataFetchAction({this.context});
}

class TranslateDrawerDataErrorAction {
  final String error;

  TranslateDrawerDataErrorAction({this.error});
}

class TranslateDrawerDataSuccessAction {
  List<String> translateDrawerList;

  TranslateDrawerDataSuccessAction({this.translateDrawerList});
}
