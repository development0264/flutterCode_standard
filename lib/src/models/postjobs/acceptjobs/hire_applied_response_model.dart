import 'dart:convert';

import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:meta/meta.dart';

HireAppliedResponseModel hireAppliedResponseModelFromJson(String str) =>
    HireAppliedResponseModel.fromJson(json.decode(str));

String hireAppliedResponseModelToJson(HireAppliedResponseModel data) => json.encode(data.toJson());

class HireAppliedResponseModel {
  HireAppliedResponseModel({
    @required this.data,
    @required this.message,
    @required this.errors,
    @required this.isSuccessful,
  });

  HireAppliedData data;
  String message;
  dynamic errors;
  bool isSuccessful;

  factory HireAppliedResponseModel.fromJson(Map<String, dynamic> json) => HireAppliedResponseModel(
        data: HireAppliedData.fromJson(json["data"]),
        message: json["message"],
        errors: json["errors"],
        isSuccessful: json["isSuccessful"],
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
        "message": message,
        "errors": errors,
        "isSuccessful": isSuccessful,
      };
}

class HireAppliedData {
  HireAppliedData({
    @required this.jobId,
    @required this.appliedUsers,
  });

  String jobId;
  List<AppliedUser> appliedUsers;

  factory HireAppliedData.fromJson(Map<String, dynamic> json) => HireAppliedData(
        jobId: json["jobId"],
        appliedUsers:
            List<AppliedUser>.from(json["appliedUsers"].map((x) => AppliedUser.fromJson(x))),
      );

  factory HireAppliedData.initial(){
    return HireAppliedData(jobId: '', appliedUsers: []);
  }

  Map<String, dynamic> toJson() => {
        "jobId": jobId,
        "appliedUsers": List<dynamic>.from(appliedUsers.map((x) => x.toJson())),
      };
}

class AppliedUser {
  AppliedUser({
    @required this.applyJobId,
    @required this.description,
    @required this.user,
    @required this.fileOrDocumentResponse,
  });

  String applyJobId;
  String description;
  AppliedUserData user;
  List<ClientProfileImageData> fileOrDocumentResponse;

  factory AppliedUser.fromJson(Map<String, dynamic> json) => AppliedUser(
        applyJobId: json["applyJobId"],
        description: json["description"],
        user: AppliedUserData.fromJson(json["user"]),
        fileOrDocumentResponse: json["fileOrDocumentResponse"] == null
            ? null
            : List<ClientProfileImageData>.from(
                json["fileOrDocumentResponse"].map((x) => ClientProfileImageData.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "applyJobId": applyJobId,
        "description": description,
        "user": user.toJson(),
        "fileOrDocumentResponse": fileOrDocumentResponse == null
            ? null
            : List<dynamic>.from(fileOrDocumentResponse.map((x) => x.toJson())),
      };
}

class AppliedUserData {
  AppliedUserData({
    @required this.username,
    @required this.firstName,
    @required this.middleName,
    @required this.lastName,
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
    @required this.translatorLanguages,
    @required this.userFavoriteJobs,
    @required this.isElasticAdded,
    @required this.applyJobs,
    @required this.w9TaxForms,
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
  String passwordHash;
  bool isLocked;
  bool isPhoneVerified;
  bool isEmailVerified;
  String promoCode;
  String email;
  dynamic countryCode;
  String phone;
  String emailVerificationCode;
  DateTime emailVerificationDate;
  String phoneVerificationCode;
  DateTime phoneVerificationDate;
  List<UserRole> userRoles;
  List<UserAddress> userAddresses;
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
  String taxId;
  String customerId;
  String accountId;
  bool isAccount;
  bool isExternalAccountCard;
  bool isAccountVerified;
  bool isIdVerified;
  String checkrId;
  String checkrReportId;
  String checkrReportResult;
  List<dynamic> userBackgroundChecks;
  List<TranslatorLanguage> translatorLanguages;
  List<dynamic> userFavoriteJobs;
  bool isElasticAdded;
  List<dynamic> applyJobs;
  List<dynamic> w9TaxForms;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory AppliedUserData.fromJson(Map<String, dynamic> json) => AppliedUserData(
        username: json["username"],
        firstName: json["firstName"],
        middleName: json["middleName"],
        lastName: json["lastName"],
        passwordHash: json["passwordHash"],
        isLocked: json["isLocked"],
        isPhoneVerified: json["isPhoneVerified"],
        isEmailVerified: json["isEmailVerified"],
        promoCode: json["promoCode"],
        email: json["email"],
        countryCode: json["countryCode"],
        phone: json["phone"] == null ? null : json["phone"],
        emailVerificationCode: json["emailVerificationCode"],
        emailVerificationDate: DateTime.parse(json["emailVerificationDate"]),
        phoneVerificationCode:
            json["phoneVerificationCode"] == null ? null : json["phoneVerificationCode"],
        phoneVerificationDate: json["phoneVerificationDate"] == null
            ? null
            : DateTime.parse(json["phoneVerificationDate"]),
        userRoles: List<UserRole>.from(json["userRoles"].map((x) => UserRole.fromJson(x))),
        userAddresses:
            List<UserAddress>.from(json["userAddresses"].map((x) => UserAddress.fromJson(x))),
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
        taxId: json["taxId"] == null ? null : json["taxId"],
        customerId: json["customerId"] == null ? null : json["customerId"],
        accountId: json["accountId"] == null ? null : json["accountId"],
        isAccount: json["isAccount"],
        isExternalAccountCard: json["isExternalAccountCard"],
        isAccountVerified: json["isAccountVerified"],
        isIdVerified: json["isIdVerified"],
        checkrId: json["checkrId"],
        checkrReportId: json["checkrReportId"],
        checkrReportResult: json["checkrReportResult"],
        userBackgroundChecks: List<dynamic>.from(json["userBackgroundChecks"].map((x) => x)),
        translatorLanguages: List<TranslatorLanguage>.from(
            json["translatorLanguages"].map((x) => TranslatorLanguage.fromJson(x))),
        userFavoriteJobs: List<dynamic>.from(json["userFavoriteJobs"].map((x) => x)),
        isElasticAdded: json["isElasticAdded"],
        applyJobs: List<dynamic>.from(json["applyJobs"].map((x) => x)),
        w9TaxForms: List<dynamic>.from(json["w9TaxForms"].map((x) => x)),
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
        "passwordHash": passwordHash,
        "isLocked": isLocked,
        "isPhoneVerified": isPhoneVerified,
        "isEmailVerified": isEmailVerified,
        "promoCode": promoCode,
        "email": email,
        "countryCode": countryCode,
        "phone": phone == null ? null : phone,
        "emailVerificationCode": emailVerificationCode,
        "emailVerificationDate": emailVerificationDate.toIso8601String(),
        "phoneVerificationCode": phoneVerificationCode == null ? null : phoneVerificationCode,
        "phoneVerificationDate":
            phoneVerificationDate == null ? null : phoneVerificationDate.toIso8601String(),
        "userRoles": List<dynamic>.from(userRoles.map((x) => x.toJson())),
        "userAddresses": List<dynamic>.from(userAddresses.map((x) => x.toJson())),
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
        "taxId": taxId == null ? null : taxId,
        "customerId": customerId == null ? null : customerId,
        "accountId": accountId == null ? null : accountId,
        "isAccount": isAccount,
        "isExternalAccountCard": isExternalAccountCard,
        "isAccountVerified": isAccountVerified,
        "isIdVerified": isIdVerified,
        "checkrId": checkrId,
        "checkrReportId": checkrReportId,
        "checkrReportResult": checkrReportResult,
        "userBackgroundChecks": List<dynamic>.from(userBackgroundChecks.map((x) => x)),
        "translatorLanguages": List<dynamic>.from(translatorLanguages.map((x) => x.toJson())),
        "userFavoriteJobs": List<dynamic>.from(userFavoriteJobs.map((x) => x)),
        "isElasticAdded": isElasticAdded,
        "applyJobs": List<dynamic>.from(applyJobs.map((x) => x)),
        "w9TaxForms": List<dynamic>.from(w9TaxForms.map((x) => x)),
        "id": id,
        "insertedAt": insertedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "insertedBy": insertedBy,
        "updatedBy": updatedBy,
      };
}

class TranslatorLanguage {
  TranslatorLanguage({
    @required this.userId,
    @required this.languageId,
    @required this.language,
    @required this.translatorLanguageSpecializations,
    @required this.id,
    @required this.insertedAt,
    @required this.updatedAt,
    @required this.isActive,
    @required this.insertedBy,
    @required this.updatedBy,
  });

  String userId;
  String languageId;
  Language language;
  List<TranslatorLanguageSpecialization> translatorLanguageSpecializations;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory TranslatorLanguage.fromJson(Map<String, dynamic> json) => TranslatorLanguage(
        userId: json["userId"],
        languageId: json["languageId"],
        language: Language.fromJson(json["language"]),
        translatorLanguageSpecializations: List<TranslatorLanguageSpecialization>.from(
            json["translatorLanguageSpecializations"]
                .map((x) => TranslatorLanguageSpecialization.fromJson(x))),
        id: json["id"],
        insertedAt: DateTime.parse(json["insertedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        insertedBy: json["insertedBy"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "languageId": languageId,
        "language": language.toJson(),
        "translatorLanguageSpecializations":
            List<dynamic>.from(translatorLanguageSpecializations.map((x) => x.toJson())),
        "id": id,
        "insertedAt": insertedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "insertedBy": insertedBy,
        "updatedBy": updatedBy,
      };
}

class Language {
  Language({
    @required this.name,
    @required this.code,
    @required this.locale,
    @required this.directionality,
    @required this.localName,
    @required this.languageSpecializations,
    @required this.toJobs,
    @required this.fromJobs,
    @required this.translatorLanguages,
    @required this.id,
    @required this.insertedAt,
    @required this.updatedAt,
    @required this.isActive,
    @required this.insertedBy,
    @required this.updatedBy,
  });

  String name;
  String code;
  String locale;
  String directionality;
  String localName;
  List<dynamic> languageSpecializations;
  List<dynamic> toJobs;
  List<dynamic> fromJobs;
  List<dynamic> translatorLanguages;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory Language.fromJson(Map<String, dynamic> json) => Language(
        name: json["name"],
        code: json["code"],
        locale: json["locale"],
        directionality: json["directionality"],
        localName: json["localName"],
        languageSpecializations: List<dynamic>.from(json["languageSpecializations"].map((x) => x)),
        toJobs: List<dynamic>.from(json["toJobs"].map((x) => x)),
        fromJobs: List<dynamic>.from(json["fromJobs"].map((x) => x)),
        translatorLanguages: List<dynamic>.from(json["translatorLanguages"].map((x) => x)),
        id: json["id"],
        insertedAt: DateTime.parse(json["insertedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        insertedBy: json["insertedBy"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "code": code,
        "locale": locale,
        "directionality": directionality,
        "localName": localName,
        "languageSpecializations": List<dynamic>.from(languageSpecializations.map((x) => x)),
        "toJobs": List<dynamic>.from(toJobs.map((x) => x)),
        "fromJobs": List<dynamic>.from(fromJobs.map((x) => x)),
        "translatorLanguages": List<dynamic>.from(translatorLanguages.map((x) => x)),
        "id": id,
        "insertedAt": insertedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "insertedBy": insertedBy,
        "updatedBy": updatedBy,
      };
}

class TranslatorLanguageSpecialization {
  TranslatorLanguageSpecialization({
    @required this.translatorLanguageId,
    @required this.specializationId,
    @required this.specialization,
  });

  String translatorLanguageId;
  String specializationId;
  Specialization specialization;

  factory TranslatorLanguageSpecialization.fromJson(Map<String, dynamic> json) =>
      TranslatorLanguageSpecialization(
        translatorLanguageId: json["translatorLanguageId"],
        specializationId: json["specializationId"],
        specialization: Specialization.fromJson(json["specialization"]),
      );

  Map<String, dynamic> toJson() => {
        "translatorLanguageId": translatorLanguageId,
        "specializationId": specializationId,
        "specialization": specialization.toJson(),
      };
}

class Specialization {
  Specialization({
    @required this.languageSpecializations,
    @required this.visibilitySpecializations,
    @required this.jobLanguageSpecializations,
    @required this.translatorLanguageSpecializations,
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

  List<dynamic> languageSpecializations;
  List<dynamic> visibilitySpecializations;
  List<dynamic> jobLanguageSpecializations;
  List<dynamic> translatorLanguageSpecializations;
  String name;
  String code;
  String description;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory Specialization.fromJson(Map<String, dynamic> json) => Specialization(
        languageSpecializations: List<dynamic>.from(json["languageSpecializations"].map((x) => x)),
        visibilitySpecializations:
            List<dynamic>.from(json["visibilitySpecializations"].map((x) => x)),
        jobLanguageSpecializations:
            List<dynamic>.from(json["jobLanguageSpecializations"].map((x) => x)),
        translatorLanguageSpecializations:
            List<dynamic>.from(json["translatorLanguageSpecializations"].map((x) => x)),
        name: json["name"],
        code: json["code"],
        description: json["description"],
        id: json["id"],
        insertedAt: DateTime.parse(json["insertedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        insertedBy: json["insertedBy"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "languageSpecializations": List<dynamic>.from(languageSpecializations.map((x) => x)),
        "visibilitySpecializations": List<dynamic>.from(visibilitySpecializations.map((x) => x)),
        "jobLanguageSpecializations": List<dynamic>.from(jobLanguageSpecializations.map((x) => x)),
        "translatorLanguageSpecializations":
            List<dynamic>.from(translatorLanguageSpecializations.map((x) => x)),
        "name": name,
        "code": code,
        "description": description,
        "id": id,
        "insertedAt": insertedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "insertedBy": insertedBy,
        "updatedBy": updatedBy,
      };
}

class UserAddress {
  UserAddress({
    @required this.userId,
    @required this.addressId,
    @required this.address,
  });

  String userId;
  String addressId;
  Address address;

  factory UserAddress.fromJson(Map<String, dynamic> json) => UserAddress(
        userId: json["userId"],
        addressId: json["addressId"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "addressId": addressId,
        "address": address.toJson(),
      };
}

class Address {
  Address({
    @required this.streetNumber,
    @required this.streetName,
    @required this.line1,
    @required this.line2,
    @required this.addressTypeId,
    @required this.addressType,
    @required this.city,
    @required this.county,
    @required this.zipCode,
    @required this.timezone,
    @required this.country,
    @required this.userAddresses,
    @required this.jobs,
    @required this.paymentMethods,
    @required this.paymentCardDetails,
    @required this.id,
    @required this.insertedAt,
    @required this.updatedAt,
    @required this.isActive,
    @required this.insertedBy,
    @required this.updatedBy,
  });

  String streetNumber;
  String streetName;
  String line1;
  String line2;
  String addressTypeId;
  Role addressType;
  String city;
  String county;
  String zipCode;
  String timezone;
  String country;
  List<dynamic> userAddresses;
  dynamic jobs;
  List<dynamic> paymentMethods;
  List<dynamic> paymentCardDetails;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        streetNumber: json["streetNumber"],
        streetName: json["streetName"],
        line1: json["line1"],
        line2: json["line2"],
        addressTypeId: json["addressTypeId"],
        addressType: Role.fromJson(json["addressType"]),
        city: json["city"],
        county: json["county"],
        zipCode: json["zipCode"],
        timezone: json["timezone"],
        country: json["country"],
        userAddresses: List<dynamic>.from(json["userAddresses"].map((x) => x)),
        jobs: json["jobs"],
        paymentMethods: List<dynamic>.from(json["paymentMethods"].map((x) => x)),
        paymentCardDetails: List<dynamic>.from(json["paymentCardDetails"].map((x) => x)),
        id: json["id"],
        insertedAt: DateTime.parse(json["insertedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        insertedBy: json["insertedBy"],
        updatedBy: json["updatedBy"],
      );

  Map<String, dynamic> toJson() => {
        "streetNumber": streetNumber,
        "streetName": streetName,
        "line1": line1,
        "line2": line2,
        "addressTypeId": addressTypeId,
        "addressType": addressType.toJson(),
        "city": city,
        "county": county,
        "zipCode": zipCode,
        "timezone": timezone,
        "country": country,
        "userAddresses": List<dynamic>.from(userAddresses.map((x) => x)),
        "jobs": jobs,
        "paymentMethods": List<dynamic>.from(paymentMethods.map((x) => x)),
        "paymentCardDetails": List<dynamic>.from(paymentCardDetails.map((x) => x)),
        "id": id,
        "insertedAt": insertedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "insertedBy": insertedBy,
        "updatedBy": updatedBy,
      };
}

class Role {
  Role({
    @required this.addresses,
    @required this.name,
    @required this.code,
    @required this.description,
    @required this.id,
    @required this.insertedAt,
    @required this.updatedAt,
    @required this.isActive,
    @required this.insertedBy,
    @required this.updatedBy,
    @required this.userRoles,
    @required this.rolePermissions,
    @required this.groupRoles,
  });

  List<dynamic> addresses;
  String name;
  String code;
  String description;
  String id;
  DateTime insertedAt;
  DateTime updatedAt;
  bool isActive;
  dynamic insertedBy;
  dynamic updatedBy;
  List<dynamic> userRoles;
  List<dynamic> rolePermissions;
  List<dynamic> groupRoles;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        addresses:
            json["addresses"] == null ? null : List<dynamic>.from(json["addresses"].map((x) => x)),
        name: json["name"],
        code: json["code"],
        description: json["description"],
        id: json["id"],
        insertedAt: DateTime.parse(json["insertedAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        isActive: json["isActive"],
        insertedBy: json["insertedBy"],
        updatedBy: json["updatedBy"],
        userRoles:
            json["userRoles"] == null ? null : List<dynamic>.from(json["userRoles"].map((x) => x)),
        rolePermissions: json["rolePermissions"] == null
            ? null
            : List<dynamic>.from(json["rolePermissions"].map((x) => x)),
        groupRoles: json["groupRoles"] == null
            ? null
            : List<dynamic>.from(json["groupRoles"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "addresses": addresses == null ? null : List<dynamic>.from(addresses.map((x) => x)),
        "name": name,
        "code": code,
        "description": description,
        "id": id,
        "insertedAt": insertedAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "isActive": isActive,
        "insertedBy": insertedBy,
        "updatedBy": updatedBy,
        "userRoles": userRoles == null ? null : List<dynamic>.from(userRoles.map((x) => x)),
        "rolePermissions":
            rolePermissions == null ? null : List<dynamic>.from(rolePermissions.map((x) => x)),
        "groupRoles": groupRoles == null ? null : List<dynamic>.from(groupRoles.map((x) => x)),
      };
}

class UserRole {
  UserRole({
    @required this.userId,
    @required this.roleId,
    @required this.role,
  });

  String userId;
  String roleId;
  Role role;

  factory UserRole.fromJson(Map<String, dynamic> json) => UserRole(
        userId: json["userId"],
        roleId: json["roleId"],
        role: Role.fromJson(json["role"]),
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "roleId": roleId,
        "role": role.toJson(),
      };
}
