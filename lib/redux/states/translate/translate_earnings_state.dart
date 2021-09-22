import 'package:khontext/src/models/translator_billing_model.dart';
import 'package:khontext/src/models/translator_earnings_history_model.dart';
import 'package:khontext/src/models/translator_earnings_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateEarningsState {
  final bool isLoading;
  final String error;
  final List<TranslatorEarningsModel> translateEarningsList;
  final List<String> billingMethodList;
  final List<TranslatorEarningsHistoryModel> translateEarningsHistoryList;

  TranslateEarningsState({
    @required this.isLoading,
    @required this.error,
    @required this.translateEarningsList,
    @required this.billingMethodList,
    @required this.translateEarningsHistoryList,
  });

  factory TranslateEarningsState.initial() {
    return TranslateEarningsState(
      isLoading: false,
      translateEarningsList: [],
      translateEarningsHistoryList: [],
      billingMethodList: [],
      error: '',
    );
  }

  TranslateEarningsState copyWith({
    bool isLoading,
    List<TranslatorEarningsModel> translateEarningsList,
    List<TranslatorEarningsHistoryModel> translateEarningsHistoryList,
    List<TranslatorBillingModel> translateBillingList,
    List<String> billingMethodList,
    String error,
  }) {
    return TranslateEarningsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      translateEarningsList: translateEarningsList ?? this.translateEarningsList,
      billingMethodList: billingMethodList ?? this.billingMethodList,
      translateEarningsHistoryList: translateEarningsHistoryList ?? this.translateEarningsHistoryList,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateEarningsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translateEarningsList == other.translateEarningsList &&
          translateEarningsHistoryList == other.translateEarningsHistoryList &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      error.hashCode ^
      translateEarningsList.hashCode ^
      translateEarningsHistoryList.hashCode;
}
