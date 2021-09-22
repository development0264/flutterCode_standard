import 'package:meta/meta.dart';
import 'dart:convert';

TranslatorFavJobsRequest translatorFavJobsRequestFromJson(String str) => TranslatorFavJobsRequest.fromJson(json.decode(str));

String translatorFavJobsRequestToJson(TranslatorFavJobsRequest data) => json.encode(data.toJson());

class TranslatorFavJobsRequest {
  TranslatorFavJobsRequest({
    @required this.userId,
    @required this.pageNumber,
    @required this.pageSize,
    @required this.searchJobTitle,
    @required this.queryList,
  });

  String userId;
  int pageNumber;
  int pageSize;
  String searchJobTitle;
  List<QueryList> queryList;

  factory TranslatorFavJobsRequest.fromJson(Map<String, dynamic> json) => TranslatorFavJobsRequest(
    userId: json["userId"],
    pageNumber: json["pageNumber"],
    pageSize: json["pageSize"],
    searchJobTitle: json["searchJobTitle"],
    queryList: List<QueryList>.from(json["queryList"].map((x) => QueryList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "pageNumber": pageNumber,
    "pageSize": pageSize,
    "searchJobTitle": searchJobTitle,
    "queryList": List<dynamic>.from(queryList.map((x) => x.toJson())),
  };
}

class QueryList {
  QueryList({
    @required this.param,
    @required this.value,
  });

  String param;
  String value;

  factory QueryList.fromJson(Map<String, dynamic> json) => QueryList(
    param: json["param"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "param": param,
    "value": value,
  };
}
