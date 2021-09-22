import 'dart:convert';

import 'package:khontext/src/models/userchats/chat_list_model.dart';
import 'package:meta/meta.dart';

SingleChatModel singleChatModelFromJson(String str) => SingleChatModel.fromJson(json.decode(str));

String singleChatModelToJson(SingleChatModel data) => json.encode(data.toJson());

class SingleChatModel {
  SingleChatModel({
    @required this.singleMessageData,
  });

  SingleMessageData singleMessageData;

  factory SingleChatModel.fromJson(Map<String, dynamic> json) => SingleChatModel(
        singleMessageData: SingleMessageData.fromJson(json["SingleMessageData"]),
      );

  Map<String, dynamic> toJson() => {
        "SingleMessageData": singleMessageData.toJson(),
      };
}
