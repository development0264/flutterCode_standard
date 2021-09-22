import 'package:meta/meta.dart';
import 'dart:convert';

AcceptProposalResponse acceptProposalResponseFromJson(String str) => AcceptProposalResponse.fromJson(json.decode(str));

String acceptProposalResponseToJson(AcceptProposalResponse data) => json.encode(data.toJson());

class AcceptProposalResponse {
  AcceptProposalResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  AcceptProposalsData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AcceptProposalResponse.fromJson(Map<String, dynamic> json) => AcceptProposalResponse(
    data: AcceptProposalsData.fromJson(json["data"]),
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

class AcceptProposalsData {
  AcceptProposalsData({
    @required this.applyJobId,
    @required this.userId,
    @required this.jobId,
    @required this.description,
    @required this.isJobAccepted,
    @required this.fileOrDocumentResponse,
  });

  String applyJobId;
  String userId;
  String jobId;
  String description;
  bool isJobAccepted;
  dynamic fileOrDocumentResponse;

  factory AcceptProposalsData.fromJson(Map<String, dynamic> json) => AcceptProposalsData(
    applyJobId: json["applyJobId"],
    userId: json["userId"],
    jobId: json["jobId"],
    description: json["description"],
    isJobAccepted: json["isJobAccepted"],
    fileOrDocumentResponse: json["fileOrDocumentResponse"],
  );

  Map<String, dynamic> toJson() => {
    "applyJobId": applyJobId,
    "userId": userId,
    "jobId": jobId,
    "description": description,
    "isJobAccepted": isJobAccepted,
    "fileOrDocumentResponse": fileOrDocumentResponse,
  };
}
