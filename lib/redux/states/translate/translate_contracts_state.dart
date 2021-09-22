import 'package:khontext/src/models/translator_contracts_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateContractsState {
  final bool isLoading;
  final String error;
  final List<TranslatorContractsModel> translateContractsList;

  TranslateContractsState({
    @required this.isLoading,
    @required this.error,
    @required this.translateContractsList,
  });

  factory TranslateContractsState.initial() {
    return TranslateContractsState(
      isLoading: false,
      translateContractsList: [],
      error: '',
    );
  }

  TranslateContractsState copyWith({
    bool isLoading,
    List<TranslatorContractsModel> translateContractsList,
    String error,
  }) {
    return TranslateContractsState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        translateContractsList: translateContractsList ?? this.translateContractsList);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateContractsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translateContractsList == other.translateContractsList &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ translateContractsList.hashCode;
}
