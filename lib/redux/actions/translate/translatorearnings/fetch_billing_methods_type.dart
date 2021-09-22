import 'package:khontext/src/screens/translate/translate_page.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateBillingTypeFetchAction] which takes in the queries and gives out the response as
/// either [TranslateBillingTypeSuccessAction] or [TranslateBillingTypeErrorAction].
class TranslateBillingTypeFetchAction {
  TranslateBillingTypeFetchAction();
}

class TranslateBillingTypeErrorAction {
  final String error;

  TranslateBillingTypeErrorAction({this.error});
}

class TranslateBillingTypeSuccessAction {
  List<String> translateBillingTypeList;

  TranslateBillingTypeSuccessAction({this.translateBillingTypeList});
}
