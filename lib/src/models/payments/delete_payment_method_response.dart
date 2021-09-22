import 'package:meta/meta.dart';
import 'dart:convert';

DeletePaymentMethodResponseModel deletePaymentMethodResponseModelFromJson(String str) => DeletePaymentMethodResponseModel.fromJson(json.decode(str));

String deletePaymentMethodResponseModelToJson(DeletePaymentMethodResponseModel data) => json.encode(data.toJson());

class DeletePaymentMethodResponseModel {
  DeletePaymentMethodResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  DeleteMethodData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory DeletePaymentMethodResponseModel.fromJson(Map<String, dynamic> json) => DeletePaymentMethodResponseModel(
    data: DeleteMethodData.fromJson(json["data"]),
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

class DeleteMethodData {
  DeleteMethodData({
    @required this.userId,
    @required this.sourceId,
    @required this.type,
    @required this.deleted,
  });

  String userId;
  String sourceId;
  String type;
  bool deleted;

  factory DeleteMethodData.fromJson(Map<String, dynamic> json) => DeleteMethodData(
    userId: json["userId"],
    sourceId: json["sourceId"],
    type: json["type"],
    deleted: json["deleted"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "sourceId": sourceId,
    "type": type,
    "deleted": deleted,
  };
}
