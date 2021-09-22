import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingaddress/onboarding_address_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingeducation/onboarding_education_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingexperience/onboarding_experience_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardinglanguages/onboarding_languages_actions.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<OnBoardingState> onBoardingReducer = combineReducers([
  // Get services
  TypedReducer<OnBoardingState, GetJobServicesActions>(jobServices),
  TypedReducer<OnBoardingState, GetJobServicesErrorAction>(jobServicesError),
  TypedReducer<OnBoardingState, GetJobServicesSuccessAction>(jobServicesSuccess),

  // Add OnBoarding address
  TypedReducer<OnBoardingState, AddOnBoardingAddressActions>(onBoardingAddressAdd),
  TypedReducer<OnBoardingState, AddOnBoardingAddressErrorAction>(onBoardingAddressAddError),
  TypedReducer<OnBoardingState, AddOnBoardingAddressSuccessAction>(onBoardingAddressAddSuccess),

  // On boarding data
  TypedReducer<OnBoardingState, OnBoardingDataActions>(onBoardingData),
  TypedReducer<OnBoardingState, OnBoardingDataErrorAction>(onBoardingDataError),
  TypedReducer<OnBoardingState, OnBoardingDataSuccessAction>(onBoardingDataSuccess),

  // On boarding state clear
  TypedReducer<OnBoardingState, OnBoardingClearActions>(onBoardingStateClear),
  TypedReducer<OnBoardingState, OnBoardingClearErrorAction>(onBoardingStateClearError),
  TypedReducer<OnBoardingState, OnBoardingClearSuccessAction>(onBoardingStateClearSuccess),

  // On boarding language essentials
  TypedReducer<OnBoardingState, OnBoardingLangEssentialsActions>(onBoardingLanguagesEssentials),
  TypedReducer<OnBoardingState, OnBoardingLangEssentialsErrorAction>(
      onBoardingLanguagesEssentialsError),
  TypedReducer<OnBoardingState, OnBoardingLangEssentialsSuccessAction>(
      onBoardingLanguagesEssentialsSuccess),

  // On boarding add language
  TypedReducer<OnBoardingState, OnBoardingAddLangActions>(onBoardingAddLanguage),
  TypedReducer<OnBoardingState, OnBoardingAddLangErrorAction>(onBoardingAddLanguageError),
  TypedReducer<OnBoardingState, OnBoardingAddLangSuccessAction>(onBoardingAddLanguageSuccess),

  // On boarding delete language
  TypedReducer<OnBoardingState, OnBoardingDeleteLangActions>(onBoardingDeleteLanguage),
  TypedReducer<OnBoardingState, OnBoardingDeleteLangErrorAction>(onBoardingDeleteLanguageError),
  TypedReducer<OnBoardingState, OnBoardingDeleteLangSuccessAction>(onBoardingDeleteLanguageSuccess),

  // On boarding add Education
  TypedReducer<OnBoardingState, OnBoardingAddEduActions>(onBoardingAddEducation),
  TypedReducer<OnBoardingState, OnBoardingAddEduErrorAction>(onBoardingAddEducationError),
  TypedReducer<OnBoardingState, OnBoardingAddEduSuccessAction>(onBoardingAddEducationSuccess),

  // On boarding delete education
  TypedReducer<OnBoardingState, OnBoardingDeleteEduActions>(onBoardingDeleteEducation),
  TypedReducer<OnBoardingState, OnBoardingDeleteEduErrorAction>(onBoardingDeleteEducationError),
  TypedReducer<OnBoardingState, OnBoardingDeleteEduSuccessAction>(onBoardingDeleteEducationSuccess),

  // Employment types
  TypedReducer<OnBoardingState, OnBoardingEmploymentTypesFetchAction>(employmentTypeFetch),
  TypedReducer<OnBoardingState, OnBoardingEmploymentTypesErrorAction>(employmentTypeError),
  TypedReducer<OnBoardingState, OnBoardingEmploymentTypesSuccessAction>(employmentTypeSuccess),

  // On boarding add experience
  TypedReducer<OnBoardingState, OnBoardingAddExpActions>(onBoardingAddExperience),
  TypedReducer<OnBoardingState, OnBoardingAddExpErrorAction>(onBoardingAddExperienceError),
  TypedReducer<OnBoardingState, OnBoardingAddExpSuccessAction>(onBoardingAddExperienceSuccess),

  // On boarding delete experience
  TypedReducer<OnBoardingState, OnBoardingDeleteExpActions>(onBoardingDeleteExperience),
  TypedReducer<OnBoardingState, OnBoardingDeleteExpErrorAction>(onBoardingDeleteExperienceError),
  TypedReducer<OnBoardingState, OnBoardingDeleteExpSuccessAction>(
      onBoardingDeleteExperienceSuccess),
]);

/// Get job services
OnBoardingState jobServices(OnBoardingState state, GetJobServicesActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: GetJobServicesActions,
  );
}

OnBoardingState jobServicesError(OnBoardingState state, GetJobServicesErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: GetJobServicesErrorAction,
  );
}

OnBoardingState jobServicesSuccess(OnBoardingState state, GetJobServicesSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    jobServicesResponseModel: action.jobServicesResponseModel,
    currentAction: GetJobServicesSuccessAction,
  );
}

/// Add On boarding address
OnBoardingState onBoardingAddressAdd(OnBoardingState state, AddOnBoardingAddressActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: AddOnBoardingAddressActions,
  );
}

OnBoardingState onBoardingAddressAddError(
    OnBoardingState state, AddOnBoardingAddressErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: AddOnBoardingAddressErrorAction,
  );
}

OnBoardingState onBoardingAddressAddSuccess(
    OnBoardingState state, AddOnBoardingAddressSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: AddOnBoardingAddressSuccessAction,
  );
}

/// On boarding data
OnBoardingState onBoardingData(OnBoardingState state, OnBoardingDataActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingDataActions,
  );
}

OnBoardingState onBoardingDataError(OnBoardingState state, OnBoardingDataErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingDataErrorAction,
  );
}

OnBoardingState onBoardingDataSuccess(OnBoardingState state, OnBoardingDataSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    onBoardingDataResponseModel: action.onBoardingDataResponseModel,
    currentAction: OnBoardingDataSuccessAction,
  );
}

/// On boarding clear state
OnBoardingState onBoardingStateClear(OnBoardingState state, OnBoardingClearActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingClearActions,
  );
}

OnBoardingState onBoardingStateClearError(
    OnBoardingState state, OnBoardingClearErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingClearErrorAction,
  );
}

OnBoardingState onBoardingStateClearSuccess(
    OnBoardingState state, OnBoardingClearSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingClearSuccessAction,
  );
}

/// On boarding address languages
OnBoardingState onBoardingLanguagesEssentials(
    OnBoardingState state, OnBoardingLangEssentialsActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingLangEssentialsActions,
  );
}

OnBoardingState onBoardingLanguagesEssentialsError(
    OnBoardingState state, OnBoardingLangEssentialsErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingLangEssentialsErrorAction,
  );
}

OnBoardingState onBoardingLanguagesEssentialsSuccess(
    OnBoardingState state, OnBoardingLangEssentialsSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    languageEssentialsModel: action.languageEssentialsModel,
    currentAction: OnBoardingLangEssentialsSuccessAction,
  );
}

/// On boarding add language
OnBoardingState onBoardingAddLanguage(OnBoardingState state, OnBoardingAddLangActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingAddLangActions,
  );
}

OnBoardingState onBoardingAddLanguageError(
    OnBoardingState state, OnBoardingAddLangErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingAddLangErrorAction,
  );
}

OnBoardingState onBoardingAddLanguageSuccess(
    OnBoardingState state, OnBoardingAddLangSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingAddLangSuccessAction,
  );
}

/// On boarding delete language
OnBoardingState onBoardingDeleteLanguage(
    OnBoardingState state, OnBoardingDeleteLangActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingDeleteLangActions,
  );
}

OnBoardingState onBoardingDeleteLanguageError(
    OnBoardingState state, OnBoardingDeleteLangErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingDeleteLangErrorAction,
  );
}

OnBoardingState onBoardingDeleteLanguageSuccess(
    OnBoardingState state, OnBoardingDeleteLangSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingDeleteLangSuccessAction,
  );
}

/// On boarding add education
OnBoardingState onBoardingAddEducation(OnBoardingState state, OnBoardingAddEduActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingAddEduActions,
  );
}

OnBoardingState onBoardingAddEducationError(
    OnBoardingState state, OnBoardingAddEduErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingAddEduErrorAction,
  );
}

OnBoardingState onBoardingAddEducationSuccess(
    OnBoardingState state, OnBoardingAddEduSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingAddEduSuccessAction,
  );
}

/// On boarding delete education
OnBoardingState onBoardingDeleteEducation(
    OnBoardingState state, OnBoardingDeleteEduActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingDeleteEduActions,
  );
}

OnBoardingState onBoardingDeleteEducationError(
    OnBoardingState state, OnBoardingDeleteEduErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingDeleteEduErrorAction,
  );
}

OnBoardingState onBoardingDeleteEducationSuccess(
    OnBoardingState state, OnBoardingDeleteEduSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingDeleteEduSuccessAction,
  );
}

/// Fetch employment types
OnBoardingState employmentTypeFetch(
    OnBoardingState state, OnBoardingEmploymentTypesFetchAction action) {
  return state.copyWith(
    error: null,
    isLoading: true,
    currentAction: OnBoardingEmploymentTypesFetchAction,
  );
}

OnBoardingState employmentTypeError(
    OnBoardingState state, OnBoardingEmploymentTypesErrorAction action) {
  return state.copyWith(
    error: action.error,
    isLoading: false,
    currentAction: OnBoardingEmploymentTypesErrorAction,
  );
}

OnBoardingState employmentTypeSuccess(
    OnBoardingState state, OnBoardingEmploymentTypesSuccessAction action) {
  return state.copyWith(
    error: null,
    isLoading: false,
    employmentTypeResponseModel: action.employmentTypeResponseModel,
    currentAction: OnBoardingEmploymentTypesSuccessAction,
  );
}

/// On boarding add experience
OnBoardingState onBoardingAddExperience(OnBoardingState state, OnBoardingAddExpActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingAddExpActions,
  );
}

OnBoardingState onBoardingAddExperienceError(
    OnBoardingState state, OnBoardingAddExpErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingAddExpErrorAction,
  );
}

OnBoardingState onBoardingAddExperienceSuccess(
    OnBoardingState state, OnBoardingAddExpSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingAddExpSuccessAction,
  );
}

/// On boarding delete experience
OnBoardingState onBoardingDeleteExperience(
    OnBoardingState state, OnBoardingDeleteExpActions action) {
  return state.copyWith(
    isLoading: true,
    error: '',
    currentAction: OnBoardingDeleteExpActions,
  );
}

OnBoardingState onBoardingDeleteExperienceError(
    OnBoardingState state, OnBoardingDeleteExpErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: OnBoardingDeleteExpErrorAction,
  );
}

OnBoardingState onBoardingDeleteExperienceSuccess(
    OnBoardingState state, OnBoardingDeleteExpSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: '',
    currentAction: OnBoardingDeleteExpSuccessAction,
  );
}
