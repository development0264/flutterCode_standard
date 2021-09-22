import 'package:meta/meta.dart';
import 'dart:convert';

PostedJobsRequestModel postedJobsRequestModelFromJson(String str) => PostedJobsRequestModel.fromJson(json.decode(str));

String postedJobsRequestModelToJson(PostedJobsRequestModel data) => json.encode(data.toJson());

class PostedJobsRequestModel {
  PostedJobsRequestModel({
    @required this.userId,
    @required this.queryList,
    @required this.pageNumber,
    @required this.pageSize,
  });

  String userId;
  List<dynamic> queryList;
  int pageNumber;
  int pageSize;

  factory PostedJobsRequestModel.fromJson(Map<String, dynamic> json) => PostedJobsRequestModel(
    userId: json["userId"],
    queryList: List<dynamic>.from(json["queryList"].map((x) => x)),
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "queryList": List<dynamic>.from(queryList.map((x) => x)),
    "pageNumber": pageNumber,
    "pageSize": pageSize,
  };
}
