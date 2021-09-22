import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobDescriptionState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final JobDescriptionResponseModel postJobDescriptionResponseModel;
  final PostJobServicesResponseModel jobServicesResponseModel;
  final DocumentUploadResponseModel jobImageUploadResponseModel;

  PostJobDescriptionState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.postJobDescriptionResponseModel,
    @required this.jobServicesResponseModel,
    @required this.jobImageUploadResponseModel,
  });

  factory PostJobDescriptionState.initial() {
    return PostJobDescriptionState(
      isLoading: false,
      error: '',
      currentAction: null,
      postJobDescriptionResponseModel: JobDescriptionResponseModel.initial(),
      jobServicesResponseModel: PostJobServicesResponseModel.initial(),
      jobImageUploadResponseModel: DocumentUploadResponseModel.initial(),
    );
  }

  PostJobDescriptionState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
    JobDescriptionResponseModel postJobDescriptionResponseModel,
    PostJobServicesResponseModel jobServicesResponseModel,
    DocumentUploadResponseModel jobImageUploadResponseModel,
  }) {
    return PostJobDescriptionState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      postJobDescriptionResponseModel: postJobDescriptionResponseModel ?? this.postJobDescriptionResponseModel,
      jobServicesResponseModel: jobServicesResponseModel ?? this.jobServicesResponseModel,
      jobImageUploadResponseModel: jobImageUploadResponseModel ?? this.jobImageUploadResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobDescriptionState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          postJobDescriptionResponseModel == other.postJobDescriptionResponseModel &&
          jobServicesResponseModel == other.jobServicesResponseModel &&
          currentAction == other.currentAction &&
          jobImageUploadResponseModel == other.jobImageUploadResponseModel &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      postJobDescriptionResponseModel.hashCode ^
      jobServicesResponseModel.hashCode ^
      jobImageUploadResponseModel.hashCode ^
      currentAction.hashCode;
}
