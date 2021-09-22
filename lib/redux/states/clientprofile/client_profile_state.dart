import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:meta/meta.dart';

@immutable
class ClientProfileState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final ClientProfileResponseModel clientProfileResponseModel;
  final ClientProfileImageResponseModel clientProfileImageResponseModel;

  ClientProfileState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.clientProfileResponseModel,
    @required this.clientProfileImageResponseModel,
  });

  factory ClientProfileState.initial() {
    return ClientProfileState(
      isLoading: false,
      clientProfileResponseModel: null,
      clientProfileImageResponseModel: null,
      currentAction: null,
      error: '',
    );
  }

  ClientProfileState copyWith({
    bool isLoading,
    ClientProfileResponseModel clientProfileResponseModel,
    ClientProfileImageResponseModel clientProfileImageResponseModel,
    dynamic currentAction,
    String error,
  }) {
    return ClientProfileState(
      isLoading: isLoading ?? this.isLoading,
      clientProfileResponseModel: clientProfileResponseModel ?? this.clientProfileResponseModel,
      clientProfileImageResponseModel: clientProfileImageResponseModel ?? this.clientProfileImageResponseModel,
      currentAction: currentAction ?? this.currentAction,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientProfileState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          clientProfileResponseModel == other.clientProfileResponseModel &&
          clientProfileImageResponseModel == other.clientProfileImageResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      clientProfileResponseModel.hashCode ^
      clientProfileImageResponseModel.hashCode ^
      currentAction.hashCode ^
      error.hashCode;
}
