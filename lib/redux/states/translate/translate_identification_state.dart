import 'package:khontext/src/models/translator/translatoridentification/add_translator_identiy_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateIdentificationState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final AddIdentificationResponseModel addIdentificationResponseModel;

  TranslateIdentificationState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.addIdentificationResponseModel,
  });

  factory TranslateIdentificationState.initial() {
    return TranslateIdentificationState(
      isLoading: false,
      addIdentificationResponseModel: AddIdentificationResponseModel.initial(),
      error: '',
      currentAction: null,
    );
  }

  TranslateIdentificationState copyWith({
    bool isLoading,
    dynamic currentAction,
    AddIdentificationResponseModel addIdentificationResponseModel,
    String error,
  }) {
    return TranslateIdentificationState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      addIdentificationResponseModel:
          addIdentificationResponseModel ?? this.addIdentificationResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateIdentificationState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          addIdentificationResponseModel == other.addIdentificationResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      addIdentificationResponseModel.hashCode ^
      currentAction.hashCode;
}
