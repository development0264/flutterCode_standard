import 'package:khontext/src/models/translatorpayments/create_stripe_account_response.dart';
import 'package:meta/meta.dart';

@immutable
class TranslatorPaymentState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final CreateStripeAccountResponseModel createStripeAccountResponseModel;

  TranslatorPaymentState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.createStripeAccountResponseModel,
  });

  factory TranslatorPaymentState.initial() {
    return TranslatorPaymentState(
      isLoading: false,
      createStripeAccountResponseModel: CreateStripeAccountResponseModel.initial(),
      currentAction: null,
      error: '',
    );
  }

  TranslatorPaymentState copyWith({
    bool isLoading,
    CreateStripeAccountResponseModel createStripeAccountResponseModel,
    dynamic currentAction,
    String error,
  }) {
    return TranslatorPaymentState(
      isLoading: isLoading ?? this.isLoading,
      createStripeAccountResponseModel: createStripeAccountResponseModel ?? this.createStripeAccountResponseModel,
      currentAction: currentAction ?? this.currentAction,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslatorPaymentState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          createStripeAccountResponseModel == other.createStripeAccountResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^ createStripeAccountResponseModel.hashCode ^ currentAction.hashCode ^ error.hashCode;
}
