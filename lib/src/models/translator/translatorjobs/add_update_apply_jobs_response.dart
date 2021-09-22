import 'dart:convert';

import 'package:khontext/src/models/translator/translatorjobs/apply_jobs_list_response.dart';
import 'package:meta/meta.dart';

AddUpdateApplyJobsResponse addUpdateApplyJobsResponseFromJson(String str) =>
    AddUpdateApplyJobsResponse.fromJson(json.decode(str));

String addUpdateApplyJobsResponseToJson(AddUpdateApplyJobsResponse data) =>
    json.encode(data.toJson());

class AddUpdateApplyJobsResponse {
  AddUpdateApplyJobsResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ApplyJobsData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddUpdateApplyJobsResponse.fromJson(Map<String, dynamic> json) =>
      AddUpdateApplyJobsResponse(
        data: ApplyJobsData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  factory AddUpdateApplyJobsResponse.initial() {
    return AddUpdateApplyJobsResponse(data: null, message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}
