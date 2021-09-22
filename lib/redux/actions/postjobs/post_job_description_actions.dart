import 'package:khontext/src/models/postjobs/jobdescription/job_description_request_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [JobServicesFetchAction] which takes in the queries and gives out the response as
/// either [JobServicesFetchSuccessAction] or [JobServicesFetchErrorAction].
class JobServicesFetchAction {
  final String jobId;

  JobServicesFetchAction({this.jobId});
}

class JobServicesFetchErrorAction {
  final String error;

  JobServicesFetchErrorAction({this.error});
}

class JobServicesFetchSuccessAction {
  final PostJobServicesResponseModel jobServicesResponseModel;

  JobServicesFetchSuccessAction({this.jobServicesResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [JobDescriptionFetchAction] which takes in the queries and gives out the response as
/// either [JobDescriptionFetchSuccessAction] or [JobDescriptionFetchErrorAction].
class JobDescriptionFetchAction {
  final String jobId;

  JobDescriptionFetchAction({this.jobId});
}

class JobDescriptionFetchErrorAction {
  final String error;

  JobDescriptionFetchErrorAction({this.error});
}

class JobDescriptionFetchSuccessAction {
  final JobDescriptionResponseModel jobDescriptionResponseModel;

  JobDescriptionFetchSuccessAction({this.jobDescriptionResponseModel});
}

/// Group of functions which gives the actions for the [PostJob].
/// This group contains [JobDescriptionAddUpdateAction] which takes in the queries and gives out the response as
/// either [JobDescriptionAddUpdateSuccessAction] or [JobDescriptionAddUpdateErrorAction].
class JobDescriptionAddUpdateAction {
  final List<FileOrDocumentInformationRequest> imagesList;
  final JobDescriptionRequestModel jobDescriptionRequestModel;

  JobDescriptionAddUpdateAction({this.jobDescriptionRequestModel, this.imagesList});
}

class JobDescriptionAddUpdateErrorAction {
  final String error;

  JobDescriptionAddUpdateErrorAction({this.error});
}

class JobDescriptionAddUpdateSuccessAction {
  final JobDescriptionResponseModel jobDescriptionResponseModel;

  JobDescriptionAddUpdateSuccessAction({this.jobDescriptionResponseModel});
}
