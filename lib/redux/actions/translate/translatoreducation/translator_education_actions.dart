import 'package:khontext/src/models/translator/translatoreducation/add_update_edu_request_model.dart';
import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateEducationFetchAction] which takes in the queries and gives out the response as
/// either [TranslateEducationSuccessAction] or [TranslateEducationErrorAction].
class TranslateEducationFetchAction {
  TranslateEducationFetchAction();
}

class TranslateEducationErrorAction {
  final String error;

  TranslateEducationErrorAction({this.error});
}

class TranslateEducationSuccessAction {
  EducationListResponseModel translateEducationModel;

  TranslateEducationSuccessAction({this.translateEducationModel});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddUpdateEducationAction] which takes in the queries and gives out the response as
/// either [AddEducationSuccessAction] or [AddEducationErrorAction].
class AddUpdateEducationAction {
  final AddUpdateEducationRequestModel model;

  AddUpdateEducationAction({this.model});
}

class AddEducationErrorAction {
  final String error;

  AddEducationErrorAction({this.error});
}

class AddEducationSuccessAction {
  AddEducationSuccessAction();
}
