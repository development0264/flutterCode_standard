import 'package:khontext/redux/actions/postjobs/change_page_actions.dart';
import 'package:khontext/redux/actions/postjobs/fetch_drawer_data_actions.dart';
import 'package:khontext/redux/actions/postjobs/move_backward_actions.dart';
import 'package:khontext/redux/actions/postjobs/move_forward_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobsState> postJobsReducer = combineReducers([
  // Drawer events
  TypedReducer<PostJobsState, DrawerDataErrorAction>(drawerDataError),
  TypedReducer<PostJobsState, DrawerDataSuccessAction>(drawerDataSuccess),

  // Page position events
  TypedReducer<PostJobsState, ChangeCurrentPageErrorAction>(changePageError),
  TypedReducer<PostJobsState, ChangeCurrentPageSuccessAction>(changePageSuccess),

  // Move forward/backward events
  TypedReducer<PostJobsState, MoveForwardErrorAction>(moveForwardError),
  TypedReducer<PostJobsState, MoveForwardSuccessAction>(moveForwardSuccess),
  TypedReducer<PostJobsState, MoveBackwardErrorAction>(moveBackwardError),
  TypedReducer<PostJobsState, MoveBackwardSuccessAction>(moveBackwardSuccess),
]);

PostJobsState drawerDataError(PostJobsState state, DrawerDataErrorAction action) {
  return state.copyWith(error: action.error);
}

PostJobsState drawerDataSuccess(PostJobsState state, DrawerDataSuccessAction action) {
  return state.copyWith(error: null, jobsPostList: action.jobsPostList);
}

PostJobsState changePageError(PostJobsState state, ChangeCurrentPageErrorAction action) {
  return state.copyWith(error: action.error);
}

PostJobsState changePageSuccess(PostJobsState state, ChangeCurrentPageSuccessAction action) {
  return state.copyWith(error: null, currentPage: action.newPage);
}

PostJobsState moveForwardError(PostJobsState state, MoveForwardErrorAction action) {
  return state.copyWith(error: action.error);
}

PostJobsState moveForwardSuccess(PostJobsState state, MoveForwardSuccessAction action) {
  return state.copyWith(
    error: null,
    currentPage: state.currentPage + 1,
    jobsPostList: action.jobsPostList,
    isLoading: false,
  );
}

PostJobsState moveBackwardError(PostJobsState state, MoveBackwardErrorAction action) {
  return state.copyWith(error: action.error);
}

PostJobsState moveBackwardSuccess(PostJobsState state, MoveBackwardSuccessAction action) {
  return state.copyWith(
    error: null,
    currentPage: state.currentPage - 1,
    isLoading: false,
    postedModel: action.model,
  );
}
