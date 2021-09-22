import 'package:meta/meta.dart';
import 'dart:convert';

AddConversationResponseModel addConversationResponseModelFromJson(String str) => AddConversationResponseModel.fromJson(json.decode(str));

String addConversationResponseModelToJson(AddConversationResponseModel data) => json.encode(data.toJson());

class AddConversationResponseModel {
  AddConversationResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ConversationData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddConversationResponseModel.fromJson(Map<String, dynamic> json) => AddConversationResponseModel(
    data: ConversationData.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}

class ConversationData {
  ConversationData({
    @required this.toUser,
    @required this.fromUser,
    @required this.conversationSid,
    @required this.chatServiceSid,
    @required this.messageServiceSid,
  });

  String toUser;
  String fromUser;
  String conversationSid;
  String chatServiceSid;
  String messageServiceSid;

  factory ConversationData.fromJson(Map<String, dynamic> json) => ConversationData(
    toUser: json["toUser"],
    fromUser: json["fromUser"],
    conversationSid: json["conversationSid"],
    chatServiceSid: json["chatServiceSid"],
    messageServiceSid: json["messageServiceSid"],
  );

  Map<String, dynamic> toJson() => {
    "toUser": toUser,
    "fromUser": fromUser,
    "conversationSid": conversationSid,
    "chatServiceSid": chatServiceSid,
    "messageServiceSid": messageServiceSid,
  };
}
