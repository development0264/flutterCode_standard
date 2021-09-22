import 'package:khontext/redux/actions/translate/translatorschedule/fetch_translator_schedules.dart';
import 'package:khontext/redux/states/translate/translate_schedule_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<TranslateScheduleState> translateScheduleReducer = combineReducers([
  // Schedule events
  TypedReducer<TranslateScheduleState, TranslateScheduleFetchAction>(scheduleFetch),
  TypedReducer<TranslateScheduleState, TranslateScheduleErrorAction>(scheduleError),
  TypedReducer<TranslateScheduleState, TranslateScheduleSuccessAction>(scheduleSuccess),
]);

TranslateScheduleState scheduleFetch(TranslateScheduleState state, TranslateScheduleFetchAction action) {
  return state.copyWith(error: null, translateScheduleList: state.translateScheduleList, isLoading: true);
}

TranslateScheduleState scheduleError(TranslateScheduleState state, TranslateScheduleErrorAction action) {
  return state.copyWith(error: action.error, isLoading: false, translateScheduleList: Map());
}

TranslateScheduleState scheduleSuccess(TranslateScheduleState state, TranslateScheduleSuccessAction action) {
  return state.copyWith(error: null, translateScheduleList: action.translateScheduleList, isLoading: false);
}
