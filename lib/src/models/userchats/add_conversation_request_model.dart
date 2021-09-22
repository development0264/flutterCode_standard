import 'dart:convert';

import 'package:meta/meta.dart';

AddConversationRequestModel addConversationRequestModelFromJson(String str) =>
    AddConversationRequestModel.fromJson(json.decode(str));

String addConversationRequestModelToJson(AddConversationRequestModel data) => json.encode(data.toJson());

class AddConversationRequestModel {
  AddConversationRequestModel({
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

  factory AddConversationRequestModel.fromJson(Map<String, dynamic> json) => AddConversationRequestModel(
        toUser: json["toUser"],
        fromUser: json["fromUser"],
        conversationSid: json["conversationSid"],
        chatServiceSid: json["chatServiceSid"],
        messageServiceSid: json["messageServiceSid"],
      );

  factory AddConversationRequestModel.initial() {
    return AddConversationRequestModel(
      toUser: '',
      fromUser: '',
      conversationSid: '',
      chatServiceSid: '',
      messageServiceSid: '',
    );
  }

  Map<String, dynamic> toJson() => {
        "toUser": toUser,
        "fromUser": fromUser,
        "conversationSid": conversationSid,
        "chatServiceSid": chatServiceSid,
        "messageServiceSid": messageServiceSid,
      };
}
