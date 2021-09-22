import 'package:khontext/src/models/translator/translatortax/user_add_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateTaxState {
  final bool isLoading;
  final String error;
  final UserAddResponseModel translatorTaxModel;

  TranslateTaxState({
    @required this.isLoading,
    @required this.error,
    @required this.translatorTaxModel,
  });

  factory TranslateTaxState.initial() {
    return TranslateTaxState(
      isLoading: false,
      translatorTaxModel: UserAddResponseModel.initial(),
      error: '',
    );
  }

  TranslateTaxState copyWith({
    bool isLoading,
    UserAddResponseModel translatorTaxModel,
    String error,
  }) {
    return TranslateTaxState(
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error,
        translatorTaxModel: translatorTaxModel ?? this.translatorTaxModel);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateTaxState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translatorTaxModel == other.translatorTaxModel &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ translatorTaxModel.hashCode;
}
