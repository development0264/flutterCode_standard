import 'package:khontext/src/models/postjobs/joblanguages/job_languages_request_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [LanguagesEssentialsFetchAction] which takes in the queries and gives out the response as
/// either [LanguagesEssentialsFetchSuccessAction] or [LanguagesEssentialsFetchErrorAction].
class LanguagesEssentialsFetchAction {
  final String jobId;
  LanguagesEssentialsFetchAction({this.jobId});
}

class LanguagesEssentialsFetchErrorAction {
  final String error;

  LanguagesEssentialsFetchErrorAction({this.error});
}

class LanguagesEssentialsFetchSuccessAction {
  final LanguagesResponseModel languagesResponseModel;
  final SpecializationsResponseModel specializationsResponseModel;

  LanguagesEssentialsFetchSuccessAction({this.languagesResponseModel, this.specializationsResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [JobLanguagesFetchAction] which takes in the queries and gives out the response as
/// either [JobLanguagesFetchSuccessAction] or [JobLanguagesFetchErrorAction].
class JobLanguagesFetchAction {
  final String jobId;

  JobLanguagesFetchAction({this.jobId});
}

class JobLanguagesFetchErrorAction {
  final String error;

  JobLanguagesFetchErrorAction({this.error});
}

class JobLanguagesFetchSuccessAction {
  final JobLanguagesResponseModel jobLanguagesResponseModel;

  JobLanguagesFetchSuccessAction({this.jobLanguagesResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [AddUpdateJobLanguagesAction] which takes in the queries and gives out the response as
/// either [AddUpdateJobLanguagesSuccessAction] or [AddUpdateJobLanguagesErrorAction].
class AddUpdateJobLanguagesAction {
  final JobLanguagesRequestModel jobLanguagesRequestModel;

  AddUpdateJobLanguagesAction({this.jobLanguagesRequestModel});
}

class AddUpdateJobLanguagesErrorAction {
  final String error;

  AddUpdateJobLanguagesErrorAction({this.error});
}

class AddUpdateJobLanguagesSuccessAction {
  final JobLanguagesResponseModel jobLanguagesResponseModel;

  AddUpdateJobLanguagesSuccessAction({this.jobLanguagesResponseModel});
}
