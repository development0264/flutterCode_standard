import 'package:khontext/utils/enums.dart';
import 'package:meta/meta.dart';

@immutable
class ClientProfileLocalState {
  final bool isLoading;
  final String error;
  final ProfilePageEditStatus editStatus;

  ClientProfileLocalState({
    @required this.isLoading,
    @required this.error,
    @required this.editStatus,
  });

  factory ClientProfileLocalState.initial() {
    return ClientProfileLocalState(
      isLoading: false,
      editStatus: ProfilePageEditStatus.IDLE_MODE,
      error: '',
    );
  }

  ClientProfileLocalState copyWith({
    bool isLoading,
    String error,
    ProfilePageEditStatus editStatus,
  }) {
    return ClientProfileLocalState(
      isLoading: isLoading ?? this.isLoading,
      editStatus: editStatus ?? this.editStatus,
      error: error ?? this.error,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ClientProfileLocalState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          editStatus == other.editStatus &&
          error == other.error;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode;
}
