import 'package:khontext/src/models/translator/translatoridentification/add_translator_identify_request_model.dart';
import 'package:khontext/src/models/translator/translatoridentification/add_translator_identiy_response_model.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateIdentificationFetchAction] which takes in the queries and gives out the response as
/// either [TranslateIdentificationSuccessAction] or [TranslateIdentificationErrorAction].
class TranslateIdentificationFetchAction {
  TranslateIdentificationFetchAction();
}

class TranslateIdentificationErrorAction {
  final String error;

  TranslateIdentificationErrorAction({this.error});
}

class TranslateIdentificationSuccessAction {
  AddIdentificationResponseModel addIdentificationResponseModel;

  TranslateIdentificationSuccessAction({this.addIdentificationResponseModel});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddTranslateIdentificationAction] which takes in the queries and gives out the response as
/// either [AddTranslateIdentificationSuccessAction] or [AddTranslateIdentificationErrorAction].
class AddTranslateIdentificationAction {
  final AddIdentificationRequestModel addIdentificationRequestModel;

  AddTranslateIdentificationAction({this.addIdentificationRequestModel});
}

class AddTranslateIdentificationErrorAction {
  final String error;

  AddTranslateIdentificationErrorAction({this.error});
}

class AddTranslateIdentificationSuccessAction {
  AddIdentificationResponseModel addIdentificationResponseModel;

  AddTranslateIdentificationSuccessAction({this.addIdentificationResponseModel});
}
