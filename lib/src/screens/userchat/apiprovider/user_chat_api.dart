import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/userchats/add_conversation_request_model.dart';
import 'package:khontext/src/models/userchats/add_conversation_response_model.dart';
import 'package:khontext/src/models/userchats/user_conversations_model.dart';
import 'package:khontext/src/models/voicecall/call_token_response_model.dart';

class UserChatApiCalls {
  const UserChatApiCalls();

  /// [getVoiceCallToken] will take in the [userId] and will return the [CallTokenResponseModel].
  static Future<CallTokenResponseModel> getChatToken(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.userChatToken + userId);
    CallTokenResponseModel responseModel;
    if (response != null) {
      responseModel = callTokenResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [addUserConversation] will take in the [AddConversationRequestModel] and will return the [AddConversationResponseModel].
  static Future<AddConversationResponseModel> addUserConversation(
      AddConversationRequestModel addConversationRequestModel) async {
    var response = await ApiProvider.postAsync(ApiEndpoints.addConversation,
        body: addConversationRequestModelToJson(addConversationRequestModel));
    AddConversationResponseModel responseModel;
    if (response != null) {
      responseModel = addConversationResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }

  /// [getUserConversation] will take in the [AddConversationRequestModel] and will return the [UserConversationsResponseModel].
  static Future<UserConversationsResponseModel> getUserConversation(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.getUserConversation + userId);
    UserConversationsResponseModel responseModel;
    if (response != null) {
      responseModel = userConversationsResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
