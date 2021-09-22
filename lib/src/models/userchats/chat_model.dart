import 'dart:convert';

ChatModel chatModelFromJson(String str) => ChatModel.fromJson(json.decode(str));

String chatModelToJson(ChatModel data) => json.encode(data.toJson());

class ChatModel {
  final List<SingleChatData> chatList;

  ChatModel({this.chatList});

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(chatList: json["MessageList"]);

  factory ChatModel.initial() {
    return ChatModel(chatList: []);
  }

  Map<String, dynamic> toJson() => {"MessageList": chatList};
}

class SingleChatData {
  final String message;
  final String messageType;
  final String dateCreated;
  final String dateUpdated;
  final String senderId;
  final String sid;
  final String conversationSid;

  SingleChatData({
    this.message,
    this.messageType,
    this.dateCreated,
    this.dateUpdated,
    this.senderId,
    this.sid,
    this.conversationSid,
  });
}
