import 'package:khontext/redux/actions/postjobs/post_job_locality_actions.dart';
import 'package:khontext/redux/states/postjobs/post_job_locality_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<PostJobLocalityState> postJobLocalityReducer = combineReducers([
  /// Post job Address
  TypedReducer<PostJobLocalityState, PostJobLocalityFetchAction>(postJobAddressFetch),
  TypedReducer<PostJobLocalityState, PostJobLocalityFetchErrorAction>(postJobAddressFetchError),
  TypedReducer<PostJobLocalityState, PostJobLocalityFetchSuccessAction>(postJobAddressFetchSuccess),

  /// Add Post job Address
  TypedReducer<PostJobLocalityState, PostJobLocalityAddAction>(postJobAddressAdd),
  TypedReducer<PostJobLocalityState, PostJobLocalityAddErrorAction>(postJobAddressAddError),
  TypedReducer<PostJobLocalityState, PostJobLocalityAddSuccessAction>(postJobAddressAddSuccess),

  /// Update Post job Address
  TypedReducer<PostJobLocalityState, PostJobLocalityUpdateAction>(postJobAddressUpdate),
  TypedReducer<PostJobLocalityState, PostJobLocalityUpdateErrorAction>(postJobAddressUpdateError),
  TypedReducer<PostJobLocalityState, PostJobLocalityUpdateSuccessAction>(postJobAddressUpdateSuccess),
]);

/// Post job Address
PostJobLocalityState postJobAddressFetch(PostJobLocalityState state, PostJobLocalityFetchAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: PostJobLocalityFetchAction);
}

PostJobLocalityState postJobAddressFetchError(PostJobLocalityState state, PostJobLocalityFetchErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: PostJobLocalityFetchErrorAction);
}

PostJobLocalityState postJobAddressFetchSuccess(PostJobLocalityState state, PostJobLocalityFetchSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    clientAddressResponseModel: action.userAddressResponseModel,
    currentAction: PostJobLocalityFetchSuccessAction,
  );
}

/// Add Post job Address
PostJobLocalityState postJobAddressAdd(PostJobLocalityState state, PostJobLocalityAddAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: PostJobLocalityAddAction);
}

PostJobLocalityState postJobAddressAddError(PostJobLocalityState state, PostJobLocalityAddErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: PostJobLocalityAddErrorAction);
}

PostJobLocalityState postJobAddressAddSuccess(PostJobLocalityState state, PostJobLocalityAddSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    clientAddressResponseModel: action.userAddressResponseModel,
    currentAction: PostJobLocalityAddSuccessAction,
  );
}

/// Update Post job Address
PostJobLocalityState postJobAddressUpdate(PostJobLocalityState state, PostJobLocalityUpdateAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: PostJobLocalityUpdateAction);
}

PostJobLocalityState postJobAddressUpdateError(PostJobLocalityState state, PostJobLocalityUpdateErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: PostJobLocalityUpdateErrorAction);
}

PostJobLocalityState postJobAddressUpdateSuccess(
    PostJobLocalityState state, PostJobLocalityUpdateSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    clientAddressResponseModel: action.userAddressResponseModel,
    currentAction: PostJobLocalityUpdateSuccessAction,
  );
}
