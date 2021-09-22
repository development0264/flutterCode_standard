import 'package:meta/meta.dart';
import 'dart:convert';

ClientCompanyResponseModel clientCompanyResponseModelFromJson(String str) => ClientCompanyResponseModel.fromJson(json.decode(str));

String clientCompanyResponseModelToJson(ClientCompanyResponseModel data) => json.encode(data.toJson());

class ClientCompanyResponseModel {
  ClientCompanyResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ClientCompanyData data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory ClientCompanyResponseModel.fromJson(Map<String, dynamic> json) => ClientCompanyResponseModel(
    data: json["data"] == null ? null : ClientCompanyData.fromJson(json["data"]),
    message: json["message"] == null ? null : json["message"],
    errors: json["errors"] == null ? null : List<dynamic>.from(json["errors"].map((x) => x)),
    isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? null : data.toJson(),
    "message": message == null ? null : message,
    "errors": errors == null ? null : List<dynamic>.from(errors.map((x) => x)),
    "isSuccessful": isSuccessful == null ? null : isSuccessful,
  };
}

class ClientCompanyData {
  ClientCompanyData({
    @required this.companyId,
    @required this.name,
    @required this.tagline,
    @required this.website,
    @required this.description,
  });

  String companyId;
  String name;
  String tagline;
  String website;
  String description;

  factory ClientCompanyData.fromJson(Map<String, dynamic> json) => ClientCompanyData(
    companyId: json["companyId"] == null ? null : json["companyId"],
    name: json["name"] == null ? null : json["name"],
    tagline: json["tagline"] == null ? null : json["tagline"],
    website: json["website"] == null ? null : json["website"],
    description: json["description"] == null ? null : json["description"],
  );

  Map<String, dynamic> toJson() => {
    "companyId": companyId == null ? null : companyId,
    "name": name == null ? null : name,
    "tagline": tagline == null ? null : tagline,
    "website": website == null ? null : website,
    "description": description == null ? null : description,
  };
}
