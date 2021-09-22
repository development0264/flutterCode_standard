import 'package:meta/meta.dart';
import 'dart:convert';

TranslatorJobsRequest translatorJobsRequestFromJson(String str) => TranslatorJobsRequest.fromJson(json.decode(str));

String translatorJobsRequestToJson(TranslatorJobsRequest data) => json.encode(data.toJson());

class TranslatorJobsRequest {
  TranslatorJobsRequest({
    @required this.searchQuery,
    @required this.queryList,
    @required this.page,
    @required this.pageSize,
  });

  String searchQuery;
  List<QueryList> queryList;
  int page;
  int pageSize;

  factory TranslatorJobsRequest.fromJson(Map<String, dynamic> json) => TranslatorJobsRequest(
    searchQuery: json["searchQuery"],
    queryList: List<QueryList>.from(json["queryList"].map((x) => QueryList.fromJson(x))),
    page: json["page"],
    pageSize: json["pageSize"],
  );

  Map<String, dynamic> toJson() => {
    "searchQuery": searchQuery,
    "queryList": List<dynamic>.from(queryList.map((x) => x.toJson())),
    "page": page,
    "pageSize": pageSize,
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
