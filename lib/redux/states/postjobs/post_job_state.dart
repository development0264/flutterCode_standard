import 'package:khontext/src/models/location_by_place_model.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postjobs/joblocality/post_job_location_model.dart';
import 'package:khontext/src/models/postjobs/post_job_status_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobsState {
  final bool isLoading;
  final List<PostJobsStatusModel> jobsPostList;
  final int currentPage;
  final String error;

  PostJobsState({
    @required this.isLoading,
    @required this.jobsPostList,
    @required this.currentPage,
    @required this.error,
  });

  factory PostJobsState.initial() {
    return PostJobsState(
      isLoading: false,
      jobsPostList: [],
      currentPage: 0,
      error: '',
    );
  }

  PostJobsState copyWith({
    bool isLoading,
    List<PostJobsStatusModel> jobsPostList,
    int currentPage,
    PostedJobsModel postedModel,
    String error,
    PostJobLocationModel placesListModel,
    LocationByPlaceModel singlePlace,
  }) {
    return PostJobsState(
      isLoading: isLoading ?? this.isLoading,
      jobsPostList: jobsPostList ?? this.jobsPostList,
      currentPage: currentPage ?? this.currentPage,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          jobsPostList == other.jobsPostList &&
          currentPage == other.currentPage &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      jobsPostList.hashCode ^
      currentPage.hashCode ^
      error.hashCode;
}
