import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:khontext/redux/actions/userchat/user_chat_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/models/userchats/SingleChatModel.dart';
import 'package:khontext/src/models/userchats/add_conversation_request_model.dart';
import 'package:khontext/src/models/userchats/chat_list_model.dart';
import 'package:khontext/src/screens/userchat/apiprovider/user_chat_api.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:redux/redux.dart';

class ChatUtils {
  /// const for the [MethodChannel] platform.
  static const chatBridgePlatform = const MethodChannel(Constants.chatBridgeName);

  static void initiateChatChannel(Store<AppState> store, GlobalKey<NavigatorState> _navigator) {
    chatBridgePlatform.setMethodCallHandler((call) {
      switch (call.method) {
        case Constants.usersConversations:
          break;
        case Constants.initiateSuccess:
          print("The chat manager successfully initiated");
          break;
        case Constants.newConversation:
          print("The new conversation created ---> ${call.arguments}");
          _newConversationAdded(_navigator, call);
          break;
        case Constants.messagesList:
          print("the response from 000> ${call.arguments.toString()}");
          ChatListModel chatListModel = chatListModelFromJson(call.arguments.toString());
          if(chatListModel?.messageListData?.isNotEmpty == true){
            chatListModel.messageListData = List.from(chatListModel.messageListData.reversed);
          }
          store.dispatch(SetUserChatAction(chatListModel: chatListModel));
          break;
        case Constants.singleMessage:
          print("The single message ---> ${call.arguments}");
          SingleChatModel singleChatModel = singleChatModelFromJson(call.arguments.toString());
          SingleMessageData singleMessageData = singleChatModel?.singleMessageData;
          store.dispatch(AddSingleChatAction(singleMessageData: singleMessageData));
          break;
      }
      return null;
    });
  }

  static void _newConversationAdded(GlobalKey<NavigatorState> _navigator, MethodCall call) {
    String chatAccessToken = Utils.getStringFromPrefs(Constants.chatAccessToken);
    if (chatAccessToken?.isNotEmpty == true) {
      Map<String, dynamic> decodedToken = JwtDecoder.decode(chatAccessToken);

      if (decodedToken != null &&
          decodedToken['grants'] != null &&
          decodedToken['grants']['chat'] != null &&
          decodedToken['grants']['chat']['service_sid'] != null) {
        UserChatApiCalls.addUserConversation(AddConversationRequestModel(
          toUser: call.arguments[Constants.toUser],
          fromUser: call.arguments[Constants.fromUser],
          conversationSid: call.arguments[Constants.conversationSid],
          chatServiceSid: decodedToken['grants']['chat']['service_sid'],
          messageServiceSid: '',
        )).then((response) {
          print("The response for the add conversation ---> ${response?.isSuccessful}");
          if (response?.isSuccessful == true && response?.data != null) {
          } else if (response?.errors != null && response.errors.length > 0) {
            // Fluttertoast.showToast(msg: response.errors[0]);
            _navigator.currentState.pop();
          }
        }).onError((error, stackTrace) {
          print("On Error ---> $error");
        });
      } else {
        _navigator.currentState.pop();
      }
    }
  }
}
