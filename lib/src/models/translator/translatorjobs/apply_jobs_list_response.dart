import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:meta/meta.dart';

ApplyJobsListResponse applyJobsListResponseFromJson(String str) =>
    ApplyJobsListResponse.fromJson(json.decode(str));

String applyJobsListResponseToJson(ApplyJobsListResponse data) => json.encode(data.toJson());

class ApplyJobsListResponse {
  ApplyJobsListResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  List<ApplyJobsData> data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory ApplyJobsListResponse.fromJson(Map<String, dynamic> json) => ApplyJobsListResponse(
        data: List<ApplyJobsData>.from(json["data"].map((x) => ApplyJobsData.fromJson(x))),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class ApplyJobsData {
  ApplyJobsData({
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
  List<ClientProfileImageData> fileOrDocumentResponse;

  factory ApplyJobsData.fromJson(Map<String, dynamic> json) => ApplyJobsData(
        applyJobId: json["applyJobId"],
        userId: json["userId"],
        jobId: json["jobId"],
        description: json["description"],
        isJobAccepted: json["isJobAccepted"],
        fileOrDocumentResponse: json["fileOrDocumentResponse"] == null
            ? null
            : List<ClientProfileImageData>.from(
                json["fileOrDocumentResponse"].map((x) => ClientProfileImageData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "applyJobId": applyJobId,
        "userId": userId,
        "jobId": jobId,
        "description": description,
        "isJobAccepted": isJobAccepted,
        "fileOrDocumentResponse": fileOrDocumentResponse == null
            ? null
            : List<dynamic>.from(fileOrDocumentResponse.map((x) => x.toJson())),
      };
}
