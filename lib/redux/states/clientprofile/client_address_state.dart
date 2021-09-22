import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:meta/meta.dart';

@immutable
class ClientAddressState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final ClientAddressResponseModel clientAddressResponseModel;

  ClientAddressState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.clientAddressResponseModel,
  });

  factory ClientAddressState.initial() {
    return ClientAddressState(
      isLoading: false,
      clientAddressResponseModel: null,
      currentAction: null,
      error: '',
    );
  }

  ClientAddressState copyWith({
    bool isLoading,
    ClientAddressResponseModel clientAddressResponseModel,
    dynamic currentAction,
    String error,
  }) {
    return ClientAddressState(
      isLoading: isLoading ?? this.isLoading,
      clientAddressResponseModel: clientAddressResponseModel ?? this.clientAddressResponseModel,
      currentAction: currentAction ?? this.currentAction,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientAddressState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          clientAddressResponseModel == other.clientAddressResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^ clientAddressResponseModel.hashCode ^ currentAction.hashCode ^ error.hashCode;
}
