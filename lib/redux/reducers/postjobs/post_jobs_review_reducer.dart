import 'package:khontext/redux/actions/postjobs/post_job_review_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_review_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobReviewState> postJobReviewReducer = combineReducers([
  /// Post job Review
  TypedReducer<PostJobReviewState, PostJobReviewFetchAction>(postJobReviewFetch),
  TypedReducer<PostJobReviewState, PostJobReviewFetchErrorAction>(postJobReviewFetchError),
  TypedReducer<PostJobReviewState, PostJobReviewFetchSuccessAction>(postJobReviewFetchSuccess),
]);

/// Post job Review
PostJobReviewState postJobReviewFetch(PostJobReviewState state, PostJobReviewFetchAction action) {
  return state.copyWith(isLoading: true, error: null);
}

PostJobReviewState postJobReviewFetchError(PostJobReviewState state, PostJobReviewFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

PostJobReviewState postJobReviewFetchSuccess(PostJobReviewState state, PostJobReviewFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    jobReviewResponseModel: action.jobReviewResponseModel,
  );
}
