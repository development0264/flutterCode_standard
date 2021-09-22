import 'package:khontext/src/models/userchats/user_conversations_model.dart';

/// Group of functions which gives the actions for the [UserChat].
/// This group contains [GetUserConversationsAction] which takes in the queries and gives out the response as
/// either [GetUserConversationsSuccessAction] or [GetUserConversationsErrorAction].
class GetUserConversationsAction {
  final String userId;

  GetUserConversationsAction({this.userId});
}

class GetUserConversationsErrorAction {
  final String error;

  GetUserConversationsErrorAction({this.error});
}

class GetUserConversationsSuccessAction {
  final UserConversationsResponseModel userConversationsResponseModel;

  GetUserConversationsSuccessAction({this.userConversationsResponseModel});
}
