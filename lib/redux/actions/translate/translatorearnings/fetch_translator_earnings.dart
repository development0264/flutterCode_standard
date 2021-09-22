import 'package:khontext/src/models/translator_earnings_model.dart';
import 'package:khontext/src/screens/translate/translate_page.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateEarningsFetchAction] which takes in the queries and gives out the response as
/// either [TranslateEarningsSuccessAction] or [TranslateEarningsErrorAction].
class TranslateEarningsFetchAction {
  TranslateEarningsFetchAction();
}

class TranslateEarningsErrorAction {
  final String error;

  TranslateEarningsErrorAction({this.error});
}

class TranslateEarningsSuccessAction {
  List<TranslatorEarningsModel> translateEarningsList;

  TranslateEarningsSuccessAction({this.translateEarningsList});
}
