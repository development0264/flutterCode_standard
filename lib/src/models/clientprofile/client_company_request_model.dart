import 'dart:convert';

import 'package:meta/meta.dart';

String clientCompanyRequestModelToJson(ClientCompanyRequestModel data) => json.encode(data.toJson());

class ClientCompanyRequestModel {
  ClientCompanyRequestModel({
    @required this.name,
    @required this.tagline,
    @required this.website,
    @required this.description,
  });

  String name;
  String tagline;
  String website;
  String description;

  Map<String, dynamic> toJson() => {
        "Name": name == null ? null : name,
        "Tagline": tagline == null ? null : tagline,
        "Website": website == null ? null : website,
        "Description": description == null ? null : description,
      };
}
