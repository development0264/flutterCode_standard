import 'package:meta/meta.dart';
import 'dart:convert';

UserConversationsResponseModel userConversationsResponseModelFromJson(String str) => UserConversationsResponseModel.fromJson(json.decode(str));

String userConversationsResponseModelToJson(UserConversationsResponseModel data) => json.encode(data.toJson());

class UserConversationsResponseModel {
  UserConversationsResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  ConversationData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory UserConversationsResponseModel.fromJson(Map<String, dynamic> json) => UserConversationsResponseModel(
    data: ConversationData.fromJson(json["data"]),
    message: json["message"],
    errors: json["errors"],
    isSuccessful: json["isSuccessful"],
  );

  factory UserConversationsResponseModel.initial(){
    return UserConversationsResponseModel(data: ConversationData.initial(), message: '', errors: [], isSuccessful: false);
  }

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "errors": errors,
    "isSuccessful": isSuccessful,
  };
}

class ConversationData {
  ConversationData({
    @required this.fromUser,
    @required this.userConversations,
  });

  UserDataModel fromUser;
  List<ConversationDataModel> userConversations;

  factory ConversationData.fromJson(Map<String, dynamic> json) => ConversationData(
    fromUser: UserDataModel.fromJson(json["fromUser"]),
    userConversations: List<ConversationDataModel>.from(json["userConversations"].map((x) => ConversationDataModel.fromJson(x))),
  );

  factory ConversationData.initial(){
    return ConversationData(fromUser: null, userConversations: []);
  }

  Map<String, dynamic> toJson() => {
    "fromUser": fromUser.toJson(),
    "userConversations": List<dynamic>.from(userConversations.map((x) => x.toJson())),
  };
}

class UserDataModel {
  UserDataModel({
    @required this.username,
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
    @required this.password,
    @required this.passwordHash,
    @required this.isLocked,
    @required this.isPhoneVerified,
    @required this.isEmailVerified,
    @required this.promoCode,
    @required this.email,
    @required this.countryCode,
    @required this.phone,
    @required this.emailVerificationCode,
    @required this.emailVerificationDate,
    @required this.phoneVerificationCode,
    @required this.phoneVerificationDate,
    @required this.userRoles,
    @required this.userAddresses,
    @required this.userFileOrDocuments,
    @required this.userCompanies,
    @required this.experiences,
    @required this.educations,
    @required this.jobs,
    @required this.identifications,
    @required this.paymentMethods,
    @required this.taxResidences,
    @required this.paymentTransfers,
    @required this.paymentCardDetails,
    @required this.salt,
    @required this.taxId,
    @required this.customerId,
    @required this.accountId,
    @required this.isAccount,
    @required this.isExternalAccountCard,
    @required this.isAccountVerified,
    @required this.isIdVerified,
    @required this.checkrId,
    @required this.checkrReportId,
    @required this.checkrReportResult,
    @required this.userBackgroundChecks,
    @required this.id,
    @required this.insertedAt,
    @required this.updatedAt,
    @required this.isActive,
    @required this.insertedBy,
    @required this.updatedBy,
  });

  String username;
  String firstName;
  String middleName;
  String lastName;
  String password;
  String passwordHash;
  bool isLocked;
  bool isPhoneVerified;
  bool isEmailVerified;
  String promoCode;
  String email;
  dynamic countryCode;
  dynamic phone;
  String emailVerificationCode;
  DateTime emailVerificationDate;
  dynamic phoneVerificationCode;
  dynamic phoneVerificationDate;
  List<dynamic> userRoles;
  List<dynamic> userAddresses;
  List<dynamic> userFileOrDocuments;
  dynamic userCompanies;
  List<dynamic> experiences;
  List<dynamic> educations;
  List<dynamic> jobs;
  List<dynamic> identifications;
  List<dynamic> paymentMethods;
  List<dynamic> taxResidences;
  List<dynamic> paymentTransfers;
  List<dynamic> paymentCardDetails;
  String salt;
  dynamic taxId;
  dynamic customerId;
  dynamic accountId;
  bool isAccount;
  bool isExternalAccountCard;
  bool isAccountVerified;
  bool isIdVerified;
  dynamic checkrId;
  dynamic checkrReportId;
  dynamic checkrReportResult;
  List<dynamic> userBackgroundChecks;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory UserDataModel.fromJson(Map<String, dynamic> json) => UserDataModel(
    username: json["username"],
    firstName: json["firstName"],
    middleName: json["middleName"],
    lastName: json["lastName"],
    password: json["password"],
    passwordHash: json["passwordHash"],
    isLocked: json["isLocked"],
    isPhoneVerified: json["isPhoneVerified"],
    isEmailVerified: json["isEmailVerified"],
    promoCode: json["promoCode"],
    email: json["email"],
    countryCode: json["countryCode"],
    phone: json["phone"],
    emailVerificationCode: json["emailVerificationCode"],
    emailVerificationDate: DateTime.parse(json["emailVerificationDate"]),
    phoneVerificationCode: json["phoneVerificationCode"],
    phoneVerificationDate: json["phoneVerificationDate"],
    userRoles: List<dynamic>.from(json["userRoles"].map((x) => x)),
    userAddresses: List<dynamic>.from(json["userAddresses"].map((x) => x)),
    userFileOrDocuments: List<dynamic>.from(json["userFileOrDocuments"].map((x) => x)),
    userCompanies: json["userCompanies"],
    experiences: List<dynamic>.from(json["experiences"].map((x) => x)),
    educations: List<dynamic>.from(json["educations"].map((x) => x)),
    jobs: List<dynamic>.from(json["jobs"].map((x) => x)),
    identifications: List<dynamic>.from(json["identifications"].map((x) => x)),
    paymentMethods: List<dynamic>.from(json["paymentMethods"].map((x) => x)),
    taxResidences: List<dynamic>.from(json["taxResidences"].map((x) => x)),
    paymentTransfers: List<dynamic>.from(json["paymentTransfers"].map((x) => x)),
    paymentCardDetails: List<dynamic>.from(json["paymentCardDetails"].map((x) => x)),
    salt: json["salt"],
    taxId: json["taxId"],
    customerId: json["customerId"],
    accountId: json["accountId"],
    isAccount: json["isAccount"],
    isExternalAccountCard: json["isExternalAccountCard"],
    isAccountVerified: json["isAccountVerified"],
    isIdVerified: json["isIdVerified"],
    checkrId: json["checkrId"],
    checkrReportId: json["checkrReportId"],
    checkrReportResult: json["checkrReportResult"],
    userBackgroundChecks: List<dynamic>.from(json["userBackgroundChecks"].map((x) => x)),
    id: json["id"],
    insertedAt: DateTime.parse(json["insertedAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    isActive: json["isActive"],
    insertedBy: json["insertedBy"],
    updatedBy: json["updatedBy"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "firstName": firstName,
    "middleName": middleName,
    "lastName": lastName,
    "password": password,
    "passwordHash": passwordHash,
    "isLocked": isLocked,
    "isPhoneVerified": isPhoneVerified,
    "isEmailVerified": isEmailVerified,
    "promoCode": promoCode,
    "email": email,
    "countryCode": countryCode,
    "phone": phone,
    "emailVerificationCode": emailVerificationCode,
    "emailVerificationDate": emailVerificationDate.toIso8601String(),
    "phoneVerificationCode": phoneVerificationCode,
    "phoneVerificationDate": phoneVerificationDate,
    "userRoles": List<dynamic>.from(userRoles.map((x) => x)),
    "userAddresses": List<dynamic>.from(userAddresses.map((x) => x)),
    "userFileOrDocuments": List<dynamic>.from(userFileOrDocuments.map((x) => x)),
    "userCompanies": userCompanies,
    "experiences": List<dynamic>.from(experiences.map((x) => x)),
    "educations": List<dynamic>.from(educations.map((x) => x)),
    "jobs": List<dynamic>.from(jobs.map((x) => x)),
    "identifications": List<dynamic>.from(identifications.map((x) => x)),
    "paymentMethods": List<dynamic>.from(paymentMethods.map((x) => x)),
    "taxResidences": List<dynamic>.from(taxResidences.map((x) => x)),
    "paymentTransfers": List<dynamic>.from(paymentTransfers.map((x) => x)),
    "paymentCardDetails": List<dynamic>.from(paymentCardDetails.map((x) => x)),
    "salt": salt,
    "taxId": taxId,
    "customerId": customerId,
    "accountId": accountId,
    "isAccount": isAccount,
    "isExternalAccountCard": isExternalAccountCard,
    "isAccountVerified": isAccountVerified,
    "isIdVerified": isIdVerified,
    "checkrId": checkrId,
    "checkrReportId": checkrReportId,
    "checkrReportResult": checkrReportResult,
    "userBackgroundChecks": List<dynamic>.from(userBackgroundChecks.map((x) => x)),
    "id": id,
    "insertedAt": insertedAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "isActive": isActive,
    "insertedBy": insertedBy,
    "updatedBy": updatedBy,
  };
}

class ConversationDataModel {
  ConversationDataModel({
    @required this.conversationSid,
    @required this.toUser,
    @required this.chatServiceSid,
    @required this.messageServiceSid,
  });

  String conversationSid;
  UserDataModel toUser;
  String chatServiceSid;
  String messageServiceSid;

  factory ConversationDataModel.fromJson(Map<String, dynamic> json) => ConversationDataModel(
    conversationSid: json["conversationSid"],
    toUser: UserDataModel.fromJson(json["toUser"]),
    chatServiceSid: json["chatServiceSid"],
    messageServiceSid: json["messageServiceSid"],
  );

  Map<String, dynamic> toJson() => {
    "conversationSid": conversationSid,
    "toUser": toUser.toJson(),
    "chatServiceSid": chatServiceSid,
    "messageServiceSid": messageServiceSid,
  };
}
