import 'package:khontext/src/models/userchats/chat_list_model.dart';

/// Group of functions which gives the actions for the [UserChat].
/// This group contains [SetUserChatAction] which takes in the queries and gives out the response as
/// either [SetUserChatSuccessAction] or [SetUserChatErrorAction].
class SetUserChatAction {
  final ChatListModel chatListModel;

  SetUserChatAction({this.chatListModel});
}

class SetUserChatErrorAction {
  final String error;

  SetUserChatErrorAction({this.error});
}

class SetUserChatSuccessAction {
  final ChatListModel chatListModel;

  SetUserChatSuccessAction({this.chatListModel});
}

/// Group of functions which gives the actions for the [UserChat].
/// This group contains [AddSingleChatAction] which takes in the queries and gives out the response as
/// either [AddSingleChatSuccessAction] or [AddSingleChatErrorAction].
class AddSingleChatAction {
  final SingleMessageData singleMessageData;

  AddSingleChatAction({this.singleMessageData});
}

class AddSingleChatErrorAction {
  final String error;

  AddSingleChatErrorAction({this.error});
}

class AddSingleChatSuccessAction {
  final ChatListModel chatListModel;

  AddSingleChatSuccessAction({this.chatListModel});
}
