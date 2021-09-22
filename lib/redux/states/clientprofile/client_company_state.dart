import 'package:khontext/src/models/clientprofile/client_company_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_model.dart';
import 'package:meta/meta.dart';

@immutable
class ClientCompanyState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final ClientCompanyResponseModel clientCompanyResponseModel;
  final ClientCompanyImageResponseModel clientCompanyProfileImageResponseModel;

  ClientCompanyState({
    @required this.isLoading,
    @required this.error,
    @required this.currentAction,
    @required this.clientCompanyResponseModel,
    @required this.clientCompanyProfileImageResponseModel,
  });

  factory ClientCompanyState.initial() {
    return ClientCompanyState(
      isLoading: false,
      clientCompanyResponseModel: null,
      clientCompanyProfileImageResponseModel: null,
      currentAction: null,
      error: '',
    );
  }

  ClientCompanyState copyWith({
    bool isLoading,
    ClientCompanyResponseModel clientCompanyResponseModel,
    ClientCompanyImageResponseModel clientCompanyProfileImageResponseModel,
    dynamic currentAction,
    String error,
  }) {
    return ClientCompanyState(
      isLoading: isLoading ?? this.isLoading,
      clientCompanyResponseModel: clientCompanyResponseModel ?? this.clientCompanyResponseModel,
      clientCompanyProfileImageResponseModel:
          clientCompanyProfileImageResponseModel ?? this.clientCompanyProfileImageResponseModel,
      currentAction: currentAction ?? this.currentAction,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientCompanyState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          clientCompanyResponseModel == other.clientCompanyResponseModel &&
          clientCompanyProfileImageResponseModel == other.clientCompanyProfileImageResponseModel &&
          currentAction == other.currentAction &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^
      clientCompanyResponseModel.hashCode ^
      clientCompanyProfileImageResponseModel.hashCode ^
      currentAction.hashCode ^
      error.hashCode;
}
