import 'package:khontext/src/models/translator_earnings_history_model.dart';
import 'package:khontext/src/screens/translate/translate_page.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateEarningsHistoryFetchAction] which takes in the queries and gives out the response as
/// either [TranslateEarningsHistorySuccessAction] or [TranslateEarningsHistoryErrorAction].
class TranslateEarningsHistoryFetchAction {
  TranslateEarningsHistoryFetchAction();
}

class TranslateEarningsHistoryErrorAction {
  final String error;

  TranslateEarningsHistoryErrorAction({this.error});
}

class TranslateEarningsHistorySuccessAction {
  List<TranslatorEarningsHistoryModel> translateEarningsHistoryList;

  TranslateEarningsHistorySuccessAction({this.translateEarningsHistoryList});
}
