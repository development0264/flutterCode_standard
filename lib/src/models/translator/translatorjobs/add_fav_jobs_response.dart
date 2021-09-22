import 'dart:convert';

import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_response.dart';
import 'package:meta/meta.dart';

AddFavJobResponse addFavJobResponseFromJson(String str) =>
    AddFavJobResponse.fromJson(json.decode(str));

String addFavJobResponseToJson(AddFavJobResponse data) => json.encode(data.toJson());

class AddFavJobResponse {
  AddFavJobResponse({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  FavoriteJobsResponse data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory AddFavJobResponse.fromJson(Map<String, dynamic> json) => AddFavJobResponse(
        data: FavoriteJobsResponse.fromJson(json["data"]),
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
