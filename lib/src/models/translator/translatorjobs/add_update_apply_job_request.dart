import 'dart:convert';

import 'package:meta/meta.dart';

AddUpdateApplyJobsRequest addUpdateApplyJobsRequestFromJson(String str) =>
    AddUpdateApplyJobsRequest.fromJson(json.decode(str));

String addUpdateApplyJobsRequestToJson(AddUpdateApplyJobsRequest data) =>
    json.encode(data?.applyJobId?.isNotEmpty == true ? data.toJsonUpdate() : data.toJson());

class AddUpdateApplyJobsRequest {
  AddUpdateApplyJobsRequest({
    this.applyJobId,
    @required this.jobId,
    @required this.userId,
    @required this.description,
    @required this.fileOrDocumentIds,
  });

  String applyJobId;
  String jobId;
  String userId;
  String description;
  List<String> fileOrDocumentIds;

  factory AddUpdateApplyJobsRequest.fromJson(Map<String, dynamic> json) =>
      AddUpdateApplyJobsRequest(
        applyJobId: json["applyJobId"],
        jobId: json["jobId"],
        userId: json["userId"],
        description: json["description"],
        fileOrDocumentIds: List<String>.from(json["fileOrDocumentIds"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "userId": userId,
        "description": description,
        "fileOrDocumentIds": List<dynamic>.from(fileOrDocumentIds.map((x) => x)),
      };

  Map<String, dynamic> toJsonUpdate() => {
        "applyJobId": applyJobId,
        "jobId": jobId,
        "userId": userId,
        "description": description,
        "fileOrDocumentIds": List<dynamic>.from(fileOrDocumentIds.map((x) => x)),
      };
}
