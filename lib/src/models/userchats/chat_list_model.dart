import 'dart:convert';

import 'package:meta/meta.dart';

ChatListModel chatListModelFromJson(String str) =>
    ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  ChatListModel(
      {@required this.messageListData,
      @required this.conversationSid});

  String conversationSid;
  List<SingleMessageData> messageListData;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
      messageListData: List<SingleMessageData>.from(
          json["MessageListData"].map((x) => SingleMessageData.fromJson(x))),
      conversationSid: json["ConversationSid"]);

  factory ChatListModel.initial() {
    return ChatListModel(
        messageListData: [], conversationSid: '');
  }

  Map<String, dynamic> toJson() => {
        "MessageListData":
            List<dynamic>.from(messageListData.map((x) => x.toJson())),
        "ConversationSid": conversationSid,
      };
}

class SingleMessageData {
  SingleMessageData({
    @required this.conversationSid,
    @required this.dateCreated,
    @required this.dateUpdated,
    @required this.message,
    @required this.messageType,
    @required this.senderId,
    @required this.sid,
  });

  String conversationSid;
  DateTime dateCreated;
  DateTime dateUpdated;
  String message;
  String messageType;
  String senderId;
  String sid;

  factory SingleMessageData.fromJson(Map<String, dynamic> json) =>
      SingleMessageData(
        conversationSid: json["conversationSid"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateUpdated: DateTime.parse(json["dateUpdated"]),
        message: json["message"],
        messageType: json["messageType"],
        senderId: json["senderId"],
        sid: json["sid"],
      );

  Map<String, dynamic> toJson() => {
        "conversationSid": conversationSid,
        "dateCreated": dateCreated.toIso8601String(),
        "dateUpdated": dateUpdated.toIso8601String(),
        "message": message,
        "messageType": messageType,
        "senderId": senderId,
        "sid": sid,
      };
}
