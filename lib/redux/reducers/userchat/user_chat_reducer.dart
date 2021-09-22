import 'package:khontext/redux/actions/userchat/user_chat_actions.dart';
import 'package:khontext/redux/states/userchat/user_chat_state.dart';
import 'package:khontext/src/models/userchats/chat_list_model.dart';
import 'package:redux/redux.dart';

/// This will give the common combined reducer which will call different functions below like.
Reducer<UserChatState> userChatReducer = combineReducers([
  /// User chat list
  TypedReducer<UserChatState, SetUserChatAction>(userChatList),
  TypedReducer<UserChatState, SetUserChatErrorAction>(userChatListError),
  TypedReducer<UserChatState, SetUserChatSuccessAction>(userChatListSuccess),

  /// User single chat
  TypedReducer<UserChatState, AddSingleChatAction>(singleUserChat),
  TypedReducer<UserChatState, AddSingleChatErrorAction>(singleUserChatError),
  TypedReducer<UserChatState, AddSingleChatSuccessAction>(singleUserChatSuccess),
]);

/// Set user chat list.
UserChatState userChatList(UserChatState state, SetUserChatAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: SetUserChatAction);
}

UserChatState userChatListError(UserChatState state, SetUserChatErrorAction action) {
  return state.copyWith(
    isLoading: false,
    error: action.error,
    currentAction: SetUserChatErrorAction,
    chatListModel: ChatListModel.initial(),
  );
}

UserChatState userChatListSuccess(UserChatState state, SetUserChatSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: null,
    chatListModel: action.chatListModel,
    currentAction: SetUserChatSuccessAction,
  );
}

/// Set single user message
UserChatState singleUserChat(UserChatState state, AddSingleChatAction action) {
  return state.copyWith(isLoading: true, error: null, currentAction: AddSingleChatAction);
}

UserChatState singleUserChatError(UserChatState state, AddSingleChatErrorAction action) {
  return state.copyWith(isLoading: false, error: action.error, currentAction: AddSingleChatErrorAction);
}

UserChatState singleUserChatSuccess(UserChatState state, AddSingleChatSuccessAction action) {
  return state.copyWith(
    isLoading: false,
    error: null,
    chatListModel: action.chatListModel,
    currentAction: AddSingleChatSuccessAction,
  );
}
