import 'package:khontext/src/models/translator/translatorexperience/add_update_exp_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';

/// Group of functions which gives the actions for the [TranslatorPage].
/// This group contains [EmploymentTypesFetchAction] which takes in the queries and gives out the response as
/// either [EmploymentTypesSuccessAction] or [EmploymentTypesErrorAction].
class EmploymentTypesFetchAction {
  EmploymentTypesFetchAction();
}

class EmploymentTypesErrorAction {
  final String error;

  EmploymentTypesErrorAction({this.error});
}

class EmploymentTypesSuccessAction {
  EmploymentTypeResponseModel employmentTypeResponseModel;

  EmploymentTypesSuccessAction({this.employmentTypeResponseModel});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateExperienceFetchAction] which takes in the queries and gives out the response as
/// either [TranslateExperienceSuccessAction] or [TranslateExperienceErrorAction].
class TranslateExperienceFetchAction {
  TranslateExperienceFetchAction();
}

class TranslateExperienceErrorAction {
  final String error;

  TranslateExperienceErrorAction({this.error});
}

class TranslateExperienceSuccessAction {
  ExperienceListResponseModel experienceListResponseModel;

  TranslateExperienceSuccessAction({this.experienceListResponseModel});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddUpdateExperienceAction] which takes in the queries and gives out the response as
/// either [AddUpdateExperienceSuccessAction] or [AddUpdateExperienceErrorAction].
class AddUpdateExperienceAction {
  final AddUpdateExperienceRequestModel model;

  AddUpdateExperienceAction({this.model});
}

class AddUpdateExperienceErrorAction {
  final String error;

  AddUpdateExperienceErrorAction({this.error});
}

class AddUpdateExperienceSuccessAction {
  AddUpdateExperienceSuccessAction();
}
