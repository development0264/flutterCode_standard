import 'package:meta/meta.dart';
import 'dart:convert';

AddFavJobRequest addFavJobRequestFromJson(String str) => AddFavJobRequest.fromJson(json.decode(str));

String addFavJobRequestToJson(AddFavJobRequest data) => json.encode(data.toJson());

class AddFavJobRequest {
  AddFavJobRequest({
    @required this.userId,
    @required this.jobId,
    @required this.isFavorite,
  });

  String userId;
  String jobId;
  bool isFavorite;

  factory AddFavJobRequest.fromJson(Map<String, dynamic> json) => AddFavJobRequest(
    userId: json["userId"],
    jobId: json["jobId"],
    isFavorite: json["isFavorite"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "jobId": jobId,
    "isFavorite": isFavorite,
  };
}
