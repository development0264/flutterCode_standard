import 'package:meta/meta.dart';
import 'dart:convert';

CompleteProfileResponseModel completeProfileResponseModelFromJson(String str) => CompleteProfileResponseModel.fromJson(json.decode(str));

String completeProfileResponseModelToJson(CompleteProfileResponseModel data) => json.encode(data.toJson());

class CompleteProfileResponseModel {
  CompleteProfileResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ProfileData data;
  String message;
  List<dynamic> errors;
  bool isSuccessful;

  factory CompleteProfileResponseModel.initial(){
    return CompleteProfileResponseModel(data: null, message: '', errors: null, isSuccessful: false);
  }

  factory CompleteProfileResponseModel.fromJson(Map<String, dynamic> json) => CompleteProfileResponseModel(
    data: json["data"] == null ? null : ProfileData.fromJson(json["data"]),
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

class ProfileData {
  ProfileData({
    @required this.userId,
    @required this.firstName,
    @required this.lastName,
    @required this.username,
    @required this.token,
    @required this.email,
    @required this.phone,
    @required this.isEmailVerified,
    @required this.isPhoneVerified,
    @required this.roles,
    @required this.customerId,
    @required this.accountId,
    @required this.isAccount,
    @required this.isExternalAccountCard,
    @required this.isAccountLink,
    @required this.isAccountVerified,
    @required this.isIdVerified,
    @required this.checkrId,
    @required this.checkrReportId,
    @required this.checkrReportResult,
  });

  String userId;
  String firstName;
  String lastName;
  String username;
  String token;
  String email;
  String phone;
  bool isEmailVerified;
  bool isPhoneVerified;
  List<Role> roles;
  String customerId;
  String accountId;
  bool isAccount;
  bool isExternalAccountCard;
  bool isAccountLink;
  bool isAccountVerified;
  bool isIdVerified;
  String checkrId;
  String checkrReportId;
  String checkrReportResult;

  factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
    userId: json["userId"] == null ? null : json["userId"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    username: json["username"] == null ? null : json["username"],
    token: json["token"] == null ? null : json["token"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    isEmailVerified: json["isEmailVerified"] == null ? null : json["isEmailVerified"],
    isPhoneVerified: json["isPhoneVerified"] == null ? null : json["isPhoneVerified"],
    roles: json["roles"] == null ? null : List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
    customerId: json["customerId"],
    accountId: json["accountId"],
    isAccount: json["isAccount"],
    isExternalAccountCard: json["isExternalAccountCard"],
    isAccountLink: json["isAccountLink"],
    isAccountVerified: json["isAccountVerified"],
    isIdVerified: json["isIdVerified"],
    checkrId: json["checkrId"],
    checkrReportId: json["checkrReportId"],
    checkrReportResult: json["checkrReportResult"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId == null ? null : userId,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "username": username == null ? null : username,
    "token": token == null ? null : token,
    "email": email == null ? null : email,
    "phone": phone == null ? null : phone,
    "isEmailVerified": isEmailVerified == null ? null : isEmailVerified,
    "isPhoneVerified": isPhoneVerified == null ? null : isPhoneVerified,
    "roles": roles == null ? null : List<dynamic>.from(roles.map((x) => x.toJson())),
    "customerId": customerId,
    "accountId": accountId,
    "isAccount": isAccount,
    "isExternalAccountCard": isExternalAccountCard,
    "isAccountLink": isAccountLink,
    "isAccountVerified": isAccountVerified,
    "isIdVerified": isIdVerified,
    "checkrId": checkrId,
    "checkrReportId": checkrReportId,
    "checkrReportResult": checkrReportResult,
  };
}

class Role {
  Role({
    @required this.userRoles,
    @required this.rolePermissions,
    @required this.groupRoles,
    @required this.name,
    @required this.code,
    @required this.description,
    @required this.id,
    @required this.insertedAt,
    @required this.updatedAt,
    @required this.isActive,
    @required this.insertedBy,
    @required this.updatedBy,
  });

  List<dynamic> userRoles;
  List<dynamic> rolePermissions;
  List<dynamic> groupRoles;
  String name;
  String code;
  String description;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    userRoles: json["userRoles"] == null ? null : List<dynamic>.from(json["userRoles"].map((x) => x)),
    rolePermissions: json["rolePermissions"] == null ? null : List<dynamic>.from(json["rolePermissions"].map((x) => x)),
    groupRoles: json["groupRoles"] == null ? null : List<dynamic>.from(json["groupRoles"].map((x) => x)),
    name: json["name"] == null ? null : json["name"],
    code: json["code"] == null ? null : json["code"],
    description: json["description"] == null ? null : json["description"],
    id: json["id"] == null ? null : json["id"],
    insertedAt: json["insertedAt"] == null ? null : DateTime.parse(json["insertedAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    isActive: json["isActive"] == null ? null : json["isActive"],
    insertedBy: json["insertedBy"],
    updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "userRoles": userRoles == null ? null : List<dynamic>.from(userRoles.map((x) => x)),
    "rolePermissions": rolePermissions == null ? null : List<dynamic>.from(rolePermissions.map((x) => x)),
    "groupRoles": groupRoles == null ? null : List<dynamic>.from(groupRoles.map((x) => x)),
    "name": name == null ? null : name,
    "code": code == null ? null : code,
    "description": description == null ? null : description,
    "id": id == null ? null : id,
    "insertedAt": insertedAt == null ? null : insertedAt.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt.toIso8601String(),
    "isActive": isActive == null ? null : isActive,
    "insertedBy": insertedBy,
    "updatedBy": updatedBy,
  };
}
