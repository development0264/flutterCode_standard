import 'dart:convert';

import 'package:meta/meta.dart';

ClientCompanyImageResponseModel clientCompanyImageResponseModelFromJson(String str) =>
    ClientCompanyImageResponseModel.fromJson(json.decode(str));

String clientCompanyImageResponseModelToJson(ClientCompanyImageResponseModel data) => json.encode(data.toJson());

class ClientCompanyImageResponseModel {
  ClientCompanyImageResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ClientCompanyImageData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory ClientCompanyImageResponseModel.fromJson(Map<String, dynamic> json) => ClientCompanyImageResponseModel(
        data: json["data"] == null ? null : ClientCompanyImageData.fromJson(json["data"]),
        message: json["message"] == null ? null : json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"] == null ? null : json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data == null ? null : data.toJson(),
        "message": message == null ? null : message,
        "errors": errors,
        "isSuccessful": isSuccessful == null ? null : isSuccessful,
      };
}

class ClientCompanyImageData {
  ClientCompanyImageData({
    @required this.fileDocumentId,
    @required this.name,
    @required this.base64,
    @required this.captions,
    @required this.description,
    @required this.path,
    @required this.thumbnailPath,
    @required this.url,
    @required this.thumbnailUrl,
    @required this.size,
    @required this.mimeType,
    @required this.extension,
    @required this.width,
    @required this.height,
    @required this.fileType,
    @required this.aspectRatio,
  });

  String fileDocumentId;
  String name;
  String base64;
  String captions;
  String description;
  dynamic path;
  dynamic thumbnailPath;
  dynamic url;
  dynamic thumbnailUrl;
  int size;
  String mimeType;
  String extension;
  int width;
  int height;
  String fileType;
  String aspectRatio;

  factory ClientCompanyImageData.fromJson(Map<String, dynamic> json) => ClientCompanyImageData(
        fileDocumentId: json["fileDocumentId"] == null ? null : json["fileDocumentId"],
        name: json["name"] == null ? null : json["name"],
        base64: json["base64"] == null ? null : json["base64"],
        captions: json["captions"] == null ? null : json["captions"],
        description: json["description"] == null ? null : json["description"],
        path: json["path"],
        thumbnailPath: json["thumbnailPath"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
        size: json["size"] == null ? null : json["size"],
        mimeType: json["mimeType"] == null ? null : json["mimeType"],
        extension: json["extension"] == null ? null : json["extension"],
        width: json["width"] == null ? null : json["width"],
        height: json["height"] == null ? null : json["height"],
        fileType: json["fileType"] == null ? null : json["fileType"],
        aspectRatio: json["aspectRatio"] == null ? null : json["aspectRatio"],
      );

  Map<String, dynamic> toJson() => {
        "fileDocumentId": fileDocumentId == null ? null : fileDocumentId,
        "name": name == null ? null : name,
        "base64": base64 == null ? null : base64,
        "captions": captions == null ? null : captions,
        "description": description == null ? null : description,
        "path": path,
        "thumbnailPath": thumbnailPath,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
        "size": size == null ? null : size,
        "mimeType": mimeType == null ? null : mimeType,
        "extension": extension == null ? null : extension,
        "width": width == null ? null : width,
        "height": height == null ? null : height,
        "fileType": fileType == null ? null : fileType,
        "aspectRatio": aspectRatio == null ? null : aspectRatio,
      };
}
