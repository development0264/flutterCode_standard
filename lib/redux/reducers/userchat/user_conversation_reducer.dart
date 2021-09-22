import 'package:khontext/redux/actions/userchat/user_conversations_actions.dart';
import 'package:khontext/redux/states/userchat/user_conversations_state.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<UserConversationState> userConversationReducer = combineReducers([
  TypedReducer<UserConversationState, GetUserConversationsAction>(userConversations),
  TypedReducer<UserConversationState, GetUserConversationsErrorAction>(userConversationsError),
  TypedReducer<UserConversationState, GetUserConversationsSuccessAction>(userConversationsSuccess),
]);

/// Voice call token.
UserConversationState userConversations(UserConversationState state, GetUserConversationsAction action) {
  return state.copyWith(isLoading: true, error: null);
}

UserConversationState userConversationsError(UserConversationState state, GetUserConversationsErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error);
}

UserConversationState userConversationsSuccess(UserConversationState state, GetUserConversationsSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: null,
    userConversationsResponseModel: action.userConversationsResponseModel,
  );
}
