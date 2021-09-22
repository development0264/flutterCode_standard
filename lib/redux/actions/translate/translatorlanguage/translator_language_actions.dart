import 'package:khontext/src/models/translator/translatorlanguage/add_update_language_request.dart';
import 'package:khontext/src/models/translator/translatorlanguage/add_update_language_response.dart';
import 'package:khontext/src/models/translator/translatorlanguage/delete_language_response_model.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateLanguageFetchAction] which takes in the queries and gives out the response as
/// either [TranslateLanguageSuccessAction] or [TranslateLanguageErrorAction].
class TranslateLanguageFetchAction {
  TranslateLanguageFetchAction();
}

class TranslateLanguageErrorAction {
  final String error;

  TranslateLanguageErrorAction({this.error});
}

class TranslateLanguageSuccessAction {
  TranslatorLanguageListResponse translatorLanguageListResponse;

  TranslateLanguageSuccessAction({this.translatorLanguageListResponse});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddUpdateTranslateLanguageAction] which takes in the queries and gives out the response as
/// either [AddUpdateTranslateLanguageSuccessAction] or [AddUpdateTranslateLanguageErrorAction].
class AddUpdateTranslateLanguageAction {
  AddUpdateLanguageRequest addUpdateLanguageRequest;

  AddUpdateTranslateLanguageAction({this.addUpdateLanguageRequest});
}

class AddUpdateTranslateLanguageErrorAction {
  final String error;

  AddUpdateTranslateLanguageErrorAction({this.error});
}

class AddUpdateTranslateLanguageSuccessAction {
  AddUpdateLanguageResponse addUpdateLanguageResponse;

  AddUpdateTranslateLanguageSuccessAction({this.addUpdateLanguageResponse});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [DeleteTranslateLanguageAction] which takes in the queries and gives out the response as
/// either [DeleteTranslateLanguageSuccessAction] or [DeleteTranslateLanguageErrorAction].
class DeleteTranslateLanguageAction {
  String languageId;

  DeleteTranslateLanguageAction({this.languageId});
}

class DeleteTranslateLanguageErrorAction {
  final String error;

  DeleteTranslateLanguageErrorAction({this.error});
}

class DeleteTranslateLanguageSuccessAction {
  DeleteLanguageResponseModel deleteLanguageResponseModel;

  DeleteTranslateLanguageSuccessAction({this.deleteLanguageResponseModel});
}
