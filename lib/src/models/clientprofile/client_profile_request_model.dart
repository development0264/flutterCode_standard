import 'dart:convert';

import 'package:meta/meta.dart';

String clientProfileUpdateRequestModelToJson(ClientProfileUpdateRequestModel data) => json.encode(data.toJson());

class ClientProfileUpdateRequestModel {
  ClientProfileUpdateRequestModel({
    @required this.firstName,
    @required this.lastName,
    @required this.email,
    @required this.phone,
    @required this.taxId,
  });

  String firstName;
  String lastName;
  String email;
  String phone;
  String taxId;

  Map<String, dynamic> toJson() => {
        "FirstName": firstName == null ? null : firstName,
        "LastName": lastName == null ? null : lastName,
        "Email": email == null ? null : email,
        "Phone": phone == null ? null : phone,
        "taxId": taxId == null ? null : taxId,
      };
}
