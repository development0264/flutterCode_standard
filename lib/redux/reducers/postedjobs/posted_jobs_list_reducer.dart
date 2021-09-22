import 'package:khontext/redux/actions/postedjobs/posted_job_list_actions.dart';
import 'package:khontext/redux/states/postedjobs/posted_jobs_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostedJobsListState> postedJobsListReducer = combineReducers([
  /// Post job list
  TypedReducer<PostedJobsListState, PostedJobListFetchAction>(postedJobsListFetch),
  TypedReducer<PostedJobsListState, PostedJobListErrorAction>(postedJobsListFetchError),
  TypedReducer<PostedJobsListState, PostedJobListSuccessAction>(postedJobsListFetchSuccess),
]);

/// Post job list
PostedJobsListState postedJobsListFetch(PostedJobsListState state, PostedJobListFetchAction action) {
  return state.copyWith(isLoading: true, error: null);
}

PostedJobsListState postedJobsListFetchError(PostedJobsListState state, PostedJobListErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

PostedJobsListState postedJobsListFetchSuccess(PostedJobsListState state, PostedJobListSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobReviewResponseModel: action.jobReviewResponseModel,
  );
}
