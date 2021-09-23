import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:demo/src/demo_widgets/demo_l10n/messages_all.dart';

class FormBuilderLocalizations {
  static Future<FormBuilderLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? true) ? locale.languageCode : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return FormBuilderLocalizations();
    });
  }

  static const LocalizationsDelegate<FormBuilderLocalizations> delegate = _FormBuilderLocalizationsDelegate();

  static FormBuilderLocalizations of(BuildContext context) {
    /*return Localizations.of<FormBuilderLocalizations>(
        context, FormBuilderLocalizations);*/
    return Localizations.of<FormBuilderLocalizations>(
          context,
          FormBuilderLocalizations,
        ) ??
        FormBuilderLocalizations();
  }

  String get appNameText => Intl.message(
        'demo',
        name: 'appNameText',
        desc: 'app name Text',
      );

  /// Strings for the validations
  ///
  String get requiredErrorText {
    return Intl.message(
      'This field cannot be empty.',
      name: 'requiredErrorText',
      desc: 'Error Text for required validator',
    );
  }

  String equalErrorText<T>(T value) => Intl.message(
        'This field value must be equal to $value.',
        name: 'equalErrorText',
        args: [value],
        desc: 'Error Text for equal validator',
      );

  String notEqualErrorText<T>(T value) => Intl.message(
        'This field value must not be equal to $value.',
        name: 'notEqualErrorText',
        args: [value],
        desc: 'Error Text for not-equal validator',
      );

  String minErrorText(num min) => Intl.message(
        'Value must be greater than or equal to $min.',
        name: 'minErrorText',
        args: [min],
        desc: 'Error Text for required field',
      );

  String minLengthErrorText(int minLength) => Intl.message(
        'Value must have a length greater than or equal to $minLength',
        name: 'minLengthErrorText',
        args: [minLength],
        desc: 'Error Text for minLength validator',
      );

  String maxErrorText(num max) => Intl.message(
        'Value must be less than or equal to $max',
        name: 'maxErrorText',
        args: [max],
        desc: 'Error Text for max validator',
      );

  String maxLengthErrorText(int maxLength) => Intl.message(
        'Value must have a length less than or equal to $maxLength',
        name: 'maxLengthErrorText',
        args: [maxLength],
        desc: 'Error Text for required field',
      );

  String get emailErrorText => Intl.message(
        'This field requires a valid email address.',
        name: 'emailErrorText',
        desc: 'Error Text for email validator',
      );

  String get urlErrorText => Intl.message(
        'This field requires a valid URL address.',
        name: 'urlErrorText',
        desc: 'Error Text for URL validator',
      );

  String get matchErrorText => Intl.message(
        'Value does not match pattern.',
        name: 'matchErrorText',
        desc: 'Error Text for pattern validator',
      );

  String get numericErrorText => Intl.message(
        'Value must be numeric.',
        name: 'numericErrorText',
        desc: 'Error Text for numeric validator',
      );

  String get integerErrorText => Intl.message(
        'Value must be an integer.',
        name: 'integerErrorText',
        desc: 'Error Text for integer validator',
      );

  String get creditCardErrorText => Intl.message(
        'This field requires a valid credit card number.',
        name: 'creditCardErrorText',
        desc: 'Error Text for credit card validator',
      );

  String get ipErrorText => Intl.message(
        'This field requires a valid IP.',
        name: 'ipErrorText',
        desc: 'Error Text for IP address validator',
      );

  String get dateStringErrorText => Intl.message(
        'This field requires a valid date string.',
        name: 'dateStringErrorText',
        desc: 'Error Text for date string validator',
      );

  String get emptyUsernameErrorText => Intl.message(
        'Username cannot be empty.',
        name: 'emptyUsernameErrorText',
        desc: 'Empty Username validation text',
      );

  String get emptyPasswordErrorText => Intl.message(
        'Password cannot be empty.',
        name: 'emptyPasswordErrorText',
        desc: 'Empty password validation text',
      );

  String get passwordLengthErrorText => Intl.message(
        'Password should be greater than 6 characters in length.',
        name: 'passwordLengthErrorText',
        desc: 'Password length validation text',
      );

  String get emptyFirstNameErrorText => Intl.message(
        'FirstName cannot be empty.',
        name: 'emptyFirstNameErrorText',
        desc: 'Empty first name validation text',
      );

  String get emptyMiddleNameErrorText => Intl.message(
        'Middle Name cannot be empty.',
        name: 'emptyMiddleNameErrorText',
        desc: 'Empty middle name validation text',
      );

  String get emptyLastNameErrorText => Intl.message(
        'LastName cannot be empty.',
        name: 'emptyLastNameErrorText',
        desc: 'Empty last name validation text',
      );

  String get emptyPhoneNumberErrorText => Intl.message(
        'Phone number cannot be empty.',
        name: 'emptyPhoneNumberErrorText',
        desc: 'Empty phone number validation text',
      );

  String get emptyEmailErrorText => Intl.message(
        'Email cannot be empty.',
        name: 'emptyEmailErrorText',
        desc: 'Empty email validation text',
      );

  String get emailValidationErrorText => Intl.message(
        'Email is not proper.',
        name: 'emailValidationErrorText',
        desc: 'Email validation text',
      );

  String get emptyConfirmPasswordErrorText => Intl.message(
        'Confirm password cannot be empty.',
        name: 'emptyConfirmPasswordErrorText',
        desc: 'Empty confirm password validation text',
      );

  String get confirmPasswordValidationErrorText => Intl.message(
        'Passwords don\'t match.',
        name: 'confirmPasswordValidationErrorText',
        desc: 'Confirm password validation text',
      );

  String get emptyCountryErrorText => Intl.message(
        'Country cannot be empty.',
        name: 'emptyCountryErrorText',
        desc: 'Empty country validation text',
      );

  String get emptyZipErrorText => Intl.message(
        'Zip Code cannot be empty.',
        name: 'emptyZipErrorText',
        desc: 'Empty zip code validation text',
      );

  String get emptyAddressErrorText => Intl.message(
        'Address cannot be empty.',
        name: 'emptyAddressErrorText',
        desc: 'Empty address validation text',
      );

  String get emptyCityErrorText => Intl.message(
        'City cannot be empty.',
        name: 'emptyCityErrorText',
        desc: 'Empty city validation text',
      );

  String get emptyTaxIdErrorText => Intl.message(
        'Tax ID cannot be empty.',
        name: 'emptyTaxIdErrorText',
        desc: 'Empty tax id validation text',
      );

  String get countryCodeErrorText => Intl.message(
        'Please select country code.',
        name: 'countryCodeErrorText',
        desc: 'Country code selection validation text',
      );

  String get countryErrorText => Intl.message(
        'Please select country.',
        name: 'countryErrorText',
        desc: 'Country selection validation text',
      );

  String get stateErrorText => Intl.message(
        'Please select state.',
        name: 'stateErrorText',
        desc: 'State selection validation text',
      );

  String get timezoneErrorText => Intl.message(
        'Please select proper timezone.',
        name: 'timezoneErrorText',
        desc: 'Timezone selection validation text',
      );

  String get startDateErrorText => Intl.message(
        'Start date cannot be empty',
        name: 'startDateErrorText',
        desc: 'Start date validation text',
      );

  String get endDateErrorText => Intl.message(
        'End date cannot be empty',
        name: 'endDateErrorText',
        desc: 'End date validation text',
      );

  String get addAllDetailsErrorText => Intl.message(
    'Please add all data first',
    name: 'addAllDetailsErrorText',
    desc: 'Please add all data first text',
  );

  ///

  /// Sign in page strings
  String get seeYouBackText => Intl.message(
    'Good to see you back',
    name: 'seeYouBackText',
    desc: 'Good to see you back text',
  );

  String get signInTitleText => Intl.message(
        'Please sign in to your account',
        name: 'signInTitleText',
        desc: 'This is the title for sign in page',
      );

  String get userNameHintText => Intl.message(
        'Email',
        name: 'userNameHintText',
        desc: 'Text for the sign in page username hint',
      );

  String get passwordHintText => Intl.message(
        'Password',
        name: 'passwordHintText',
        desc: 'Text for the sign in page password hint',
      );

  String get continueBtnText => Intl.message(
        'Continue',
        name: 'continueBtnText',
        desc: 'Text for the sign in page continue button',
      );

  String get noAccountText => Intl.message(
        'Don\'t have the account yet?',
        name: 'noAccountText',
        desc: 'Message for the user if user does not have any account',
      );

  String get signUpText => Intl.message(
        'Sign Up',
        name: 'signUpText',
        desc: 'Sign up Text',
      );

  String get rememberMeText => Intl.message(
        'Remember me',
        name: 'rememberMeText',
        desc: 'Remember me Text',
      );

  String get noUserText => Intl.message(
        'User not found',
        name: 'noUserText',
        desc: 'No user Text',
      );

  String get forgetPasswordText => Intl.message(
    'Forgot password?',
    name: 'forgetPasswordText',
    desc: 'Forget password Text',
  );

  String get orConnectUsingText => Intl.message(
    'Or connect using',
    name: 'orConnectUsingText',
    desc: 'Or connect using Text',
  );
  ///

  /// Verify identity page strings
  String get didNotReceivedCodeText => Intl.message(
    'Didn\'t received a code yet?',
    name: 'didNotReceivedCodeText',
    desc: 'Did not received code text',
  );

  String get resendCodeText => Intl.message(
    'Resend code',
    name: 'resendCodeText',
    desc: 'Resend code text',
  );

  String get resendInText => Intl.message(
    'Resend in',
    name: 'resendInText',
    desc: 'Resend in text',
  );

  String get enterCodeText => Intl.message(
    'Enter Code',
    name: 'enterCodeText',
    desc: 'Enter Code text',
  );

  String get enterCodeErrorText => Intl.message(
    'Please enter code',
    name: 'enterCodeErrorText',
    desc: 'Please enter code text',
  );

  String get codeSentText => Intl.message(
    'We sent a code to your phone number and email',
    name: 'codeSentText',
    desc: 'We sent a code to your phone number and email text',
  );

  String get verifyIdentityText => Intl.message(
    'Please verify your identity',
    name: 'verifyIdentityText',
    desc: 'Please verify your identity text',
  );

  String get sendCodeErrorText => Intl.message(
    'Could not send code, please try again later.',
    name: 'sendCodeErrorText',
    desc: 'Send code error text',
  );

  String get verifyUserErrorText => Intl.message(
    'Unable to verify the user, please try again later.',
    name: 'verifyUserErrorText',
    desc: 'Verify user text',
  );

  ///

  /// Forget password page strings
  String get restorePasswordText => Intl.message(
    'No worries, we will help you restore it.',
    name: 'restorePasswordText',
    desc: 'Restore password text',
  );

  String get emailPhoneText => Intl.message(
    'Email or Phone number',
    name: 'emailPhoneText',
    desc: 'Email or phone text',
  );

  String get emailPhoneErrorText => Intl.message(
    'Please enter email or phone number',
    name: 'emailPhoneErrorText',
    desc: 'Email or phone error text',
  );

  String get neverMindText => Intl.message(
    'Nevermind! ',
    name: 'neverMindText',
    desc: 'Nevermind text',
  );

  String get goBackText => Intl.message(
    'Go back',
    name: 'goBackText',
    desc: 'Go back text',
  );

  ///

  /// Reset password page String
  String get changePasswordText => Intl.message(
    'Change your password',
    name: 'changePasswordText',
    desc: 'Change your password text',
  );

  String get enterNewPasswordText => Intl.message(
    'Please enter new password',
    name: 'enterNewPasswordText',
    desc: 'Please enter new password text',
  );

  String get saveBtnText => Intl.message(
    'Save and login',
    name: 'saveBtnText',
    desc: 'Save and login text',
  );

  String get resetLinkErrorText => Intl.message(
    'Cannot send the reset link, please try again later.',
    name: 'resetLinkErrorText',
    desc: 'cannot send reset link error text',
  );

  String get clickOnLinkText => Intl.message(
    'Please click on the link sent on your registered email.',
    name: 'clickOnLinkText',
    desc: 'Click link text',
  );

  String get resetPasswordErrorText => Intl.message(
    'Cannot send the reset link, please try again later.',
    name: 'clickOnLinkText',
    desc: 'Reset password error text',
  );

  String get cannotResetErrorText => Intl.message(
    'Cannot reset the password, please try again later.',
    name: 'cannotResetErrorText',
    desc: 'Cannot Reset password error text',
  );

  String get passwordResetSuccessText => Intl.message(
    'Your password is reset, please login again.',
    name: 'passwordResetErrorText',
    desc: 'Password is reset text',
  );

  ///

  /// Sign up page Strings
  String get signUpTitleText => Intl.message(
        'Create your Account',
        name: 'signUpTitleText',
        desc: 'Title text in sign up page',
      );

  String get firstNameHintText => Intl.message(
        'First Name',
        name: 'firstNameHintText',
        desc: 'Text for the sign in page first name hint',
      );

  String get middleNameHintText => Intl.message(
        'Middle Name',
        name: 'middleNameHintText',
        desc: 'Text for the sign in page middle name hint',
      );

  String get lastNameHintText => Intl.message(
        'Last Name',
        name: 'lastNameHintText',
        desc: 'Text for the sign in page last name hint',
      );

  String get phoneNumberHintText => Intl.message(
        'Phone Number',
        name: 'phoneNumberHintText',
        desc: 'Text for the sign in page phone number hint',
      );

  String get emailHintText => Intl.message(
        'Email',
        name: 'emailHintText',
        desc: 'Text for the sign in page first name hint',
      );

  String get confirmPasswordHintText => Intl.message(
        'Confirm Password',
        name: 'confirmPasswordHintText',
        desc: 'Text for the sign in page confirm password hint',
      );

  String get promoCodeHintText => Intl.message(
        'Promotion Code(optional)',
        name: 'promoCodeHintText',
        desc: 'Text for the sign in page promo code hint',
      );

  String get alreadyAccountText => Intl.message(
        'Already have an account?',
        name: 'alreadyAccountText',
        desc: 'Message for the user if user already have any account',
      );

  String get signInText => Intl.message(
        'Sign In',
        name: 'signInText',
        desc: 'Sign in Text',
      );

  String get enterFullNameText => Intl.message(
        'Please enter your full name',
        name: 'enterFullNameText',
        desc: 'Enter full name Text',
      );

  String get enterEmailText => Intl.message(
        'Please enter email',
        name: 'enterEmailText',
        desc: 'Enter email Text',
      );

  String get confirmEmailText => Intl.message(
        'Confirm Email',
        name: 'confirmEmailText',
        desc: 'Confirm Email Text',
      );

  String get validateEmailsText => Intl.message(
        'Emails do not match.',
        name: 'validateEmailsText',
        desc: 'Emails do not match Text',
      );

  String get validateEmailDisplayText => Intl.message(
        'Please check your email to validate your email',
        name: 'validateEmailDisplayText',
        desc: 'Validate email display Text',
      );

  String get validateCodeText => Intl.message(
        'Email Validation Code',
        name: 'validateCodeText',
        desc: 'Validate code Text',
      );

  String get emptyValidationCodeErrorText => Intl.message(
        'Email validation code cannot be empty.',
        name: 'emptyValidationCodeErrorText',
        desc: 'Empty email validation code text',
      );

  String get phoneNumberDisplayText => Intl.message(
        'Please enter your phone number',
        name: 'phoneNumberDisplayText',
        desc: 'Enter phone number text',
      );

  String get phoneNumberValidationDisplayText => Intl.message(
        'Please enter your phone validation code',
        name: 'phoneNumberValidationDisplayText',
        desc: 'Enter phone number validation text',
      );

  String get phoneNumberValidationCodeText => Intl.message(
        'Phone validation code',
        name: 'phoneNumberValidationCodeText',
        desc: 'Enter phone number validation code text',
      );

  String get emptyPhoneValidationCodeErrorText => Intl.message(
        'Phone validation code cannot be empty.',
        name: 'emptyPhoneValidationCodeErrorText',
        desc: 'Empty phone validation code text',
      );

  String get userNameText => Intl.message(
        'Username',
        name: 'userNameText',
        desc: 'Text for the sign up page username hint',
      );

  String get userDetailsText => Intl.message(
        'Please enter user details',
        name: 'userDetailsText',
        desc: 'User details text',
      );

  String get translatorQuestionText => Intl.message(
        'Are you looking to work as a translator?',
        name: 'translatorQuestionText',
        desc: 'Translator Question text',
      );

  String get hireQuestionText => Intl.message(
        'Are you looking to hire a translator?',
        name: 'hireQuestionText',
        desc: 'Hire Question text',
      );

  String get yesText => Intl.message(
        'YES',
        name: 'yesText',
        desc: 'Yes text',
      );

  String get noText => Intl.message(
        'NO',
        name: 'noText',
        desc: 'No text',
      );

  String get selectValueText => Intl.message(
        'Please select the value',
        name: 'selectValueText',
        desc: 'Select Value text',
      );

  String get promoCodeDisplayText => Intl.message(
        'Please enter promotional code',
        name: 'promoCodeDisplayText',
        desc: 'Promo code display text',
      );

  String get enterProperCodeText => Intl.message(
        'Please enter proper code.',
        name: 'enterProperCodeText',
        desc: 'Enter proper code text',
      );

  String get userCreated => Intl.message(
        'User created successfully.',
        name: 'userCreated',
        desc: 'user created text',
      );

  String get createAccountText => Intl.message(
    'Create an account',
    name: 'createAccountText',
    desc: 'Create an account text',
  );

  String get createAccountRequestText => Intl.message(
    'Please create an account',
    name: 'createAccountRequestText',
    desc: 'Create an account text',
  );

  String get iAgreeText => Intl.message(
    'I agree with the ',
    name: 'iAgreeText',
    desc: 'I Agree text',
  );

  String get termsAndServicesText => Intl.message(
    'Terms of Service',
    name: 'termsAndServicesText',
    desc: 'Terms and services text',
  );

  String get andText => Intl.message(
    ' and ',
    name: 'andText',
    desc: 'And text',
  );

  String get privacyPolicyText => Intl.message(
    'Privacy Policy.',
    name: 'privacyPolicyText',
    desc: 'Privacy policy text',
  );

  String get signInNowText => Intl.message(
    'Sign in now',
    name: 'signInNowText',
    desc: 'Sign in now text',
  );

  String get checkTermsText => Intl.message(
    'Please check the terms and conditions.',
    name: 'checkTermsText',
    desc: 'Please check the terms and conditions text',
  );

  String get welcomeText => Intl.message(
    'Welcome to demo!',
    name: 'welcomeText',
    desc: 'Welcome to demo text',
  );

  String get emailConfirmText => Intl.message(
    'Please confirm your email',
    name: 'emailConfirmText',
    desc: 'Confirm email text',
  );

  String get emailSentText => Intl.message(
    'Email sent successfully.',
    name: 'emailSentText',
    desc: 'Email sent successfully text',
  );

  String get phoneConfirmText => Intl.message(
    'Please enter your phone number',
    name: 'phoneConfirmText',
    desc: 'Please enter your phone number text',
  );

  String get verifyPhoneSecurityText => Intl.message(
    'To increase your safety, we sent a code to your phone number :',
    name: 'verifyPhoneSecurityText',
    desc: 'To increase your safety, we sent a code to your phone number text',
  );

  String get translatorText => Intl.message(
    'Translator',
    name: 'translatorText',
    desc: 'Translator text',
  );

  String get hireText => Intl.message(
    'Hire',
    name: 'hireText',
    desc: 'Hire text',
  );

  String get chooseRoleText => Intl.message(
    'Please, choose your role',
    name: 'chooseRoleText',
    desc: 'Please, choose your role text',
  );

  String get finishText => Intl.message(
    'Finish',
    name: 'finishText',
    desc: 'Finish text',
  );

  String get createAccountErrorText => Intl.message(
    'Error sending the email verification code.',
    name: 'createAccountErrorText',
    desc: 'Error sending the email verification code text',
  );

  String get enterCorrectCodeErrorText => Intl.message(
    'Please enter the correct code',
    name: 'enterCorrectCodeErrorText',
    desc: 'Please enter the correct code text',
  );

  String get checkNumberErrorText => Intl.message(
    'Error in checking phone number',
    name: 'checkNumberErrorText',
    desc: 'Error in checking phone number text',
  );

  String get verifyNumberErrorText => Intl.message(
    'Error in verifying phone number',
    name: 'verifyNumberErrorText',
    desc: 'Error in verifying phone number text',
  );

  String get completeProfileErrorText => Intl.message(
    'Error in fetching complete profile',
    name: 'completeProfileErrorText',
    desc: 'Error in fetching complete profile text',
  );

  ///

  /// Welcome screen strings
  String get goNextText => Intl.message(
    'Go next',
    name: 'goNextText',
    desc: 'Go next text',
  );

  String get collectInfoText => Intl.message(
    'We collect information so you can become a pro translator. Please answer all questions before you’ll start working, this is very important for us!',
    name: 'collectInfoText',
    desc: 'Collect info text',
  );

  String get needToKnowText => Intl.message(
    'You need to know',
    name: 'needToKnowText',
    desc: 'Need to know text',
  );

  String get needToKnow1Text => Intl.message(
    'We think about your precious time, all information will be automatically add to your profile:',
    name: 'needToKnow1Text',
    desc: 'Need to know one text',
  );

  String get needToKnow2Text => Intl.message(
    'We process your personal data only for predefined and lawful purposes:',
    name: 'needToKnow2Text',
    desc: 'Need to know two text',
  );

  String get needToKnow3Text => Intl.message(
    'We processes personal data necessary to prevent or detect money laundering and terrorist financing, as well as personal data needed to comply with trade sanctions, always in accordance with local law.',
    name: 'needToKnow3Text',
    desc: 'Need to know three text',
  );

  ///

  /// Get started screen
  String get getStartedText => Intl.message(
    'Are you ready to get started?',
    name: 'getStartedText',
    desc: 'Get started text',
  );

  String get getStartedInfoText => Intl.message(
    'To become a verified translator on demo platform, we\'ll walk you through the onboarding process. It only takes a few minutes to get it done. ',
    name: 'getStartedInfoText',
    desc: 'Get started info text',
  );

  String get onBoardingText => Intl.message(
    'Start onboarding',
    name: 'onBoardingText',
    desc: 'Start onboarding text',
  );

  ///

  /// Welcome back screen
  String get welcomeBackText => Intl.message(
    'Welcome back,',
    name: 'welcomeBackText',
    desc: 'Welcome back text',
  );

  String get welcomeBackInfoText => Intl.message(
    'Would you like to continue where you left off?',
    name: 'welcomeBackInfoText',
    desc: 'Welcome back info text',
  );

  ///

  /// On boarding address page strings
  String get addressServicesText => Intl.message(
    'Address & Service',
    name: 'addressServicesText',
    desc: 'Address and services text',
  );

  String get yourAddressText => Intl.message(
    'What is your address?',
    name: 'yourAddressText',
    desc: 'What is your address text',
  );

  String get yourTranslationText => Intl.message(
    'What kind of translation will you do?',
    name: 'yourTranslationText',
    desc: 'What kind of translation will you do text',
  );

  String get yourRatesText => Intl.message(
    'What are your rates?',
    name: 'yourRatesText',
    desc: 'What are your rates text',
  );

  String get hourlyRateText => Intl.message(
    'Hourly Rate',
    name: 'hourlyRateText',
    desc: 'Hourly Rate text',
  );

  String get hourlyRateErrorText => Intl.message(
    'Hourly Rate cannot be empty.',
    name: 'hourlyRateErrorText',
    desc: 'Hourly Rate cannot be empty text',
  );

  String get ratePerPageText => Intl.message(
    'Rate per Page',
    name: 'ratePerPageText',
    desc: 'Rate per Page text',
  );

  String get ratePerPageErrorText => Intl.message(
    "Rate per Page cannot be empty.",
    name: 'ratePerPageErrorText',
    desc: 'Rate per Page error text',
  );

  String get gasText => Intl.message(
    "Gas rate per mile/km",
    name: 'gasText',
    desc: 'Gas text',
  );

  String get gasErrorText => Intl.message(
    "Gas rate per mile/km cannot be empty.",
    name: 'gasErrorText',
    desc: 'Gas error text',
  );

  String get nextStepText => Intl.message(
    "Next step",
    name: 'nextStepText',
    desc: 'Next step text',
  );

  String get streetAddressErrorText => Intl.message(
    "Street address is mandatory.",
    name: 'streetAddressErrorText',
    desc: 'Street address is mandatory text',
  );

  String get loginFirstText => Intl.message(
    "Please login first",
    name: 'loginFirstText',
    desc: 'Please login first text',
  );

  String get onBoardingErrorText => Intl.message(
    "Unable to load on boarding data",
    name: 'onBoardingErrorText',
    desc: 'Unable to load on boarding data text',
  );

  String get jobServicesErrorText => Intl.message(
    "Unable to load job services",
    name: 'jobServicesErrorText',
    desc: 'Unable to load job services text',
  );

  String get addUpdateAddressErrorText => Intl.message(
    "Unable to add/update the on boarding address and services",
    name: 'addUpdateAddressErrorText',
    desc: 'Add update address error text',
  );

  ///

  /// On boarding language page strings
  String get languagesText => Intl.message(
      'Languages',
      name: 'languagesText',
      desc: 'Languages text'
  );

  String get languagesPossessText => Intl.message(
      'What languages do you possess?',
      name: 'languagesPossessText',
      desc: 'Languages possess text'
  );

  String get selectLanguageText => Intl.message(
      'Select a language and indicate the area of specialization and level of proficiency you have.',
      name: 'selectLanguageText',
      desc: 'Select Languages text'
  );

   String get levelProficiencyText => Intl.message(
      'Level of Proficiency',
      name: 'levelProficiencyText',
      desc: 'Level of Proficiency text'
  );

   String get levelSpecializationText => Intl.message(
      'Language Specialization',
      name: 'levelSpecializationText',
      desc: 'Language Specialization text'
  );

   String get selectedText => Intl.message(
      'Selected',
      name: 'selectedText',
      desc: 'Selected text'
  );

   String get languageErrorText => Intl.message(
      'Please select a language.',
      name: 'languageErrorText',
      desc: 'Language error text'
  );

   String get proficiencyErrorText => Intl.message(
      'Please select a proficiency.',
      name: 'proficiencyErrorText',
      desc: 'Proficiency error text'
  );

   String get specializationErrorText => Intl.message(
      'Please select at least one specialization.',
      name: 'specializationErrorText',
      desc: 'Specialization error text'
  );

   String get clickLanguageText => Intl.message(
      'Click "Add language" if you know more languages',
      name: 'clickLanguageText',
      desc: 'click language text'
  );

  String get addLanguageText => Intl.message(
    'Add Language',
    name: 'addLanguageText',
    desc: 'Add Language text',
  );

  String get languageEssentialsErrorText => Intl.message(
    'Error getting the language essentials',
    name: 'languageEssentialsErrorText',
    desc: 'Language essentials error text',
  );

  String get languageAddErrorText => Intl.message(
    'Error adding the language',
    name: 'languageAddErrorText',
    desc: 'Language add error text',
  );

   String get languageDeleteErrorText => Intl.message(
    'Error deleting the language',
    name: 'languageDeleteErrorText',
    desc: 'Language delete error text',
  );

  ///

  /// On boarding education page strings
  String get educationTellText => Intl.message(
      'Tell as about your education',
      name: 'educationTellText',
      desc: 'education tell as about'
  );

  String get schoolText => Intl.message(
    'School',
    name: 'schoolText',
    desc: 'School text',
  );

  String get schoolErrorText => Intl.message(
    'Please enter school',
    name: 'schoolErrorText',
    desc: 'Please enter school text',
  );

  String get degreeText => Intl.message(
    'Degree',
    name: 'degreeText',
    desc: 'Degree text',
  );

  String get degreeErrorText => Intl.message(
    'Please enter degree',
    name: 'degreeErrorText',
    desc: 'Please enter degree text',
  );

  String get fieldOfStudyText => Intl.message(
    'Field of Study',
    name: 'fieldOfStudyText',
    desc: 'Field of Study text',
  );

  String get fieldOfStudyErrorText => Intl.message(
    'Please enter Field of study',
    name: 'fieldOfStudyErrorText',
    desc: 'Please enter field of Study text',
  );

  String get gradeText => Intl.message(
    'Grade',
    name: 'gradeTextText',
    desc: 'Grade text',
  );

  String get gradeErrorText => Intl.message(
    'Please enter grade',
    name: 'gradeErrorText',
    desc: 'Please enter grade text',
  );

  String get activitiesText => Intl.message(
    'Activities',
    name: 'activitiesText',
    desc: 'Activities text',
  );

  String get activitiesErrorText => Intl.message(
    'Please enter Activities',
    name: 'activitiesErrorText',
    desc: 'Please enter Activities text',
  );

  String get descriptionText => Intl.message(
    'Description',
    name: 'descriptionText',
    desc: 'Description Text',
  );

  String get descriptionErrorText => Intl.message(
    'Please enter description',
    name: 'descriptionErrorText',
    desc: 'Please enter description Text',
  );

  String get applyText => Intl.message(
      'Apply',
      name: 'applyText',
      desc: 'applyText'
  );

  String get startDateYearText => Intl.message(
      'Start month and year',
      name: 'startDateYearText',
      desc:'Start month and year text'
  );

  String get endDateYearText => Intl.message(
      'End month and year',
      name: 'endDateYearText',
      desc:'End month and year text'
  );

  String get studyHereText => Intl.message(
      'I study here now',
      name:  'studyHereText',
      desc: 'I study here now Text'
  );

  String get activitiesAndSocietiesText => Intl.message(
      'Activities and societies',
      name:  'activitiesAndSocietiesText',
      desc: 'ActivitiesAndSocietiesText Text'
  );

  String get attachmentsText => Intl.message(
      'Attachments',
      name:  'attachmentsText',
      desc: 'Attachments Text'
  );

  String get addDocumentText => Intl.message(
      'Add new document',
      name:  'addDocumentText',
      desc: 'Add new document Text'
  );

  String get titleDescriptionText => Intl.message(
      'Title and description',
      name:  'titleDescriptionText',
      desc: 'Title and description Text'
  );

  String get selectDocumentText => Intl.message(
      'Please select the document.',
      name:  'selectDocumentText',
      desc: 'Please select the document Text'
  );

  String get addEducationText => Intl.message(
    'Add Education',
    name: 'addEducationText',
    desc: 'Add Education text',
  );

  String get addEducationErrorText => Intl.message(
    'Error adding the education',
    name: 'addEducationErrorText',
    desc: 'Add Education error text',
  );

  String get deleteEducationErrorText => Intl.message(
    'Error deleting the education',
    name: 'deleteEducationErrorText',
    desc: 'Delete Education error text',
  );

  ///

  ///On Boarding Experience page strings
  String get experienceText => Intl.message(
    'Experience',
    name: 'experienceText',
    desc: 'Experience Text',
  );

  String get addExperienceText => Intl.message(
    'Add Experience',
    name: 'addExperienceText',
    desc: 'Add Experience text',
  );

  String get experienceTellText => Intl.message(
    'Tell us about your experience',
    name: 'experienceTellText',
    desc: 'Experience Tell text',
  );

  String get fromDateText => Intl.message(
      'From Date',
      name: 'fromDateText',
      desc: 'From Date text'
  );

  String get workHereText => Intl.message(
      'I work here now',
      name: 'workHereText',
      desc: 'I work here now text'
  );

  String get positionText => Intl.message(
      'Position',
      name: 'positionText',
      desc: 'Position text'
  );

  String get positionErrorText => Intl.message(
      'Please enter Position.',
      name: 'positionErrorText',
      desc: 'Position error text'
  );

  String get companyTitleText => Intl.message(
    'Company',
    name: 'companyTitleText',
    desc: 'Company Title text in profile page',
  );

  String get companyTitleErrorText => Intl.message(
    "Please enter company name.",
    name: 'companyTitleErrorText',
    desc: 'Company Title error text',
  );

  String get employmentTypeText => Intl.message(
    'Employment Type',
    name: 'employmentTypeText',
    desc: 'Employment Type text',
  );

  String get employmentTypeErrorText => Intl.message(
    'Please select employment type',
    name: 'employmentTypeErrorText',
    desc: 'Employment Type error text',
  );

  String get locationText => Intl.message(
    'Location',
    name: 'locationText',
    desc: 'Location Text',
  );

  String get locationErrorText => Intl.message(
    'Please enter location.',
    name: 'companyNameErrorText',
    desc: 'Location error text',
  );

  String get employerPhoneText => Intl.message(
      'Employer phone',
      name: 'employerPhoneText',
      desc: 'Employer phone text'
  );

  String get employerPhoneErrorText => Intl.message(
      'Please Enter Employer phone',
      name: 'employerPhoneErrorText',
      desc: 'Employer phone error text'
  );

  String get employerEmailText => Intl.message(
      'Employer Email',
      name: 'employerEmailText',
      desc: 'Employer Email text'
  );

  String get employerEmailErrorText => Intl.message(
      'Please Enter Employer email',
      name: 'employerEmailErrorText',
      desc: 'Employer Email error text'
  );

  String get contactEmployerText => Intl.message(
      'Can we contact the employer?',
      name: 'contactEmployerText',
      desc: 'Can we contact the employer? text'
  );

  String get uploadDocumentText => Intl.message(
      'You can upload recommendation or your resume here',
      name: 'uploadDocumentText',
      desc: 'You can upload recommendation or your resume here text'
  );

  String get employmentErrorText => Intl.message(
    'Error fetching translate employment.',
    name: 'employmentTypeErrorText',
    desc: 'Employment type error text',
  );

  String get addExperienceErrorText => Intl.message(
    'Error adding the experience',
    name: 'addExperienceErrorText',
    desc: 'Add experience error text',
  );

  String get deleteExperienceErrorText => Intl.message(
    'Error deleting the experience',
    name: 'deleteExperienceErrorText',
    desc: 'Delete experience error text',
  );

  ///

  /// Profile page strings
  String get profileTitleText => Intl.message(
        'Profile',
        name: 'profileTitleText',
        desc: 'Title text in profile page',
      );

  String get accountTitleText => Intl.message(
        'Account',
        name: 'accountTitleText',
        desc: 'Account Title text in profile page',
      );

  String get contactTitleText => Intl.message(
        'Contact',
        name: 'contactTitleText',
        desc: 'Contact Title text in profile page',
      );

  String get cancelText => Intl.message(
        'Cancel',
        name: 'cancelText',
        desc: 'Cancel button text in profile page',
      );

  String get saveText => Intl.message(
        'Save',
        name: 'saveText',
        desc: 'Save button text in profile page',
      );

  String get companyNameText => Intl.message(
        'Company Name',
        name: 'companyNameText',
        desc: 'Company Name Text',
      );

  String get companyWebUrlText => Intl.message(
        'Company Web Url',
        name: 'companyWebUrlText',
        desc: 'Company Web Url Text',
      );

  String get companyTagLineText => Intl.message(
        'Company Tagline',
        name: 'companyTagLineText',
        desc: 'Company Tagline Text',
      );

  String get companyDescriptionText => Intl.message(
        'Company Description',
        name: 'companyDescriptionText',
        desc: 'Company Description Text',
      );

  String get ownerText => Intl.message(
        'Owner',
        name: 'ownerText',
        desc: 'Owner Text',
      );

  String get phoneText => Intl.message(
        'Phone',
        name: 'phoneText',
        desc: 'Phone Text',
      );

  String get addressText => Intl.message(
        'Address',
        name: 'addressText',
        desc: 'Address Text',
      );

  String get timeZoneText => Intl.message(
        'Time Zone',
        name: 'timeZoneText',
        desc: 'Timezone Text',
      );

  String get taxIdText => Intl.message(
        'Tax ID',
        name: 'taxIdText',
        desc: 'Tax ID Text',
      );

  String get zipText => Intl.message(
        'Zip',
        name: 'zipText',
        desc: 'Zip Text',
      );

  String get address2Text => Intl.message(
        'Address Line 2',
        name: 'address2Text',
        desc: 'Address Line 2 Text',
      );

  String get cityText => Intl.message(
        'City',
        name: 'cityText',
        desc: 'City Text',
      );

  String get selectTypeText => Intl.message(
        'Select Type',
        name: 'selectTypeText',
        desc: 'Select Type Text',
      );

  String get cameraText => Intl.message(
        'CAMERA',
        name: 'cameraText',
        desc: 'Camera Text',
      );

  String get galleryText => Intl.message(
        'GALLERY',
        name: 'galleryText',
        desc: 'Gallery Text',
      );

  String get dataLoadText => Intl.message(
        'Cannot load data, please try again after login.',
        name: 'dataLoadText',
        desc: 'Data Load Text',
      );

  String get addressLoadText => Intl.message(
        'No user contact details found',
        name: 'addressLoadText',
        desc: 'Address Load Text',
      );

  String get imageSetText => Intl.message(
        'Image not set',
        name: 'imageSetText',
        desc: 'Image set Text',
      );

  String get addCompanyText => Intl.message(
        'Add Company Data',
        name: 'addCompanyText',
        desc: 'Add Company Text',
      );

  String get companyDataNoText => Intl.message(
        'Company data not found',
        name: 'companyDataNoText',
        desc: 'Company data not found Text',
      );

  String get addContactText => Intl.message(
        'Add Contact Data',
        name: 'addContactText',
        desc: 'Add Contact Text',
      );

  ///

  /// Payment
  String get paymentTitleText => Intl.message(
        'Billing & Payments',
        name: 'paymentTitleText',
        desc: 'Payments Title Text',
      );

  String get balanceDueText => Intl.message(
        'Balance Due',
        name: 'balanceDueText',
        desc: 'Balance due Text',
      );

  String get paymentMethodsText => Intl.message(
        'Payment Methods',
        name: 'paymentMethodsText',
        desc: 'Payment methods Text',
      );

  String get paymentHistoryText => Intl.message(
        'Payment History',
        name: 'paymentHistoryText',
        desc: 'Payment history Text',
      );

  String get addMethodText => Intl.message(
        'Add Method',
        name: 'addMethodText',
        desc: 'Add method Text',
      );

  String get payNowText => Intl.message(
        'Pay Now',
        name: 'payNowText',
        desc: 'Pay now Text',
      );

  String get nameText => Intl.message(
        'Name',
        name: 'nameText',
        desc: 'Name Text',
      );

  String get amountText => Intl.message(
        'Amount',
        name: 'amountText',
        desc: 'Amount Text',
      );

  String get paidDateText => Intl.message(
        'Paid Date',
        name: 'paidDateText',
        desc: 'Paid date Text',
      );

  String get statusText => Intl.message(
        'Status',
        name: 'statusText',
        desc: 'Status Text',
      );

  String get updateText => Intl.message(
        'Update',
        name: 'updateText',
        desc: 'Update button text',
      );

  String get editText => Intl.message(
        'Edit',
        name: 'editText',
        desc: 'Edit menu text',
      );

  String get deleteText => Intl.message(
        'Delete',
        name: 'deleteText',
        desc: 'Delete menu text',
      );

  String get cardEndingText => Intl.message(
        'Card ending in',
        name: 'cardEndingText',
        desc: 'Card ending in text',
      );

  String get cardHolderText => Intl.message(
        'Card Holder',
        name: 'cardHolderText',
        desc: 'Card Holder text',
      );

  String get cardNumberText => Intl.message(
        'Card Number',
        name: 'cardNumberText',
        desc: 'Card Number text',
      );

  String get cardExpiryText => Intl.message(
        'Card Expiry Date',
        name: 'cardExpiryText',
        desc: 'Card Expiry Date text',
      );

  String get paymentText => Intl.message(
        'Payments',
        name: 'paymentText',
        desc: 'Payments Text',
      );

  String get addAddressText => Intl.message(
        'Add Address',
        name: 'addAddressText',
        desc: 'Add Address Text',
      );

  String get addressLine1Text => Intl.message(
        'Address Line 1',
        name: 'addressLine1Text',
        desc: 'Address Line 1 Text',
      );

  String get addressLine2Text => Intl.message(
        'Address Line 2',
        name: 'addressLine2Text',
        desc: 'Address Line 2 Text',
      );

  String get addNewAddressText => Intl.message(
        'Add New Address',
        name: 'addNewAddressText',
        desc: 'Add New Address Text',
      );

  String get editAddressText => Intl.message(
        'Edit address',
        name: 'editAddressText',
        desc: 'Edit address Text',
      );

  String get updateAddressText => Intl.message(
        'Update Address',
        name: 'updateAddressText',
        desc: 'Update Address Text',
      );

  String get changeAddressText => Intl.message(
    'Please change address',
    name: 'changeAddressText',
    desc: 'Please change address Text',
  );

  String get noPaymentMethodText => Intl.message(
    'No payment methods added',
    name: 'noPaymentMethodText',
    desc: 'No payment methods added Text',
  );

  String get addCardDetailsText => Intl.message(
    'Please add the card details first',
    name: 'addCardDetailsText',
    desc: 'Add Card Details Text',
  );

  String get addCardAddressText => Intl.message(
    'Please add the card address details',
    name: 'addCardAddressText',
    desc: 'Add Card Address Text',
  );

  String get tokenGenerateErrorText => Intl.message(
    'Could not generate the payment token',
    name: 'tokenGenerateErrorText',
    desc: 'Token generate error Text',
  );

  ///

  /// Posted Jobs
  String get postedJobsText => Intl.message(
        'Posted Jobs',
        name: 'postedJobsText',
        desc: 'Posted jobs Text',
      );

  String get searchJobsText => Intl.message(
        'Search Jobs',
        name: 'searchJobsText',
        desc: 'Search jobs Text',
      );

  String get searchText => Intl.message(
        'Search',
        name: 'searchText',
        desc: 'Search Text',
      );

  String get serviceText => Intl.message(
        'Service',
        name: 'serviceText',
        desc: 'Service Text',
      );

  String get serviceTypeText => Intl.message(
        'Service Type',
        name: 'serviceTypeText',
        desc: 'Service Type Text',
      );

  String get jobStatusText => Intl.message(
        'Job Status',
        name: 'jobStatusText',
        desc: 'Job Status Text',
      );

  String get selectServiceText => Intl.message(
        'Select service',
        name: 'selectServiceText',
        desc: 'Select service Text',
      );

  String get selectServiceTypeText => Intl.message(
        'Select service Type',
        name: 'selectServiceTypeText',
        desc: 'Service Type Text',
      );

  String get selectJobStatusText => Intl.message(
        'Select job Status',
        name: 'selectJobStatusText',
        desc: 'Select Job Status Text',
      );

  String get filterText => Intl.message(
        'Filter',
        name: 'filterText',
        desc: 'Filter Text',
      );

  /// Posted Jobs Details
  String get jobsDetailsText => Intl.message(
        'Job Details',
        name: 'jobsDetailsText',
        desc: 'Job Details Text',
      );

  String get titleText => Intl.message(
        'Title',
        name: 'titleText',
        desc: 'Title Text',
      );

  String get languageText => Intl.message(
        'Language',
        name: 'languageText',
        desc: 'Language Text',
      );

  String get sourceLanguageText => Intl.message(
        'Source Language',
        name: 'sourceLanguageText',
        desc: 'Source Language Text',
      );

  String get destinationLanguageText => Intl.message(
        'Destination Language',
        name: 'destinationLanguageText',
        desc: 'Destination Language Text',
      );

  String get specializationsText => Intl.message(
        'Specializations',
        name: 'specializationsText',
        desc: 'Specializations Text',
      );

  String get placeText => Intl.message(
        'Place',
        name: 'placeText',
        desc: 'Place Text',
      );

  String get visibilityText => Intl.message(
        'Visibility',
        name: 'visibilityText',
        desc: 'Visibility Text',
      );

  String get boundaryText => Intl.message(
        'Boundary',
        name: 'boundaryText',
        desc: 'Boundary Text',
      );

  String get specialityText => Intl.message(
        'Speciality',
        name: 'specialityText',
        desc: 'Speciality Text',
      );

  String get proficiencyText => Intl.message(
        'Proficiency',
        name: 'proficiencyText',
        desc: 'Proficiency Text',
      );

  String get ratingsText => Intl.message(
        'Ratings',
        name: 'ratingsText',
        desc: 'Ratings Text',
      );

  String get reviewsText => Intl.message(
        'Reviews',
        name: 'reviewsText',
        desc: 'Reviews Text',
      );

  String get scheduleText => Intl.message(
        'Schedule',
        name: 'scheduleText',
        desc: 'Schedule Text',
      );

  String get fromText => Intl.message(
        'From',
        name: 'fromText',
        desc: 'From Text',
      );

  String get toText => Intl.message(
        'To',
        name: 'toText',
        desc: 'To Text',
      );

  String get filtersText => Intl.message(
        'Filters',
        name: 'filtersText',
        desc: 'Filters Text',
      );

  String get jobTypeText => Intl.message(
        'Job Type',
        name: 'jobTypeText',
        desc: 'Job Type Text',
      );

  /// Payment history
  String get dateValidationErrorText => Intl.message(
        'The start date should not be after end date.',
        name: 'dateValidationErrorText',
        desc: 'Error for the start date should not be after end date.',
      );

  String get searchPaymentText => Intl.message(
        'Search Payment',
        name: 'searchPaymentText',
        desc: 'Search Payment text',
      );

  String get paidOnStartText => Intl.message(
        'Paid On Start Date',
        name: 'paidOnStartText',
        desc: 'Paid On Start Date text',
      );

  String get paidOnEndText => Intl.message(
        'Paid On End Date',
        name: 'paidOnEndText',
        desc: 'Paid On End Date text',
      );

  String get paymentAmountText => Intl.message(
        'Payment Amount',
        name: 'paymentAmountText',
        desc: 'Payment Amount text',
      );

  /// Post a job - Description
  String get backText => Intl.message(
        'BACK',
        name: 'backText',
        desc: 'Back text',
      );

  String get continueText => Intl.message(
        'CONTINUE',
        name: 'continueText',
        desc: 'Continue text',
      );

  String get titleEmptyErrorText => Intl.message(
        'Please enter title',
        name: 'titleEmptyErrorText',
        desc: 'Please enter title text',
      );

  String get descEmptyErrorText => Intl.message(
        'Description is required.',
        name: 'descEmptyErrorText',
        desc: 'Description is required. text',
      );

  String get imagesText => Intl.message(
        'Images(Optional)',
        name: 'imagesText',
        desc: 'Images(Optional) text',
      );

  String get pickImageText => Intl.message(
        '+ Pick Multiple',
        name: 'pickImageText',
        desc: '+ Pick Multiple text',
      );

  String get noImageSelectedText => Intl.message(
        'No Images selected',
        name: 'noImageSelectedText',
        desc: 'No Images selected text',
      );

  String get allPhotosText => Intl.message(
        'All Photos',
        name: 'allPhotosText',
        desc: 'All Photos text',
      );

  String get selectServiceErrorText => Intl.message(
        'Please select service',
        name: 'selectServiceErrorText',
        desc: 'Please select service text',
      );

  String get serviceFetchErrorText => Intl.message(
        'Cannot fetch services',
        name: 'serviceFetchErrorText',
        desc: 'Service fetch text',
      );

  /// Post a job - Language
  String get fromLanguageText => Intl.message(
        'From Languages',
        name: 'fromLanguageText',
        desc: 'From Language text',
      );

  String get emptyFromLangErrorText => Intl.message(
        'Please enter from language',
        name: 'emptyFromLangErrorText',
        desc: 'Please enter from languages text',
      );

  String get toLanguageText => Intl.message(
        'To Language',
        name: 'toLanguageText',
        desc: 'To Language text',
      );

  String get emptyToLangErrorText => Intl.message(
        'Please enter to language',
        name: 'emptyToLangErrorText',
        desc: 'Please enter to language text',
      );

  String get specializationText => Intl.message(
        'Specialization',
        name: 'specializationText',
        desc: 'Specialization text',
      );

  String get selectSpecializationsErrorText => Intl.message(
        'Please select specializations',
        name: 'selectSpecializationsErrorText',
        desc: 'Please select specializations text',
      );

  /// Post a job - visibility
  String get selectCountryText => Intl.message(
        'Select country',
        name: 'selectCountryText',
        desc: 'Select country text',
      );

  String get languageSpecialityText => Intl.message(
        'Language Speciality',
        name: 'languageSpecialityText',
        desc: 'Language Speciality text',
      );

  String get selectLanguageSpecErrorText => Intl.message(
        'Please select language speciality',
        name: 'selectLanguageSpecErrorText',
        desc: 'Please select language speciality text',
      );

  String get selectProficiencyErrorText => Intl.message(
        'Please select proficiency',
        name: 'selectProficiencyErrorText',
        desc: 'Please select proficiency text',
      );

  String get selectExperienceErrorText => Intl.message(
        'Please enter experience',
        name: 'selectExperienceErrorText',
        desc: 'Please enter experience text',
      );

  String get selectRatingsErrorText => Intl.message(
        'Please enter ratings',
        name: 'selectRatingsErrorText',
        desc: 'Please enter ratings text',
      );

  String get selectReviewsErrorText => Intl.message(
        'Please enter reviews',
        name: 'selectReviewsErrorText',
        desc: 'Please enter reviews text',
      );

  String get streetAddressText => Intl.message(
        'Street Address',
        name: 'streetAddressText',
        desc: 'Street Address text',
      );

  String get stateProvinceRegionText => Intl.message(
        'State/Province/Region',
        name: 'selectStateProvinceRegionText',
        desc: 'Please enter state/province/region text',
      );

  String get stateProvinceRegionErrorText => Intl.message(
        'State/Province/Region is required.',
        name: 'stateProvinceRegionErrorText',
        desc: 'State/Province/Region validation text',
      );

  String get postalZipText => Intl.message(
        'Postal/Zip Code',
        name: 'postalZipText',
        desc: 'Please enter Postal/Zip Code text',
      );

  String get postalZipErrorText => Intl.message(
        'Postal/Zip Code is required.',
        name: 'postalZipErrorText',
        desc: 'Postal/Zip Code validation text',
      );

  String get countryText => Intl.message(
        'Country',
        name: 'countryText',
        desc: 'Please enter country text',
      );

  /// Post a job - schedule
  String get startDateTimeText => Intl.message(
        'From DateTime',
        name: 'startDateTimeText',
        desc: 'From DateTime text',
      );

  String get endDateTimeText => Intl.message(
        'To DateTime',
        name: 'endDateTimeText',
        desc: 'To DateTime text',
      );

  String get noScheduleText => Intl.message(
    'No Schedule added',
    name: 'noScheduleText',
    desc: 'No Schedule added text',
  );

  String get noReviewText => Intl.message(
    'No review available',
    name: 'noReviewText',
    desc: 'No review available text',
  );

  String get addScheduleText => Intl.message(
    'Add Schedule',
    name: 'addScheduleText',
    desc: 'Add Schedule text',
  );

  String get startDateText => Intl.message(
    'Start Date : ',
    name: 'startDateText',
    desc: 'Start date text',
  );

  String get endDateText => Intl.message(
    'End Date : ',
    name: 'endDateText',
    desc: 'End date text',
  );

  String get properDateText => Intl.message(
    'Please select the proper dates',
    name: 'properDateText',
    desc: 'Proper date text',
  );

  /// Translator profile
  String get translatorProfileText => Intl.message(
        'Personal Information',
        name: 'translatorProfileText',
        desc: 'Personal Information text',
      );

  /// Translator language
  String get updateLanguageText => Intl.message(
    'Update Language',
    name: 'updateLanguageText',
    desc: 'Update Language text',
  );

  /// Translator experience
  String get updateExperienceText => Intl.message(
        'Update Experience',
        name: 'updateExperienceText',
        desc: 'Update Experience text',
      );

  String get companyNameErrorText => Intl.message(
        'Please enter company name.',
        name: 'companyNameErrorText',
        desc: 'Company name error text',
      );

  String get fromErrorText => Intl.message(
        'Please enter from date.',
        name: 'fromErrorText',
        desc: 'From error text',
      );

  String get toErrorText => Intl.message(
        'Please enter to date.',
        name: 'toErrorText',
        desc: 'To error text',
      );

  String get currentlyWorkingText => Intl.message(
        'Currently working on this Role',
        name: 'currentlyWorkingText',
        desc: 'Currently working text',
      );

  String get presentText => Intl.message(
        'Present',
        name: 'presentText',
        desc: 'Present text',
      );

  String get noExperienceText => Intl.message(
    'No experience added',
    name: 'noExperienceText',
    desc: 'No experience added text',
  );

  /// Translator education
  String get educationText => Intl.message(
        'Education',
        name: 'educationText',
        desc: 'Education text',
      );

  String get updateEducationText => Intl.message(
        'Update Education',
        name: 'updateEducationText',
        desc: 'Update Education text',
      );

  String get noEducationText => Intl.message(
    'No education added',
    name: 'noEducationText',
    desc: 'No education added text',
  );

  /// Translator identification
  String get additionalDisclosures => Intl.message(
        'Additional Disclosures',
        name: 'additionalDisclosures',
        desc: 'Additional Disclosures text',
      );

  String get hideDisclosures => Intl.message(
        'Hide Disclosures',
        name: 'hideDisclosures',
        desc: 'Hide Disclosures text',
      );

  String get requiredText => Intl.message(
        'At least two forms of government picture ID is required.*',
        name: 'requiredText',
        desc: 'Required text',
      );

  String get authText => Intl.message(
        'ACKNOWLEDGMENT AND AUTHORIZATION FOR BACKGROUND CHECK',
        name: 'authText',
        desc: 'Auth text',
      );

  String get agreeText => Intl.message(
        'I agree and acknowledge',
        name: 'agreeText',
        desc: 'Agree text',
      );

  String get uploadText => Intl.message(
        'Upload',
        name: 'uploadText',
        desc: 'Upload text',
      );

  String get uploadTwoText => Intl.message(
        'Upload two forms of pictures ID',
        name: 'uploadTwoText',
        desc: 'Upload Two text',
      );

  String get chooseText => Intl.message(
        'Choose',
        name: 'chooseText',
        desc: 'Choose text',
      );

  /// Translator Jobs
  String get sendMessageText => Intl.message(
        'Send in a Message',
        name: 'sendMessageText',
        desc: 'Send in a Message text',
      );

  String get copyLinkText => Intl.message(
        'Copy Link',
        name: 'copyLinkText',
        desc: 'Copy Link text',
      );

  /// Translator contracts
  String get sendContractMessageText => Intl.message(
        'Send a message',
        name: 'sendContractMessageText',
        desc: 'Send a message text',
      );

  String get proposeText => Intl.message(
        'Propose new contract',
        name: 'proposeText',
        desc: 'Propose new contract text',
      );

  String get searchContractText => Intl.message(
        'Search Contracts',
        name: 'searchContractText',
        desc: 'Search Contracts text',
      );

  /// Translator contracts Details
  String get contractDetailsText => Intl.message(
        'Contract Details',
        name: 'contractDetailsText',
        desc: 'Contract Details text',
      );

  String get byText => Intl.message(
        'By',
        name: 'byText',
        desc: 'By text',
      );

  String get budgetText => Intl.message(
        'Budget',
        name: 'budgetText',
        desc: 'Budget  text',
      );

  String get feedbackText => Intl.message(
        'Feedback',
        name: 'feedbackText',
        desc: 'Feedback  text',
      );

  /// Translator schedule
  String get noEventsText => Intl.message(
        'No events for the day.',
        name: 'noEventsText',
        desc: 'No Events  text',
      );

  /// Translator earnings
  String get commissionText => Intl.message(
        'Commission',
        name: 'commissionText',
        desc: 'Commission  text',
      );

  String get paidOutText => Intl.message(
        'Paid Out',
        name: 'paidOutText',
        desc: 'Paid Out  text',
      );

  String get earningsText => Intl.message(
        'Earnings',
        name: 'earningsText',
        desc: 'Earnings  text',
      );

  String get withdrawalText => Intl.message(
        'Withdrawal',
        name: 'withdrawalText',
        desc: 'Withdrawal  text',
      );

  String get billingMethodsText => Intl.message(
        'Billing Methods',
        name: 'billingMethodsText',
        desc: 'Billing Methods text',
      );

  String get earningsHistoryText => Intl.message(
        'Earnings History',
        name: 'earningsHistoryText',
        desc: 'Earnings History text',
      );

  /// Translator earnings history
  String get transactionDateText => Intl.message(
        'Transaction Date',
        name: 'transactionDateText',
        desc: 'Transaction Date text',
      );

  String get paidOutDateText => Intl.message(
        'Paid out Date',
        name: 'paidOutDateText',
        desc: 'Paid out Date text',
      );

  String get amountPaidText => Intl.message(
        'Amount Paid',
        name: 'amountPaidText',
        desc: 'Amount Paid text',
      );

  String get searchEarningsText => Intl.message(
        'Search Earnings',
        name: 'searchEarningsText',
        desc: 'Search Earnings text',
      );

  String get payToText => Intl.message(
        'Pay To',
        name: 'payToText',
        desc: 'Pay to text',
      );

  String get payToErrorText => Intl.message(
        'Pay to cannot be empty',
        name: 'payToErrorText',
        desc: 'Pay to cannot be empty text',
      );

  String get bankNameText => Intl.message(
        'Bank Name',
        name: 'bankNameText',
        desc: 'Bank name text',
      );

  String get bankNameErrorText => Intl.message(
        'Bank Name cannot be empty',
        name: 'bankNameErrorText',
        desc: 'Bank Name cannot be empty text',
      );

  String get routingNumberText => Intl.message(
        'Routing Number',
        name: 'routingNumberText',
        desc: 'Routing Number text',
      );

  String get routingNumberErrorText => Intl.message(
        'Routing Number cannot be empty',
        name: 'routingNumberErrorText',
        desc: 'Routing Number cannot be empty text',
      );

  String get accountNumberText => Intl.message(
        'Account Number',
        name: 'accountNumberText',
        desc: 'Account Number text',
      );

  String get accountNumberErrorText => Intl.message(
        'Account Number cannot be empty',
        name: 'accountNumberErrorText',
        desc: 'Account Number cannot be empty text',
      );

  String get confirmAccountNumberText => Intl.message(
        'Confirm Account Number',
        name: 'confirmAccountNumberText',
        desc: 'Confirm Account Number text',
      );

  String get confirmAccountNumberErrorText => Intl.message(
        'Confirm Account number cannot be empty',
        name: 'confirmAccountNumberErrorText',
        desc: 'Confirm Account Number cannot be empty text',
      );

  String get accountMatchText => Intl.message(
        'Account number do not match.',
        name: 'accountMatchText',
        desc: 'Account match text',
      );

  /// Translator tax section
  String get taxResidenceText => Intl.message(
        'Tax Residence',
        name: 'taxResidenceText',
        desc: 'Tax Residence text',
      );

  String get displayInvoicesText => Intl.message(
        'This address will be displayed on invoices',
        name: 'displayInvoicesText',
        desc: 'Display Invoices text',
      );

  String get useLocationText => Intl.message(
        'Use my existing location address',
        name: 'useLocationText',
        desc: 'Use Location text',
      );

  String get w9Text => Intl.message(
        'W-9',
        name: 'w9Text',
        desc: 'W-9 text',
      );

  String get w9DisplayText => Intl.message(
        'Before withdrawing funds, all U.S. persons must provide their W-9 tax information.',
        name: 'w9DisplayText',
        desc: 'W9 Display text',
      );

  String get legalNameText => Intl.message(
        'Legal Name of Business',
        name: 'legalNameText',
        desc: 'Legal Name text',
      );

  String get legalNameErrorText => Intl.message(
        'Please enter legal name',
        name: 'legalNameErrorText',
        desc: 'Legal Name Error text',
      );

  String get legalNameDisplayText => Intl.message(
        'Provide the same name as shown on your tax return.',
        name: 'legalNameDisplayText',
        desc: 'Legal Name display text',
      );

  String get taxClassificationText => Intl.message(
        'Federal Tax Classification',
        name: 'taxClassificationText',
        desc: 'Tax Classification text',
      );

  String get taxClassificationErrorText => Intl.message(
        'Please select tax classification',
        name: 'taxClassificationErrorText',
        desc: 'Tax classification Error text',
      );

  String get payerIdentificationText => Intl.message(
        'Tax payer Identification Number type',
        name: 'payerIdentificationText',
        desc: 'Payer Identification Text',
      );

  String get payerIdentificationErrorText => Intl.message(
        'Please select payer identification number type',
        name: 'payerIdentificationErrorText',
        desc: 'Payer Identification error Text',
      );

  String get ssnText => Intl.message(
        'SSN/EIN #',
        name: 'ssnText',
        desc: 'SSN Text',
      );

  String get ssnErrorText => Intl.message(
        'Please enter SSN/EIN #',
        name: 'ssnErrorText',
        desc: 'SSN Error Text',
      );

  String get iCertifyText => Intl.message(
        'I certify, under penalties of perjury, that the representations in this Tax Certificate are true and correct.',
        name: 'iCertifyText',
        desc: 'I certify Text',
      );

  String get taxFormText => Intl.message(
        '1099 - Tax Form',
        name: 'taxFormText',
        desc: 'Tax form Text',
      );

  String get yearText => Intl.message(
        'Year',
        name: 'yearText',
        desc: 'Year Text',
      );

  String get yearErrorText => Intl.message(
        'Please select year',
        name: 'yearErrorText',
        desc: 'Year Error Text',
      );

  String get getCodeText => Intl.message(
        'Get Code',
        name: 'getCodeText',
        desc: 'Get Code Text',
      );

  String get verificationCodeText => Intl.message(
        'Verification Code',
        name: 'verificationCodeText',
        desc: 'Verification code Text',
      );

  String get verificationCodeErrorText => Intl.message(
        'Please enter verification code',
        name: 'verificationCodeErrorText',
        desc: 'Verification code error Text',
      );

  String get downloadText => Intl.message(
        'Download',
        name: 'downloadText',
        desc: 'Download Text',
      );

  /// Request a translator
  String get searchForText => Intl.message(
    'Search for',
    name: 'searchForText',
    desc: 'Search For Text',
  );

  String get translatorsText => Intl.message(
    'Translators',
    name: 'translatorsText',
    desc: 'Translators Text',
  );

  String get messageText => Intl.message(
    'Message',
    name: 'messageText',
    desc: 'Message Text',
  );

  String get callText => Intl.message(
    'Call',
    name: 'callText',
    desc: 'Call Text',
  );

  /// User chat
  String get startNewConversationText => Intl.message(
    'Start a new conversation!',
    name: 'startNewConversationText',
    desc: 'Start a new conversation! Text',
  );

  String get writeMessageText => Intl.message(
    'Write message...',
    name: 'writeMessageText',
    desc: 'Write message Text',
  );

  /// Translator payments
  String get personalDetailsText => Intl.message(
    'Verify Personal Details',
    name: 'personalDetailsText',
    desc: 'Personal Details Text',
  );

  String get ssNumberText => Intl.message(
    'Social Security number (SSN)',
    name: 'ssNumberText',
    desc: 'SSN Text',
  );

  String get ssNNumber => Intl.message(
    'SSN Number',
    name: 'ssNNumber',
    desc: 'SSN Number Text',
  );

  String get ssNError => Intl.message(
    'SSN number cannot be empty',
    name: 'ssNError',
    desc: 'SSN Error Text',
  );

  String get dateOfBirthText => Intl.message(
    'Date of Birth',
    name: 'dateOfBirthText',
    desc: 'DOB Text',
  );

  String get idVerificationText => Intl.message(
    'ID verification for',
    name: 'idVerificationText',
    desc: 'ID Verification Text',
  );

  String get securityText => Intl.message(
    'For additional security, please have this person finish verifying their identity with a government-issued ID.',
    name: 'securityText',
    desc: 'Security Text',
  );

  String get billingAddText => Intl.message(
    'Billing address',
    name: 'billingAddText',
    desc: 'Billing Add Text',
  );

  String get verifyText => Intl.message(
    'Verify',
    name: 'verifyText',
    desc: 'Verify Text',
  );

  String get chooseFileText => Intl.message(
    'Choose File',
    name: 'chooseFileText',
    desc: 'Choose File Text',
  );

  String get selectFileText => Intl.message(
    'Please select the file',
    name: 'selectFileText',
    desc: 'Select File Text',
  );

  String get browseFileText => Intl.message(
    'Browse File',
    name: 'browseFileText',
    desc: 'Browse File Text',
  );

  String get fillDetailsText => Intl.message(
    'Please fill all the details.',
    name: 'fillDetailsText',
    desc: 'Fill Details Text',
  );

  String get dateOfBirthReqText => Intl.message(
    'Date of Birth is required',
    name: 'dateOfBirthReqText',
    desc: 'DOB required Text',
  );
}

class _FormBuilderLocalizationsDelegate extends LocalizationsDelegate<FormBuilderLocalizations> {
  const _FormBuilderLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'es'].contains(locale.languageCode);
  }

  @override
  Future<FormBuilderLocalizations> load(Locale locale) {
    return FormBuilderLocalizations.load(locale);
  }

  @override
  bool shouldReload(_FormBuilderLocalizationsDelegate old) {
    return false;
  }
}
