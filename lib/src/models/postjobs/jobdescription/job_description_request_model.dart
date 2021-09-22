import 'dart:convert';

import 'package:flutter/material.dart';

String jobDescriptionRequestModelToJson(JobDescriptionRequestModel data) => json.encode(data.toJson());

class JobDescriptionRequestModel {
  JobDescriptionRequestModel({
    @required this.jobId,
    @required this.userId,
    @required this.title,
    @required this.serviceTypeId,
    @required this.serviceIds,
    @required this.description,
    @required this.fileDocumentIds,
  });

  String jobId;
  String userId;
  String title;
  String serviceTypeId;
  List<dynamic> serviceIds;
  String description;
  List<String> fileDocumentIds;

  Map<String, dynamic> toJson() => {
        "jobId": jobId == null ? null : jobId,
        "UserId": userId == null ? null : userId,
        "Title": title == null ? null : title,
        "ServiceTypeId": serviceTypeId == null ? null : serviceTypeId,
        "ServiceIds": serviceIds == null ? null : List<dynamic>.from(serviceIds.map((x) => x)),
        "Description": description == null ? null : description,
        "FileDocumentIds": fileDocumentIds == null ? null : List<dynamic>.from(fileDocumentIds.map((x) => x)),
      };
}
