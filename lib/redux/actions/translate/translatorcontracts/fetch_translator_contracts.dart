import 'package:khontext/src/models/translator_contracts_model.dart';
import 'package:khontext/src/screens/translate/translate_page.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateContractsFetchAction] which takes in the queries and gives out the response as
/// either [TranslateContractsSuccessAction] or [TranslateContractsErrorAction].
class TranslateContractsFetchAction {
  TranslateContractsFetchAction();
}

class TranslateContractsErrorAction {
  final String error;

  TranslateContractsErrorAction({this.error});
}

class TranslateContractsSuccessAction {
  List<TranslatorContractsModel> translateContractsList;

  TranslateContractsSuccessAction({this.translateContractsList});
}
