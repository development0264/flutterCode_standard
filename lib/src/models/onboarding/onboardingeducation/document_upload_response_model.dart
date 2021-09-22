import 'package:meta/meta.dart';
import 'dart:convert';

DocumentUploadResponseModel documentUploadResponseModelFromJson(String str) => DocumentUploadResponseModel.fromJson(json.decode(str));

String documentUploadResponseModelToJson(DocumentUploadResponseModel data) => json.encode(data.toJson());

class DocumentUploadResponseModel {
  DocumentUploadResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  DocumentUploadResponseData data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory DocumentUploadResponseModel.fromJson(Map<String, dynamic> json) => DocumentUploadResponseModel(
    data: DocumentUploadResponseData.fromJson(json["data"]),
    message: json["message"],
    errors: List<dynamic>.from(json["errors"].map((x) => x)),
    isSuccessful: json["isSuccessful"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "errors": List<dynamic>.from(errors.map((x) => x)),
    "isSuccessful": isSuccessful,
  };

  factory DocumentUploadResponseModel.initial(){
    return DocumentUploadResponseModel(data: null, message: null, errors: [], isSuccessful: false);
  }
}

class DocumentUploadResponseData {
  DocumentUploadResponseData({
    @required this.fileOrDocumentInformations,
  });

  List<FileOrDocumentInformationResponse> fileOrDocumentInformations;

  factory DocumentUploadResponseData.fromJson(Map<String, dynamic> json) => DocumentUploadResponseData(
    fileOrDocumentInformations: List<FileOrDocumentInformationResponse>.from(json["fileOrDocumentInformations"].map((x) => FileOrDocumentInformationResponse.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "fileOrDocumentInformations": List<dynamic>.from(fileOrDocumentInformations.map((x) => x.toJson())),
  };
}

class FileOrDocumentInformationResponse {
  FileOrDocumentInformationResponse({
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
  dynamic captions;
  dynamic description;
  dynamic path;
  dynamic thumbnailPath;
  dynamic url;
  dynamic thumbnailUrl;
  int size;
  dynamic mimeType;
  dynamic extension;
  int width;
  int height;
  String fileType;
  dynamic aspectRatio;

  factory FileOrDocumentInformationResponse.fromJson(Map<String, dynamic> json) => FileOrDocumentInformationResponse(
    fileDocumentId: json["fileDocumentId"],
    name: json["name"],
    base64: json["base64"],
    captions: json["captions"],
    description: json["description"],
    path: json["path"],
    thumbnailPath: json["thumbnailPath"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
    size: json["size"],
    mimeType: json["mimeType"],
    extension: json["extension"],
    width: json["width"],
    height: json["height"],
    fileType: json["fileType"],
    aspectRatio: json["aspectRatio"],
  );

  Map<String, dynamic> toJson() => {
    "fileDocumentId": fileDocumentId,
    "name": name,
    "base64": base64,
    "captions": captions,
    "description": description,
    "path": path,
    "thumbnailPath": thumbnailPath,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
    "size": size,
    "mimeType": mimeType,
    "extension": extension,
    "width": width,
    "height": height,
    "fileType": fileType,
    "aspectRatio": aspectRatio,
  };
}
