import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateLanguageState {
  final bool isLoading;
  final String error;
  final TranslatorLanguageListResponse translatorLanguageListResponse;

  TranslateLanguageState({
    @required this.isLoading,
    @required this.error,
    @required this.translatorLanguageListResponse,
  });

  factory TranslateLanguageState.initial() {
    return TranslateLanguageState(
      isLoading: false,
      translatorLanguageListResponse: TranslatorLanguageListResponse.initial(),
      error: '',
    );
  }

  TranslateLanguageState copyWith({
    bool isLoading,
    TranslatorLanguageListResponse translatorLanguageListResponse,
    String error,
  }) {
    return TranslateLanguageState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      translatorLanguageListResponse:
          translatorLanguageListResponse ?? this.translatorLanguageListResponse,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateLanguageState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translatorLanguageListResponse == other.translatorLanguageListResponse &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ translatorLanguageListResponse.hashCode;
}
