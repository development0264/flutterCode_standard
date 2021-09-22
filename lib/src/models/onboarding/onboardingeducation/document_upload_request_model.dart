import 'dart:convert';

import 'package:meta/meta.dart';

String documentUploadRequestModelToJson(DocumentUploadRequestModel data) =>
    json.encode(data.toJson());

class DocumentUploadRequestModel {
  DocumentUploadRequestModel({
    @required this.fileOrDocumentInformations,
  });

  List<FileOrDocumentInformationRequest> fileOrDocumentInformations;

  factory DocumentUploadRequestModel.fromJson(Map<String, dynamic> json) =>
      DocumentUploadRequestModel(
        fileOrDocumentInformations: List<FileOrDocumentInformationRequest>.from(
            json["fileOrDocumentInformations"]
                .map((x) => FileOrDocumentInformationRequest.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fileOrDocumentInformations":
            List<dynamic>.from(fileOrDocumentInformations.map((x) => x.toJson())),
      };
}

class FileOrDocumentInformationRequest {
  FileOrDocumentInformationRequest({
    @required this.name,
    @required this.base64,
    @required this.fileType,
    this.mimeType,
    this.captions,
  });

  String name;
  String base64;
  String fileType;
  String captions;
  String mimeType;

  factory FileOrDocumentInformationRequest.fromJson(Map<String, dynamic> json) =>
      FileOrDocumentInformationRequest(
        name: json["name"],
        base64: json["base64"],
        fileType: json["fileType"],
        captions: json['captions'],
        mimeType: json['mimeType'],
      );

  Map<String, dynamic> toJson() => captions == null || mimeType == null
      ? {
          "name": name,
          "base64": base64,
          "fileType": fileType,
        }
      : {
          "name": name,
          "base64": base64,
          "fileType": fileType,
          "captions": captions,
          "mimeType": mimeType,
        };
}
