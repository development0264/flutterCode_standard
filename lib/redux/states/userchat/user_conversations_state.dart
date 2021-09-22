import 'package:flutter/foundation.dart';
import 'package:khontext/src/models/userchats/user_conversations_model.dart';
import 'package:meta/meta.dart';

@immutable
class UserConversationState {
  final bool isLoading;
  final String error;
  final UserConversationsResponseModel userConversationsResponseModel;

  UserConversationState({
    @required this.isLoading,
    @required this.error,
    @required this.userConversationsResponseModel,
  });

  factory UserConversationState.initial() {
    return UserConversationState(
      isLoading: false,
      error: '',
      userConversationsResponseModel: UserConversationsResponseModel.initial(),
    );
  }

  UserConversationState copyWith({
    bool isLoading,
    String error,
    UserConversationsResponseModel userConversationsResponseModel,
  }) {
    return UserConversationState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      userConversationsResponseModel: userConversationsResponseModel ?? this.userConversationsResponseModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserConversationState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          userConversationsResponseModel == other.userConversationsResponseModel;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ userConversationsResponseModel.hashCode;
}
