import 'package:khontext/src/models/payments/add_payment_method_response.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/models/payments/user_address_list_model.dart';
import 'package:meta/meta.dart';

@immutable
class PaymentState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final UserAddressListResponseModel userAddressListResponseModel;
  final AddPaymentMethodResponseModel addPaymentMethodResponseModel;
  final PaymentMethodListModel paymentMethodListModel;

  PaymentState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.userAddressListResponseModel,
    @required this.addPaymentMethodResponseModel,
    @required this.paymentMethodListModel,
  });

  factory PaymentState.initial() {
    return PaymentState(
      isLoading: false,
      userAddressListResponseModel: UserAddressListResponseModel.initial(),
      addPaymentMethodResponseModel: AddPaymentMethodResponseModel.initial(),
      paymentMethodListModel: PaymentMethodListModel.initial(),
      currentAction: null,
      error: '',
    );
  }

  PaymentState copyWith({
    bool isLoading,
    UserAddressListResponseModel userAddressListResponseModel,
    AddPaymentMethodResponseModel addPaymentMethodResponseModel,
    PaymentMethodListModel paymentMethodListModel,
    dynamic currentAction,
    String error,
  }) {
    return PaymentState(
      isLoading: isLoading ?? this.isLoading,
      userAddressListResponseModel: userAddressListResponseModel ?? this.userAddressListResponseModel,
      currentAction: currentAction ?? this.currentAction,
      addPaymentMethodResponseModel: addPaymentMethodResponseModel ?? this.addPaymentMethodResponseModel,
      paymentMethodListModel: paymentMethodListModel ?? this.paymentMethodListModel,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PaymentState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          userAddressListResponseModel == other.userAddressListResponseModel &&
          addPaymentMethodResponseModel == other.addPaymentMethodResponseModel &&
          paymentMethodListModel == other.paymentMethodListModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      userAddressListResponseModel.hashCode ^
      addPaymentMethodResponseModel.hashCode ^
      paymentMethodListModel.hashCode ^
      currentAction.hashCode ^
      error.hashCode;
}
