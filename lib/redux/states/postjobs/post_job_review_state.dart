import 'package:khontext/src/models/postjobs/jobreview/job_review_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobReviewState {
  final bool isLoading;
  final String error;
  final JobReviewResponseModel jobReviewResponseModel;

  PostJobReviewState({
    @required this.isLoading,
    @required this.error,
    @required this.jobReviewResponseModel,
  });

  factory PostJobReviewState.initial() {
    return PostJobReviewState(
      isLoading: false,
      error: '',
      jobReviewResponseModel: null,
    );
  }

  PostJobReviewState copyWith({
    bool isLoading,
    String error,
    JobReviewResponseModel jobReviewResponseModel,
  }) {
    return PostJobReviewState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      jobReviewResponseModel: jobReviewResponseModel ?? this.jobReviewResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobReviewState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          jobReviewResponseModel == other.jobReviewResponseModel &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ jobReviewResponseModel.hashCode;
}
