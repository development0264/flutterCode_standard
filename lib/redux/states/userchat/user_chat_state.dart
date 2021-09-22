import 'package:flutter/foundation.dart';
import 'package:khontext/src/models/userchats/chat_list_model.dart';
import 'package:meta/meta.dart';

@immutable
class UserChatState {
  final bool isLoading;
  final String error;
  final dynamic currentAction;
  final ChatListModel chatListModel;

  UserChatState({
    @required this.isLoading,
    @required this.error,
    @required this.chatListModel,
    @required this.currentAction,
  });

  factory UserChatState.initial() {
    return UserChatState(
      isLoading: false,
      error: '',
      chatListModel: ChatListModel.initial(),
      currentAction: null,
    );
  }

  UserChatState copyWith({
    bool isLoading,
    String error,
    ChatListModel chatListModel,
    dynamic currentAction,
  }) {
    return UserChatState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      chatListModel: chatListModel ?? this.chatListModel,
      currentAction: currentAction ?? this.currentAction,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserChatState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          chatListModel == other.chatListModel &&
          currentAction == other.currentAction;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ chatListModel.hashCode ^ currentAction.hashCode;
}
