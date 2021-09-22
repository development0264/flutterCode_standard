import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:meta/meta.dart';

@immutable
class PostJobLocalityState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final ClientAddressResponseModel clientAddressResponseModel;

  PostJobLocalityState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.clientAddressResponseModel,
  });

  factory PostJobLocalityState.initial() {
    return PostJobLocalityState(
      isLoading: false,
      error: '',
      currentAction: null,
      clientAddressResponseModel: ClientAddressResponseModel.initial(),
    );
  }

  PostJobLocalityState copyWith({
    bool isLoading,
    String error,
    dynamic currentAction,
    ClientAddressResponseModel clientAddressResponseModel,
  }) {
    return PostJobLocalityState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      currentAction: currentAction ?? this.currentAction,
      clientAddressResponseModel: clientAddressResponseModel ?? this.clientAddressResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostJobLocalityState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          currentAction == other.currentAction &&
          clientAddressResponseModel == other.clientAddressResponseModel &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^ error.hashCode ^ clientAddressResponseModel.hashCode ^ currentAction.hashCode;
}
