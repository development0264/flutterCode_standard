import 'package:khontext/src/models/translator_profile_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateState {
  final bool rootPageLoading;
  final int currentPage;
  final TranslatorProfileModel translatorProfileModel;
  final List<String> translateDrawerList;
  final String error;

  TranslateState({
    @required this.rootPageLoading,
    @required this.currentPage,
    @required this.translatorProfileModel,
    @required this.translateDrawerList,
    @required this.error,
  });

  factory TranslateState.initial() {
    return TranslateState(
      rootPageLoading: false,
      currentPage: 0,
      translatorProfileModel: TranslatorProfileModel.initial(),
      translateDrawerList: [],
      error: '',
    );
  }

  TranslateState copyWith({
    bool isLoading,
    int currentPage,
    TranslatorProfileModel translatorProfileModel,
    List<String> translateDrawerList,
    String error,
  }) {
    return TranslateState(
      rootPageLoading: isLoading ?? this.rootPageLoading,
      currentPage: currentPage ?? this.currentPage,
      translatorProfileModel: translatorProfileModel ?? this.translatorProfileModel,
      translateDrawerList: translateDrawerList ?? this.translateDrawerList,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateState &&
          runtimeType == other.runtimeType &&
          rootPageLoading == other.rootPageLoading &&
          currentPage == other.currentPage &&
          translatorProfileModel == other.translatorProfileModel &&
          translateDrawerList == other.translateDrawerList &&
          error == other.error;

  @override
  int get hashCode =>
      rootPageLoading.hashCode ^
      error.hashCode ^
      currentPage.hashCode ^
      translatorProfileModel.hashCode ^
      translateDrawerList.hashCode;
}
