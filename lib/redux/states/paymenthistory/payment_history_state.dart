import 'package:khontext/src/models/payment_history_model.dart';
import 'package:meta/meta.dart';

@immutable
class PaymentHistoryState {
  final bool isLoading;
  final String currentLastId;
  final int limit;
  final PaymentHistoryModel paymentHistoryModel;
  final PaymentHistoryError paymentHistoryError;

  PaymentHistoryState({
    @required this.isLoading,
    @required this.currentLastId,
    @required this.limit,
    @required this.paymentHistoryModel,
    @required this.paymentHistoryError,
  });

  factory PaymentHistoryState.initial() {
    return PaymentHistoryState(
      isLoading: false,
      currentLastId: null,
      limit: 30,
      paymentHistoryModel: PaymentHistoryModel.initial(),
      paymentHistoryError: PaymentHistoryModel.initial().error,
    );
  }

  PaymentHistoryState copyWith({
    bool isLoading,
    String currentLastId,
    int limit,
    PaymentHistoryModel data,
    PaymentHistoryError error,
  }) {
    return PaymentHistoryState(
      isLoading: isLoading ?? this.isLoading,
      currentLastId: currentLastId ?? this.currentLastId,
      limit: limit ?? this.limit,
      paymentHistoryModel: data ?? this.paymentHistoryModel,
      paymentHistoryError: error ?? this.paymentHistoryError,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentHistoryState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          currentLastId == other.currentLastId &&
          limit == other.limit &&
          paymentHistoryModel == other.paymentHistoryModel &&
          paymentHistoryError == other.paymentHistoryError;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      currentLastId.hashCode ^
      limit.hashCode ^
      paymentHistoryModel.hashCode ^
      paymentHistoryError.hashCode;
}
