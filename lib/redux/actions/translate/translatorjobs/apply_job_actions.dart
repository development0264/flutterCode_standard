import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_job_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/apply_jobs_list_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [ApplyJobsListFetchAction] which takes in the queries and gives out the response as
/// either [ApplyJobsListSuccessAction] or [ApplyJobsListErrorAction].
class ApplyJobsListFetchAction {
  ApplyJobsListFetchAction();
}

class ApplyJobsListErrorAction {
  final String error;

  ApplyJobsListErrorAction({this.error});
}

class ApplyJobsListSuccessAction {
  ApplyJobsListResponse applyJobsListResponse;

  ApplyJobsListSuccessAction({this.applyJobsListResponse});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddUpdateApplyJobsAction] which takes in the queries and gives out the response as
/// either [ApplyJobsListSuccessAction] or [ApplyJobsListErrorAction].
class AddUpdateApplyJobsAction {
  final AddUpdateApplyJobsRequest addUpdateApplyJobsRequest;
  final List<FileOrDocumentInformationRequest> imageList;

  AddUpdateApplyJobsAction({this.addUpdateApplyJobsRequest, this.imageList});
}

class AddUpdateApplyJobsErrorAction {
  final String error;

  AddUpdateApplyJobsErrorAction({this.error});
}

class AddUpdateApplyJobsSuccessAction {
  AddUpdateApplyJobsResponse addUpdateApplyJobsResponse;

  AddUpdateApplyJobsSuccessAction({this.addUpdateApplyJobsResponse});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [DeleteApplyJobsAction] which takes in the queries and gives out the response as
/// either [DeleteApplyJobsSuccessAction] or [DeleteApplyJobsErrorAction].
class DeleteApplyJobsAction {
  final String applyJobId;

  DeleteApplyJobsAction({this.applyJobId});
}

class DeleteApplyJobsErrorAction {
  final String error;

  DeleteApplyJobsErrorAction({this.error});
}

class DeleteApplyJobsSuccessAction {
  CommonResponseModel deleteFavJobResponse;

  DeleteApplyJobsSuccessAction({this.deleteFavJobResponse});
}
