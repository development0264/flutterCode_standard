import 'package:khontext/redux/actions/translate/translatorexperience/translator_experience_actions.dart';
import 'package:khontext/redux/states/translate/translate_experience_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateExperienceState> translateExperienceReducer = combineReducers([
  // Employment types
  TypedReducer<TranslateExperienceState, EmploymentTypesFetchAction>(employmentTypeFetch),
  TypedReducer<TranslateExperienceState, EmploymentTypesErrorAction>(employmentTypeError),
  TypedReducer<TranslateExperienceState, EmploymentTypesSuccessAction>(employmentTypeSuccess),

  // Experience events
  TypedReducer<TranslateExperienceState, TranslateExperienceFetchAction>(experienceFetch),
  TypedReducer<TranslateExperienceState, TranslateExperienceErrorAction>(experienceError),
  TypedReducer<TranslateExperienceState, TranslateExperienceSuccessAction>(experienceSuccess),

  // Add Experience
  TypedReducer<TranslateExperienceState, AddUpdateExperienceAction>(addExperienceFetch),
  TypedReducer<TranslateExperienceState, AddUpdateExperienceSuccessAction>(addExperienceSuccess),
  TypedReducer<TranslateExperienceState, AddUpdateExperienceErrorAction>(addExperienceError),
]);

/// Fetch employment types
TranslateExperienceState employmentTypeFetch(
    TranslateExperienceState state, EmploymentTypesFetchAction action) {
  return state.copyWith(
    error: null,
    isLoading: true,
    currentAction: EmploymentTypesFetchAction,
  );
}

TranslateExperienceState employmentTypeError(
    TranslateExperienceState state, EmploymentTypesErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    currentAction: EmploymentTypesErrorAction,
  );
}

TranslateExperienceState employmentTypeSuccess(
    TranslateExperienceState state, EmploymentTypesSuccessAction action) {
  return state.copyWith(
    error: null,
    isLoading: false,
    employmentTypeResponseModel: action.employmentTypeResponseModel,
    currentAction: EmploymentTypesSuccessAction,
  );
}

/// Fetch experience list
TranslateExperienceState experienceFetch(
    TranslateExperienceState state, TranslateExperienceFetchAction action) {
  return state.copyWith(
    error: null,
    isLoading: true,
    currentAction: TranslateExperienceFetchAction,
  );
}

TranslateExperienceState experienceError(
    TranslateExperienceState state, TranslateExperienceErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    currentAction: TranslateExperienceErrorAction,
  );
}

TranslateExperienceState experienceSuccess(
    TranslateExperienceState state, TranslateExperienceSuccessAction action) {
  return state.copyWith(
    error: null,
    experienceListResponseModel: action.experienceListResponseModel,
    isLoading: false,
    currentAction: TranslateExperienceSuccessAction,
  );
}

/// Add/update experience
TranslateExperienceState addExperienceFetch(
    TranslateExperienceState state, AddUpdateExperienceAction action) {
  return state.copyWith(
    error: null,
    experienceListResponseModel: state.experienceListResponseModel,
    isLoading: true,
    currentAction: AddUpdateExperienceAction,
  );
}

TranslateExperienceState addExperienceSuccess(
    TranslateExperienceState state, AddUpdateExperienceSuccessAction action) {
  return state.copyWith(
    error: null,
    // experienceListResponseModel: action.translateExperienceList,
    isLoading: false,
    currentAction: AddUpdateExperienceSuccessAction,
  );
}

TranslateExperienceState addExperienceError(
    TranslateExperienceState state, AddUpdateExperienceErrorAction action) {
  return state.copyWith(
    error: action.error,
    // experienceListResponseModel: state.translateExperienceList,
    isLoading: false,
    currentAction: AddUpdateExperienceErrorAction,
  );
}
