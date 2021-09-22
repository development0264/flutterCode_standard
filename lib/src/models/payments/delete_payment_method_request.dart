import 'package:meta/meta.dart';
import 'dart:convert';

DeletePaymentMethodRequestModel deletePaymentMethodRequestModelFromJson(String str) => DeletePaymentMethodRequestModel.fromJson(json.decode(str));

String deletePaymentMethodRequestModelToJson(DeletePaymentMethodRequestModel data) => json.encode(data.toJson());

class DeletePaymentMethodRequestModel {
  DeletePaymentMethodRequestModel({
    @required this.userId,
    @required this.sourceId,
    @required this.type,
  });

  String userId;
  String sourceId;
  String type;

  factory DeletePaymentMethodRequestModel.fromJson(Map<String, dynamic> json) => DeletePaymentMethodRequestModel(
    userId: json["userId"],
    sourceId: json["sourceId"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "sourceId": sourceId,
    "type": type,
  };
}
