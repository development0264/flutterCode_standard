import 'dart:convert';

import 'package:meta/meta.dart';

String clientProfileImageRequestModelToJson(ClientProfileImageRequestModel data) => json.encode(data.toJson());

class ClientProfileImageRequestModel {
  ClientProfileImageRequestModel({
    @required this.name,
    @required this.base64,
    @required this.fileType,
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
        "FileType": fileType == null ? null : fileType,
      };
}
