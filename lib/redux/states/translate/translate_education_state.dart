import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateEducationState {
  final bool isLoading;
  final String error;
  final EducationListResponseModel translateEducationList;

  TranslateEducationState({
    @required this.isLoading,
    @required this.error,
    @required this.translateEducationList,
  });

  factory TranslateEducationState.initial() {
    return TranslateEducationState(
      isLoading: false,
      translateEducationList: null,
      error: '',
    );
  }

  TranslateEducationState copyWith({
    bool isLoading,
    EducationListResponseModel translateEducationList,
    String error,
  }) {
    return TranslateEducationState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        translateEducationList: translateEducationList ?? this.translateEducationList);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateEducationState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translateEducationList == other.translateEducationList &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ translateEducationList.hashCode;
}
