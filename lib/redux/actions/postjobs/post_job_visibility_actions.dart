import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_request_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_states_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [JobVisibilityEssentialsAction] which takes in the queries and gives out the response as
/// either [JobVisibilityEssentialsSuccessAction] or [JobVisibilityEssentialsErrorAction].
class JobVisibilityEssentialsAction {
  final String jobId;

  JobVisibilityEssentialsAction({this.jobId});
}

class JobVisibilityEssentialsErrorAction {
  final String error;

  JobVisibilityEssentialsErrorAction({this.error});
}

class JobVisibilityEssentialsSuccessAction {
  final JobStatesResponseModel jobStatesResponseModel;
  final SpecializationsResponseModel specializationsResponseModel;
  final ProficiencyResponseModel jobProficiencyResponseModel;

  JobVisibilityEssentialsSuccessAction({
    this.jobStatesResponseModel,
    this.specializationsResponseModel,
    this.jobProficiencyResponseModel,
  });
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [JobVisibilityFetchAction] which takes in the queries and gives out the response as
/// either [JobVisibilityFetchSuccessAction] or [JobVisibilityFetchErrorAction].
class JobVisibilityFetchAction {
  final String jobId;

  JobVisibilityFetchAction({this.jobId});
}

class JobVisibilityFetchErrorAction {
  final String error;

  JobVisibilityFetchErrorAction({this.error});
}

class JobVisibilityFetchSuccessAction {
  final JobVisibilityResponseModel jobVisibilityResponseModel;

  JobVisibilityFetchSuccessAction({this.jobVisibilityResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [AddJobVisibilityAction] which takes in the queries and gives out the response as
/// either [AddJobVisibilitySuccessAction] or [AddJobVisibilityErrorAction].
class AddJobVisibilityAction {
  final JobVisibilityRequestModel jobVisibilityRequestModel;

  AddJobVisibilityAction({this.jobVisibilityRequestModel});
}

class AddJobVisibilityErrorAction {
  final String error;

  AddJobVisibilityErrorAction({this.error});
}

class AddJobVisibilitySuccessAction {
  final JobVisibilityResponseModel jobVisibilityResponseModel;

  AddJobVisibilitySuccessAction({this.jobVisibilityResponseModel});
}
