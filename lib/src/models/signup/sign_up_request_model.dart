import 'dart:convert';

class SignUpRequestModel {
  UserProfileModel userProfileModel;
  VerifyEmailModel verifyEmailModel;
  SendVerificationPhoneModel sendVerificationPhoneModel;
  VerifyPhoneModel verifyPhoneModel;
  CompleteUserProfileModel completeUserProfileModel;

  SignUpRequestModel({
    this.userProfileModel,
    this.verifyEmailModel,
    this.sendVerificationPhoneModel,
    this.verifyPhoneModel,
    this.completeUserProfileModel,
  });
}

String userProfileModelToJson(UserProfileModel data) => json.encode(data.toJson());

class UserProfileModel {
  final String firstName;
  final String lastName;
  final String emailName;
  final String password;

  UserProfileModel({this.firstName, this.password, this.lastName, this.emailName});

  Map<String, dynamic> toJson() =>
      {"firstName": firstName, "lastName": lastName, "email": emailName, "password": password};
}

String verifyEmailModelToJson(VerifyEmailModel data) => json.encode(data.toJson());

class VerifyEmailModel {
  final String userId;
  final String verificationCode;

  VerifyEmailModel({this.userId, this.verificationCode});

  Map<String, dynamic> toJson() => {"UserId": userId, "VerificationCode": verificationCode};
}

String sendVerificationPhoneModelToJson(SendVerificationPhoneModel data) =>
    json.encode(data.toJson());

class SendVerificationPhoneModel {
  final String userId;
  final String toNumber;
  final String countryCode;

  SendVerificationPhoneModel({this.userId, this.toNumber, this.countryCode});

  Map<String, dynamic> toJson() =>
      {"userId": userId, "toNumber": toNumber, "countryCode": countryCode};
}

String verifyPhoneModelToJson(VerifyPhoneModel data) => json.encode(data.toJson());

class VerifyPhoneModel {
  final String userId;
  final String verificationCode;

  VerifyPhoneModel({this.userId, this.verificationCode});

  Map<String, dynamic> toJson() => {"UserId": userId, "VerificationCode": verificationCode};
}

String completeUserProfileModelToJson(CompleteUserProfileModel data) => json.encode(data.toJson());

class CompleteUserProfileModel {
  final String userId;
  final String roleCode;

  CompleteUserProfileModel({this.userId, this.roleCode});

  factory CompleteUserProfileModel.initial() {
    return CompleteUserProfileModel(userId: '', roleCode: '');
  }

  Map<String, dynamic> toJson() => {"userId": userId, "roleCode": roleCode};
}
