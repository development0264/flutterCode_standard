import 'package:meta/meta.dart';

@immutable
class TranslateScheduleState {
  final bool isLoading;
  final String error;
  final Map<DateTime, List<dynamic>> translateScheduleList;

  TranslateScheduleState({
    @required this.isLoading,
    @required this.error,
    @required this.translateScheduleList,
  });

  factory TranslateScheduleState.initial() {
    return TranslateScheduleState(
      isLoading: false,
      translateScheduleList: Map(),
      error: '',
    );
  }

  TranslateScheduleState copyWith({
    bool isLoading,
    Map<DateTime, List<dynamic>> translateScheduleList,
    String error,
  }) {
    return TranslateScheduleState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        translateScheduleList: translateScheduleList ?? this.translateScheduleList);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateScheduleState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translateScheduleList == other.translateScheduleList &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ translateScheduleList.hashCode;
}
