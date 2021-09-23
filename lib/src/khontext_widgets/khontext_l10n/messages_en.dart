// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static m0(max) => "Value must be less than or equal to ${max}";

  static m1(maxLength) => "Value must have a length less than or equal to ${maxLength}";

  static m2(min) => "Value must be greater than or equal to ${min}.";

  static m3(minLength) => "Value must have a length greater than or equal to ${minLength}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "appNameText" : MessageLookupByLibrary.simpleMessage("demo"),

    // Validations
    "creditCardErrorText" : MessageLookupByLibrary.simpleMessage("This field requires a valid credit card number."),
    "dateStringErrorText" : MessageLookupByLibrary.simpleMessage("This field requires a valid date string."),
    "emailErrorText" : MessageLookupByLibrary.simpleMessage("This field requires a valid email address."),
    "ipErrorText" : MessageLookupByLibrary.simpleMessage("This field requires a valid IP."),
    "matchErrorText" : MessageLookupByLibrary.simpleMessage("Value does not match pattern."),
    "maxErrorText" : m0,
    "maxLengthErrorText" : m1,
    "minErrorText" : m2,
    "minLengthErrorText" : m3,
    "numericErrorText" : MessageLookupByLibrary.simpleMessage("Value must be numeric."),
    "requiredErrorText" : MessageLookupByLibrary.simpleMessage("This field cannot be empty."),
    "urlErrorText" : MessageLookupByLibrary.simpleMessage("This field requires a valid URL address."),

    "emptyUsernameErrorText":MessageLookupByLibrary.simpleMessage("Username cannot be empty."),
    "emptyPasswordErrorText":MessageLookupByLibrary.simpleMessage("Password cannot be empty."),
    "passwordLengthErrorText":MessageLookupByLibrary.simpleMessage("Password should be greater than 6 characters in length."),
    "emptyFirstNameErrorText":MessageLookupByLibrary.simpleMessage("FirstName cannot be empty."),
    "emptyMiddleNameErrorText":MessageLookupByLibrary.simpleMessage("Middle Name cannot be empty."),
    "emptyLastNameErrorText":MessageLookupByLibrary.simpleMessage("LastName cannot be empty."),
    "emptyPhoneNumberErrorText":MessageLookupByLibrary.simpleMessage("Phone number cannot be empty."),
    "emptyEmailErrorText":MessageLookupByLibrary.simpleMessage("Email cannot be empty."),
    "emailValidationErrorText":MessageLookupByLibrary.simpleMessage("Email is not proper."),
    "emptyConfirmPasswordErrorText":MessageLookupByLibrary.simpleMessage("Confirm password cannot be empty."),
    "confirmPasswordValidationErrorText":MessageLookupByLibrary.simpleMessage("Passwords don\'t match."),

    "emptyCountryErrorText":MessageLookupByLibrary.simpleMessage("Country cannot be empty."),
    "emptyZipErrorText":MessageLookupByLibrary.simpleMessage("Zip Code cannot be empty."),
    "emptyAddressErrorText":MessageLookupByLibrary.simpleMessage("Address cannot be empty."),
    "emptyCityErrorText":MessageLookupByLibrary.simpleMessage("City cannot be empty."),
    "emptyTaxIdErrorText":MessageLookupByLibrary.simpleMessage("Tax ID cannot be empty."),
    "countryCodeErrorText":MessageLookupByLibrary.simpleMessage("Please select country code."),
    "countryErrorText":MessageLookupByLibrary.simpleMessage("Please select country."),
    "stateErrorText":MessageLookupByLibrary.simpleMessage("Please select state."),
    "timezoneErrorText":MessageLookupByLibrary.simpleMessage("Please select proper timezone."),
    "dateValidationErrorText":MessageLookupByLibrary.simpleMessage("The start date should not be after end date."),
    "startDateErrorText":MessageLookupByLibrary.simpleMessage("Start date cannot be empty"),
    "endDateErrorText":MessageLookupByLibrary.simpleMessage("End date cannot be empty"),
    "addAllDetailsErrorText":MessageLookupByLibrary.simpleMessage("Please add all data first"),

    // Sign in
    "seeYouBackText":MessageLookupByLibrary.simpleMessage("Good to see you back"),
    "signInTitleText":MessageLookupByLibrary.simpleMessage("Please sign in to your account"),
    "userNameHintText":MessageLookupByLibrary.simpleMessage("Email"),
    "passwordHintText":MessageLookupByLibrary.simpleMessage("Password"),
    "continueBtnText":MessageLookupByLibrary.simpleMessage("Continue"),
    "noAccountText":MessageLookupByLibrary.simpleMessage("Don\'t have the account yet?"),
    "signUpText":MessageLookupByLibrary.simpleMessage("Sign Up"),
    "rememberMeText":MessageLookupByLibrary.simpleMessage("Remember me"),
    "noUserText":MessageLookupByLibrary.simpleMessage("User not found"),
    "forgetPasswordText":MessageLookupByLibrary.simpleMessage("Forgot password?"),
    "orConnectUsingText":MessageLookupByLibrary.simpleMessage("Or connect using"),

    // Verify identity
    "didNotReceivedCodeText":MessageLookupByLibrary.simpleMessage("Didn\'t received a code yet?"),
    "resendCodeText":MessageLookupByLibrary.simpleMessage("Resend code"),
    "resendInText":MessageLookupByLibrary.simpleMessage("Resend in"),
    "enterCodeText":MessageLookupByLibrary.simpleMessage("Enter Code"),
    "enterCodeErrorText":MessageLookupByLibrary.simpleMessage("Please enter code"),
    "codeSentText":MessageLookupByLibrary.simpleMessage("We sent a code to your phone number and email"),
    "verifyIdentityText":MessageLookupByLibrary.simpleMessage("Please verify your identity"),
    "sendCodeErrorText":MessageLookupByLibrary.simpleMessage("Could not send code, please try again later."),
    "verifyUserErrorText":MessageLookupByLibrary.simpleMessage("Unable to verify the user, please try again later."),

    // Forget password
    "restorePasswordText":MessageLookupByLibrary.simpleMessage("No worries, we will help you restore it."),
    "emailPhoneText":MessageLookupByLibrary.simpleMessage("Email or Phone number"),
    "emailPhoneErrorText":MessageLookupByLibrary.simpleMessage("Please enter email or phone number"),
    "neverMindText":MessageLookupByLibrary.simpleMessage("Nevermind! "),
    "goBackText":MessageLookupByLibrary.simpleMessage("Go back"),

    // Reset password
    "changePasswordText":MessageLookupByLibrary.simpleMessage("Change your password"),
    "enterNewPasswordText":MessageLookupByLibrary.simpleMessage("Please enter new password"),
    "saveBtnText":MessageLookupByLibrary.simpleMessage("Save and login"),
    "resetLinkErrorText":MessageLookupByLibrary.simpleMessage("Cannot send the reset link, please try again later."),
    "clickOnLinkText":MessageLookupByLibrary.simpleMessage("Please click on the link sent on your registered email."),
    "resetPasswordErrorText":MessageLookupByLibrary.simpleMessage("Cannot send the reset link, please try again later."),
    "cannotResetErrorText":MessageLookupByLibrary.simpleMessage("Cannot reset the password, please try again later."),
    "passwordResetSuccessText":MessageLookupByLibrary.simpleMessage("Your password is reset, please login again."),

    // Sign up
    "signUpTitleText":MessageLookupByLibrary.simpleMessage("Create your Account"),
    "firstNameHintText":MessageLookupByLibrary.simpleMessage("First Name"),
    "middleNameHintText":MessageLookupByLibrary.simpleMessage("Middle Name"),
    "lastNameHintText":MessageLookupByLibrary.simpleMessage("Last Name"),
    "phoneNumberHintText":MessageLookupByLibrary.simpleMessage("Phone Number"),
    "emailHintText":MessageLookupByLibrary.simpleMessage("Email"),
    "confirmPasswordHintText":MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "promoCodeHintText":MessageLookupByLibrary.simpleMessage("Promotion Code(optional)"),
    "alreadyAccountText":MessageLookupByLibrary.simpleMessage("Already have an account?"),
    "signInText":MessageLookupByLibrary.simpleMessage("Sign In"),
    "enterFullNameText":MessageLookupByLibrary.simpleMessage("Please enter your full name"),
    "enterEmailText":MessageLookupByLibrary.simpleMessage("Please enter email"),
    "confirmEmailText":MessageLookupByLibrary.simpleMessage("Confirm Email"),
    "validateEmailsText":MessageLookupByLibrary.simpleMessage("Emails do not match."),
    "validateEmailDisplayText":MessageLookupByLibrary.simpleMessage("Please check your email to validate your email"),
    "validateCodeText":MessageLookupByLibrary.simpleMessage("Email Validation Code"),
    "emptyValidationCodeErrorText":MessageLookupByLibrary.simpleMessage("Email validation code cannot be empty."),
    "phoneNumberDisplayText":MessageLookupByLibrary.simpleMessage("Please enter your phone number"),
    "phoneNumberValidationDisplayText":MessageLookupByLibrary.simpleMessage("Please enter your phone validation code"),
    "phoneNumberValidationCodeText":MessageLookupByLibrary.simpleMessage("Phone validation code"),
    "emptyPhoneValidationCodeErrorText":MessageLookupByLibrary.simpleMessage("Phone validation code cannot be empty."),
    "userNameText":MessageLookupByLibrary.simpleMessage("Username"),
    "userDetailsText":MessageLookupByLibrary.simpleMessage("Please enter user details"),
    "translatorQuestionText":MessageLookupByLibrary.simpleMessage("Are you looking to work as a translator?"),
    "hireQuestionText":MessageLookupByLibrary.simpleMessage("Are you looking to hire a translator?"),
    "yesText":MessageLookupByLibrary.simpleMessage("YES"),
    "noText":MessageLookupByLibrary.simpleMessage("NO"),
    "selectValueText":MessageLookupByLibrary.simpleMessage("Please select the value"),
    "promoCodeDisplayText":MessageLookupByLibrary.simpleMessage("Please enter promotional code"),
    "enterProperCodeText":MessageLookupByLibrary.simpleMessage("Please enter proper code."),
    "userCreated":MessageLookupByLibrary.simpleMessage("User created successfully."),
    "createAccountText":MessageLookupByLibrary.simpleMessage("Create an account"),
    "createAccountRequestText":MessageLookupByLibrary.simpleMessage("Please create an account"),
    "iAgreeText":MessageLookupByLibrary.simpleMessage("I agree with the "),
    "termsAndServicesText":MessageLookupByLibrary.simpleMessage("Terms of Service"),
    "andText":MessageLookupByLibrary.simpleMessage(" and "),
    "privacyPolicyText":MessageLookupByLibrary.simpleMessage("Privacy Policy."),
    "signInNowText":MessageLookupByLibrary.simpleMessage("Sign in now"),
    "checkTermsText":MessageLookupByLibrary.simpleMessage("Please check the terms and conditions."),
    "welcomeText":MessageLookupByLibrary.simpleMessage("Welcome to demo!"),
    "emailConfirmText":MessageLookupByLibrary.simpleMessage("Please confirm your email"),
    "emailSentText":MessageLookupByLibrary.simpleMessage("Email sent successfully."),
    "phoneConfirmText":MessageLookupByLibrary.simpleMessage("Please enter your phone number"),
    "verifyPhoneSecurityText":MessageLookupByLibrary.simpleMessage("To increase your safety, we sent a code to your phone number :"),
    "translatorText":MessageLookupByLibrary.simpleMessage("Translator"),
    "hireText":MessageLookupByLibrary.simpleMessage("Hire"),
    "chooseRoleText":MessageLookupByLibrary.simpleMessage("Please, choose your role"),
    "finishText":MessageLookupByLibrary.simpleMessage("Finish"),
    "createAccountErrorText":MessageLookupByLibrary.simpleMessage("Error sending the email verification code."),
    "enterCorrectCodeErrorText":MessageLookupByLibrary.simpleMessage("Please enter the correct code"),
    "checkNumberErrorText":MessageLookupByLibrary.simpleMessage("Error in checking phone number"),
    "verifyNumberErrorText":MessageLookupByLibrary.simpleMessage("Error in verifying phone number"),
    "completeProfileErrorText":MessageLookupByLibrary.simpleMessage("Error in fetching complete profile"),

    // Welcome screen
    "goNextText":MessageLookupByLibrary.simpleMessage("Go next"),
    "collectInfoText":MessageLookupByLibrary.simpleMessage("We collect information so you can become a pro translator. Please answer all questions before you’ll start working, this is very important for us!"),
    "needToKnowText":MessageLookupByLibrary.simpleMessage("You need to know"),
    "needToKnow1Text":MessageLookupByLibrary.simpleMessage("We think about your precious time, all information will be automatically add to your profile:"),
    "needToKnow2Text":MessageLookupByLibrary.simpleMessage("We process your personal data only for predefined and lawful purposes:"),
    "needToKnow3Text":MessageLookupByLibrary.simpleMessage("We processes personal data necessary to prevent or detect money laundering and terrorist financing, as well as personal data needed to comply with trade sanctions, always in accordance with local law."),

    // Get started screen
    "getStartedText":MessageLookupByLibrary.simpleMessage("Are you ready to get started?"),
    "getStartedInfoText":MessageLookupByLibrary.simpleMessage("To become a verified translator on demo platform, we\'ll walk you through the onboarding process. It only takes a few minutes to get it done. "),
    "onBoardingText":MessageLookupByLibrary.simpleMessage("Start onboarding"),

    // Welcome back screen
    "welcomeBackText":MessageLookupByLibrary.simpleMessage("Welcome back,"),
    "welcomeBackInfoText":MessageLookupByLibrary.simpleMessage("Would you like to continue where you left off?"),

    // On boarding address
    "addressServicesText":MessageLookupByLibrary.simpleMessage("Address & Service"),
    "yourAddressText":MessageLookupByLibrary.simpleMessage("What is your address?"),
    "yourTranslationText":MessageLookupByLibrary.simpleMessage("What kind of translation will you do?"),
    "yourRatesText":MessageLookupByLibrary.simpleMessage("What are your rates?"),
    "hourlyRateText":MessageLookupByLibrary.simpleMessage("Hourly Rate"),
    "hourlyRateErrorText":MessageLookupByLibrary.simpleMessage("Hourly Rate cannot be empty."),
    "ratePerPageText":MessageLookupByLibrary.simpleMessage("Rate per Page"),
    "ratePerPageErrorText":MessageLookupByLibrary.simpleMessage("Rate per Page cannot be empty."),
    "gasText":MessageLookupByLibrary.simpleMessage("Gas rate per mile/km"),
    "gasErrorText":MessageLookupByLibrary.simpleMessage("Gas rate per mile/km cannot be empty."),
    "nextStepText":MessageLookupByLibrary.simpleMessage("Next step"),
    "streetAddressErrorText":MessageLookupByLibrary.simpleMessage("Street address is mandatory."),
    "loginFirstText":MessageLookupByLibrary.simpleMessage("Please login first"),
    "onBoardingErrorText":MessageLookupByLibrary.simpleMessage("Unable to load on boarding data"),
    "jobServicesErrorText":MessageLookupByLibrary.simpleMessage("Unable to load job services"),
    "addUpdateAddressErrorText":MessageLookupByLibrary.simpleMessage("Unable to add/update the on boarding address and services"),

    // On boarding language
    "languagesText":MessageLookupByLibrary.simpleMessage("Languages"),
    "languagesPossessText":MessageLookupByLibrary.simpleMessage("What languages do you possess?"),
    "selectLanguageText":MessageLookupByLibrary.simpleMessage("Select a language and indicate the area of specialization and level of proficiency you have."),
    "levelProficiencyText":MessageLookupByLibrary.simpleMessage("Level of Proficiency"),
    "levelSpecializationText":MessageLookupByLibrary.simpleMessage("Language Specialization"),
    "selectedText":MessageLookupByLibrary.simpleMessage("Selected"),
    "languageErrorText":MessageLookupByLibrary.simpleMessage("Please select a language."),
    "proficiencyErrorText":MessageLookupByLibrary.simpleMessage("Please select a proficiency."),
    "specializationErrorText":MessageLookupByLibrary.simpleMessage("Please select at least one specialization."),
    "clickLanguageText":MessageLookupByLibrary.simpleMessage("Click \"Add language\" if you know more languages"),
    "addLanguageText":MessageLookupByLibrary.simpleMessage("Add Language"),
    "languageEssentialsErrorText":MessageLookupByLibrary.simpleMessage("Error getting the language essentials"),
    "languageAddErrorText":MessageLookupByLibrary.simpleMessage("Error adding the language"),
    "languageDeleteErrorText":MessageLookupByLibrary.simpleMessage("Error deleting the language"),

    // On boarding education
    "educationTellText":MessageLookupByLibrary.simpleMessage("Tell as about your education"),
    "schoolText":MessageLookupByLibrary.simpleMessage("School"),
    "schoolErrorText":MessageLookupByLibrary.simpleMessage("Please enter school"),
    "degreeText":MessageLookupByLibrary.simpleMessage("Degree"),
    "degreeErrorText":MessageLookupByLibrary.simpleMessage("Please enter degree"),
    "fieldOfStudyText":MessageLookupByLibrary.simpleMessage("Field of Study"),
    "fieldOfStudyErrorText":MessageLookupByLibrary.simpleMessage("Please enter Field of study"),
    "gradeText":MessageLookupByLibrary.simpleMessage("Grade"),
    "gradeErrorText":MessageLookupByLibrary.simpleMessage("Please enter grade"),
    "activitiesText":MessageLookupByLibrary.simpleMessage("Activities"),
    "activitiesErrorText":MessageLookupByLibrary.simpleMessage("Please enter Activities"),
    "descriptionText":MessageLookupByLibrary.simpleMessage("Description"),
    "descriptionErrorText":MessageLookupByLibrary.simpleMessage("Please enter description"),
    "applyText":MessageLookupByLibrary.simpleMessage("Apply"),
    "startDateYearText":MessageLookupByLibrary.simpleMessage("Start month and year"),
    "endDateYearText":MessageLookupByLibrary.simpleMessage("End month and year"),
    "studyHereText":MessageLookupByLibrary.simpleMessage("I study here now"),
    "activitiesAndSocietiesText":MessageLookupByLibrary.simpleMessage("Activities and societies"),
    "attachmentsText":MessageLookupByLibrary.simpleMessage("Attachments"),
    "addDocumentText":MessageLookupByLibrary.simpleMessage("Add new document"),
    "titleDescriptionText":MessageLookupByLibrary.simpleMessage("Title and description"),
    "selectDocumentText":MessageLookupByLibrary.simpleMessage("Please select the document."),
    "addEducationText":MessageLookupByLibrary.simpleMessage("Add Education"),
    "addEducationErrorText":MessageLookupByLibrary.simpleMessage("Error adding the education"),
    "deleteEducationErrorText":MessageLookupByLibrary.simpleMessage("Error deleting the education"),

    // On boarding experience
    "experienceText":MessageLookupByLibrary.simpleMessage("Experience"),
    "addExperienceText":MessageLookupByLibrary.simpleMessage("Add Experience"),
    "companyTitleText":MessageLookupByLibrary.simpleMessage("Company"),
    "employmentTypeText":MessageLookupByLibrary.simpleMessage("Employment Type"),
    "employmentTypeErrorText":MessageLookupByLibrary.simpleMessage("Please select employment type"),
    "locationText":MessageLookupByLibrary.simpleMessage("Location"),
    "locationErrorText":MessageLookupByLibrary.simpleMessage("Please enter location."),

    // Profile
    "profileTitleText":MessageLookupByLibrary.simpleMessage("Profile"),
    "cancelText":MessageLookupByLibrary.simpleMessage("Cancel"),
    "saveText":MessageLookupByLibrary.simpleMessage("Save"),
    "accountTitleText":MessageLookupByLibrary.simpleMessage("Account"),
    "contactTitleText":MessageLookupByLibrary.simpleMessage("Contact"),
    "companyNameText":MessageLookupByLibrary.simpleMessage("Company Name"),
    "companyWebUrlText":MessageLookupByLibrary.simpleMessage("Company Web Url"),
    "companyTagLineText":MessageLookupByLibrary.simpleMessage("Company Tagline"),
    "companyDescriptionText":MessageLookupByLibrary.simpleMessage("Company Description"),
    "ownerText":MessageLookupByLibrary.simpleMessage("Owner"),
    "phoneText":MessageLookupByLibrary.simpleMessage("Phone"),
    "addressText":MessageLookupByLibrary.simpleMessage("Address"),
    "timeZoneText":MessageLookupByLibrary.simpleMessage("Time Zone"),
    "taxIdText":MessageLookupByLibrary.simpleMessage("Tax ID"),
    "zipText":MessageLookupByLibrary.simpleMessage("Zip"),
    "address2Text":MessageLookupByLibrary.simpleMessage("Address Line 2"),
    "cityText":MessageLookupByLibrary.simpleMessage("City"),
    "selectTypeText":MessageLookupByLibrary.simpleMessage("Select Type"),
    "cameraText":MessageLookupByLibrary.simpleMessage("CAMERA"),
    "galleryText":MessageLookupByLibrary.simpleMessage("GALLERY"),
    "dataLoadText":MessageLookupByLibrary.simpleMessage("Cannot load data, please try again after login."),
    "addressLoadText":MessageLookupByLibrary.simpleMessage("No user contact details found"),
    "imageSetText":MessageLookupByLibrary.simpleMessage("Image not set"),
    "addCompanyText":MessageLookupByLibrary.simpleMessage("Add Company Data"),
    "companyDataNoText":MessageLookupByLibrary.simpleMessage("Company data not found"),
    "addContactText":MessageLookupByLibrary.simpleMessage("Add Contact Data"),

    // Payment
    "paymentTitleText":MessageLookupByLibrary.simpleMessage("Billing & Payments"),
    "balanceDueText":MessageLookupByLibrary.simpleMessage("Balance Due"),
    "paymentMethodsText":MessageLookupByLibrary.simpleMessage("Payment Methods"),
    "paymentHistoryText":MessageLookupByLibrary.simpleMessage("Payment History"),
    "addMethodText":MessageLookupByLibrary.simpleMessage("Add Method"),
    "payNowText":MessageLookupByLibrary.simpleMessage("Pay Now"),
    "nameText":MessageLookupByLibrary.simpleMessage("Name"),
    "amountText":MessageLookupByLibrary.simpleMessage("Amount"),
    "paidDateText":MessageLookupByLibrary.simpleMessage("Paid Date"),
    "statusText":MessageLookupByLibrary.simpleMessage("Status"),
    "updateText":MessageLookupByLibrary.simpleMessage("Update"),
    "editText":MessageLookupByLibrary.simpleMessage("Edit"),
    "deleteText":MessageLookupByLibrary.simpleMessage("Delete"),
    "cardEndingText":MessageLookupByLibrary.simpleMessage("Card ending in"),
    "cardHolderText":MessageLookupByLibrary.simpleMessage("Card Holder"),
    "cardNumberText":MessageLookupByLibrary.simpleMessage("Card Number"),
    "cardExpiryText":MessageLookupByLibrary.simpleMessage("Card Expiry Date"),
    "paymentText":MessageLookupByLibrary.simpleMessage("Payments"),
    "addAddressText":MessageLookupByLibrary.simpleMessage("Add Address"),
    "addressLine1Text":MessageLookupByLibrary.simpleMessage("Address Line 1"),
    "addressLine2Text":MessageLookupByLibrary.simpleMessage("Address Line 2"),
    "addNewAddressText":MessageLookupByLibrary.simpleMessage("Add New Address"),
    "editAddressText":MessageLookupByLibrary.simpleMessage("Edit address"),
    "updateAddressText":MessageLookupByLibrary.simpleMessage("Update Address"),
    "changeAddressText":MessageLookupByLibrary.simpleMessage("Please change address"),
    "noPaymentMethodText":MessageLookupByLibrary.simpleMessage("No payment methods added"),
    "addCardDetailsText":MessageLookupByLibrary.simpleMessage("Please add the card details first"),
    "addCardAddressText":MessageLookupByLibrary.simpleMessage("Please add the card address details"),
    "tokenGenerateErrorText":MessageLookupByLibrary.simpleMessage("Could not generate the payment token"),

    // Posted jobs
    "postedJobsText":MessageLookupByLibrary.simpleMessage("Posted Jobs"),
    "searchJobsText":MessageLookupByLibrary.simpleMessage("Search Jobs"),
    "searchText":MessageLookupByLibrary.simpleMessage("Search"),
    "serviceText":MessageLookupByLibrary.simpleMessage("Service"),
    "serviceTypeText":MessageLookupByLibrary.simpleMessage("Service Type"),
    "jobStatusText":MessageLookupByLibrary.simpleMessage("Job Status"),
    "selectServiceText":MessageLookupByLibrary.simpleMessage("Select service"),
    "selectServiceTypeText":MessageLookupByLibrary.simpleMessage("Select service Type"),
    "selectJobStatusText":MessageLookupByLibrary.simpleMessage("Select job Status"),
    "filterText":MessageLookupByLibrary.simpleMessage("Filter"),

    //Posted job details
    "jobsDetailsText":MessageLookupByLibrary.simpleMessage("Job Details"),
    "titleText":MessageLookupByLibrary.simpleMessage("Title"),
    "languageText":MessageLookupByLibrary.simpleMessage("Language"),
    "sourceLanguageText":MessageLookupByLibrary.simpleMessage("Source Language"),
    "destinationLanguageText":MessageLookupByLibrary.simpleMessage("Destination Language"),
    "specializationsText":MessageLookupByLibrary.simpleMessage("Specializations"),
    "placeText":MessageLookupByLibrary.simpleMessage("Place"),
    "visibilityText":MessageLookupByLibrary.simpleMessage("Visibility"),
    "boundaryText":MessageLookupByLibrary.simpleMessage("Boundary"),
    "specialityText":MessageLookupByLibrary.simpleMessage("Speciality"),
    "proficiencyText":MessageLookupByLibrary.simpleMessage("Proficiency"),
    "ratingsText":MessageLookupByLibrary.simpleMessage("Ratings"),
    "reviewsText":MessageLookupByLibrary.simpleMessage("Reviews"),
    "scheduleText":MessageLookupByLibrary.simpleMessage("Schedule"),
    "fromText":MessageLookupByLibrary.simpleMessage("From"),
    "toText":MessageLookupByLibrary.simpleMessage("To"),
    "filtersText":MessageLookupByLibrary.simpleMessage("Filters"),
    "jobTypeText":MessageLookupByLibrary.simpleMessage("Job Type"),

    // Payment history
    "searchPaymentText":MessageLookupByLibrary.simpleMessage("Search Payment"),
    "paidOnStartText":MessageLookupByLibrary.simpleMessage("Paid On Start Date"),
    "paidOnEndText":MessageLookupByLibrary.simpleMessage("Paid On End Date"),
    "paymentAmountText":MessageLookupByLibrary.simpleMessage("Payment Amount"),

    // Post a job - description
    "backText":MessageLookupByLibrary.simpleMessage("BACK"),
    "continueText":MessageLookupByLibrary.simpleMessage("CONTINUE"),
    "titleEmptyErrorText":MessageLookupByLibrary.simpleMessage("Please enter title"),
    "descEmptyErrorText":MessageLookupByLibrary.simpleMessage("Description is required."),
    "imagesText":MessageLookupByLibrary.simpleMessage("Images(Optional)"),
    "pickImageText":MessageLookupByLibrary.simpleMessage("+ Pick Multiple"),
    "noImageSelectedText":MessageLookupByLibrary.simpleMessage("No Images selected"),
    "allPhotosText":MessageLookupByLibrary.simpleMessage("All Photos"),
    "selectServiceErrorText":MessageLookupByLibrary.simpleMessage("Please select service"),
    "serviceFetchErrorText":MessageLookupByLibrary.simpleMessage("Cannot fetch services"),

    // Post a job - language
    "fromLanguageText":MessageLookupByLibrary.simpleMessage("From Language"),
    "emptyFromLangErrorText":MessageLookupByLibrary.simpleMessage("Please enter from language"),
    "toLanguageText":MessageLookupByLibrary.simpleMessage("To Language"),
    "emptyToLangErrorText":MessageLookupByLibrary.simpleMessage("Please enter to language"),
    "specializationText":MessageLookupByLibrary.simpleMessage("Specialization"),
    "selectSpecializationsErrorText":MessageLookupByLibrary.simpleMessage("Please select specializations"),

    // Post a job - visibility
    "selectCountryText":MessageLookupByLibrary.simpleMessage("Select country"),
    "languageSpecialityText":MessageLookupByLibrary.simpleMessage("Language Speciality"),
    "selectLanguageSpecErrorText":MessageLookupByLibrary.simpleMessage("Please select language speciality"),
    "selectProficiencyErrorText":MessageLookupByLibrary.simpleMessage("Please select proficiency"),
    "selectExperienceErrorText":MessageLookupByLibrary.simpleMessage("Please enter experience"),
    "selectRatingsErrorText":MessageLookupByLibrary.simpleMessage("Please enter ratings"),
    "selectReviewsErrorText":MessageLookupByLibrary.simpleMessage("Please enter reviews"),

    // Post a job - location
    "streetAddressText":MessageLookupByLibrary.simpleMessage("Street Address"),
    "stateProvinceRegionText":MessageLookupByLibrary.simpleMessage("State/Province/Region"),
    "stateProvinceRegionErrorText":MessageLookupByLibrary.simpleMessage("State/Province/Region is required."),
    "postalZipText":MessageLookupByLibrary.simpleMessage("Postal/Zip Code"),
    "postalZipErrorText":MessageLookupByLibrary.simpleMessage("Postal/Zip Code is required."),
    "countryText":MessageLookupByLibrary.simpleMessage("Country"),

    // Post a job - schedule
    "startDateTimeText":MessageLookupByLibrary.simpleMessage("From DateTime"),
    "endDateTimeText":MessageLookupByLibrary.simpleMessage("To DateTime"),
    "noScheduleText":MessageLookupByLibrary.simpleMessage("No Schedule added"),
    "noReviewText":MessageLookupByLibrary.simpleMessage("No review available"),
    "addScheduleText":MessageLookupByLibrary.simpleMessage("Add Schedule"),
    "startDateText":MessageLookupByLibrary.simpleMessage("Start Date : "),
    "endDateText":MessageLookupByLibrary.simpleMessage("End Date : "),
    "properDateText":MessageLookupByLibrary.simpleMessage("Please select the proper dates"),

    // Translator profile
    "translatorProfileText":MessageLookupByLibrary.simpleMessage("Personal Information"),

    // Translator language
    "updateLanguageText":MessageLookupByLibrary.simpleMessage("Update Language"),

    // Translator experience
    "updateExperienceText":MessageLookupByLibrary.simpleMessage("Update Experience"),
    "companyNameErrorText":MessageLookupByLibrary.simpleMessage("Please enter company name."),
    "fromErrorText":MessageLookupByLibrary.simpleMessage("Please enter from date."),
    "toErrorText":MessageLookupByLibrary.simpleMessage("Please enter to date."),
    "currentlyWorkingText":MessageLookupByLibrary.simpleMessage("Currently working on this Role"),
    "presentText":MessageLookupByLibrary.simpleMessage("Present"),
    "noExperienceText":MessageLookupByLibrary.simpleMessage("No experience added"),

    // Translator education
    "educationText":MessageLookupByLibrary.simpleMessage("Education"),
    "updateEducationText":MessageLookupByLibrary.simpleMessage("Update Education"),
    "noEducationText":MessageLookupByLibrary.simpleMessage("No education added"),

    // Translator identification
    "additionalDisclosures":MessageLookupByLibrary.simpleMessage("Additional Disclosures"),
    "hideDisclosures":MessageLookupByLibrary.simpleMessage("Hide Disclosures"),
    "requiredText":MessageLookupByLibrary.simpleMessage("At least two forms of government picture ID is required.*"),
    "authText":MessageLookupByLibrary.simpleMessage("ACKNOWLEDGMENT AND AUTHORIZATION FOR BACKGROUND CHECK"),
    "agreeText":MessageLookupByLibrary.simpleMessage("I agree and acknowledge"),
    "uploadText":MessageLookupByLibrary.simpleMessage("Upload"),
    "uploadTwoText":MessageLookupByLibrary.simpleMessage("Upload two forms of pictures ID"),
    "chooseText":MessageLookupByLibrary.simpleMessage("Choose"),

    // Translator jobs
    "sendMessageText":MessageLookupByLibrary.simpleMessage("Send in a Message"),
    "copyLinkText":MessageLookupByLibrary.simpleMessage("Copy Link"),

    // Translator contracts
    "sendContractMessageText":MessageLookupByLibrary.simpleMessage("Send a message"),
    "proposeText":MessageLookupByLibrary.simpleMessage("Propose new contract"),
    "searchContractText":MessageLookupByLibrary.simpleMessage("Search Contracts"),

    // Translator contracts details
    "contractDetailsText":MessageLookupByLibrary.simpleMessage("Contract Details"),
    "byText":MessageLookupByLibrary.simpleMessage("By"),
    "budgetText":MessageLookupByLibrary.simpleMessage("Budget"),
    "feedbackText":MessageLookupByLibrary.simpleMessage("Feedback"),

    // Translator schedule
    "noEventsText":MessageLookupByLibrary.simpleMessage("No events for the day."),

    // Translator earnings
    "commissionText":MessageLookupByLibrary.simpleMessage("Commission"),
    "paidOutText":MessageLookupByLibrary.simpleMessage("Paid Out"),
    "earningsText":MessageLookupByLibrary.simpleMessage("Earnings"),
    "withdrawalText":MessageLookupByLibrary.simpleMessage("Withdrawal"),
    "billingMethodsText":MessageLookupByLibrary.simpleMessage("Billing Methods"),
    "earningsHistoryText":MessageLookupByLibrary.simpleMessage("Earnings History"),

    // Translator earnings history
    "transactionDateText":MessageLookupByLibrary.simpleMessage("Transaction Date"),
    "paidOutDateText":MessageLookupByLibrary.simpleMessage("Paid out Date"),
    "amountPaidText":MessageLookupByLibrary.simpleMessage("Amount Paid"),
    "searchEarningsText":MessageLookupByLibrary.simpleMessage("Search Earnings"),

    // Translator tax
    "taxResidenceText":MessageLookupByLibrary.simpleMessage("Tax Residence"),
    "displayInvoicesText":MessageLookupByLibrary.simpleMessage("This address will be displayed on invoices"),
    "useLocationText":MessageLookupByLibrary.simpleMessage("Use my existing location address"),
    "w9Text":MessageLookupByLibrary.simpleMessage("W-9"),
    "w9DisplayText":MessageLookupByLibrary.simpleMessage("Before withdrawing funds, all U.S. persons must provide their W-9 tax information."),
    "legalNameText":MessageLookupByLibrary.simpleMessage("Legal Name of Business"),
    "legalNameErrorText":MessageLookupByLibrary.simpleMessage("Please enter legal name"),
    "legalNameDisplayText":MessageLookupByLibrary.simpleMessage("Provide the same name as shown on your tax return."),
    "taxClassificationText":MessageLookupByLibrary.simpleMessage("Federal Tax Classification"),
    "taxClassificationErrorText":MessageLookupByLibrary.simpleMessage("Please select tax classification"),
    "payerIdentificationText":MessageLookupByLibrary.simpleMessage("Tax payer Identification Number type"),
    "payerIdentificationErrorText":MessageLookupByLibrary.simpleMessage("Please select payer identification number type"),
    "ssnText":MessageLookupByLibrary.simpleMessage("SSN/EIN #"),
    "ssnErrorText":MessageLookupByLibrary.simpleMessage("Please enter SSN/EIN #"),
    "iCertifyText":MessageLookupByLibrary.simpleMessage("I certify, under penalties of perjury, that the representations in this Tax Certificate are true and correct."),
    "taxFormText":MessageLookupByLibrary.simpleMessage("1099 - Tax Form"),
    "yearText":MessageLookupByLibrary.simpleMessage("Year"),
    "yearErrorText":MessageLookupByLibrary.simpleMessage("Please select year"),
    "getCodeText":MessageLookupByLibrary.simpleMessage("Get Code"),
    "verificationCodeText":MessageLookupByLibrary.simpleMessage("Verification Code"),
    "verificationCodeErrorText":MessageLookupByLibrary.simpleMessage("Please enter verification code"),
    "downloadText":MessageLookupByLibrary.simpleMessage("Download"),

    // Request translator
    "searchForText":MessageLookupByLibrary.simpleMessage("Search for"),
    "translatorsText":MessageLookupByLibrary.simpleMessage("Translators"),
    "messageText":MessageLookupByLibrary.simpleMessage("Message"),
    "callText":MessageLookupByLibrary.simpleMessage("Call"),

    // User chat
    "startNewConversationText":MessageLookupByLibrary.simpleMessage("Start a new conversation!"),
    "writeMessageText":MessageLookupByLibrary.simpleMessage("Write message..."),

    // Translator payment method
    "personalDetailsText":MessageLookupByLibrary.simpleMessage("Verify Personal Details"),
    "ssNumberText":MessageLookupByLibrary.simpleMessage("Social Security number (SSN)"),
    "ssNNumber":MessageLookupByLibrary.simpleMessage("SSN Number"),
    "ssNError":MessageLookupByLibrary.simpleMessage("SSN number cannot be empty"),
    "dateOfBirthText":MessageLookupByLibrary.simpleMessage("Date of Birth"),
    "idVerificationText":MessageLookupByLibrary.simpleMessage("ID verification for"),
    "securityText":MessageLookupByLibrary.simpleMessage("For additional security, please have this person finish verifying their identity with a government-issued ID."),
    "billingAddText":MessageLookupByLibrary.simpleMessage("Billing address"),
    "verifyText":MessageLookupByLibrary.simpleMessage("Verify"),
    "chooseFileText":MessageLookupByLibrary.simpleMessage("Choose File"),
    "selectFileText":MessageLookupByLibrary.simpleMessage("Please select the file"),
    "browseFileText":MessageLookupByLibrary.simpleMessage("Browse File"),
    "fillDetailsText":MessageLookupByLibrary.simpleMessage("Please fill all the details."),
    "dateOfBirthReqText":MessageLookupByLibrary.simpleMessage("Date of Birth is required"),
  };
}
