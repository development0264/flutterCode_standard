import 'dart:convert';

import 'package:meta/meta.dart';

String clientCompanyImageRequestModelToJson(ClientCompanyImageRequestModel data) => json.encode(data.toJson());

class ClientCompanyImageRequestModel {
  ClientCompanyImageRequestModel({
    @required this.name,
    @required this.base64,
    @required this.captions,
    @required this.description,
    @required this.size,
    @required this.mimeType,
    @required this.extension,
    @required this.width,
    @required this.height,
    @required this.fileType,
    @required this.aspectRatio,
  });

  String name;
  String base64;
  String captions;
  String description;
  String size;
  String mimeType;
  String extension;
  String width;
  String height;
  String fileType;
  String aspectRatio;

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Base64": base64 == null ? null : base64,
        "Captions": captions == null ? null : captions,
        "Description": description == null ? null : description,
        "Size": size == null ? null : size,
        "MimeType": mimeType == null ? null : mimeType,
        "Extension": extension == null ? null : extension,
        "Width": width == null ? null : width,
        "Height": height == null ? null : height,
        "FileType": fileType == null ? null : fileType,
        "AspectRatio": aspectRatio == null ? null : aspectRatio,
      };
}
