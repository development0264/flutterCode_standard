import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostedJobsListState {
  final bool isLoading;
  final String error;
  final JobsListResponseModel jobReviewResponseModel;

  PostedJobsListState({
    @required this.isLoading,
    @required this.error,
    @required this.jobReviewResponseModel,
  });

  factory PostedJobsListState.initial() {
    return PostedJobsListState(
      isLoading: false,
      error: '',
      jobReviewResponseModel: null,
    );
  }

  PostedJobsListState copyWith({
    bool isLoading,
    String error,
    JobsListResponseModel jobReviewResponseModel,
  }) {
    return PostedJobsListState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      jobReviewResponseModel: jobReviewResponseModel ?? this.jobReviewResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostedJobsListState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          jobReviewResponseModel == other.jobReviewResponseModel &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ jobReviewResponseModel.hashCode;
}
