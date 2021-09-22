class ApiEndpoints{
  /// Base URL for the api parts.
  static final String baseUrl = 'https://jsonplaceholder.typicode.com/';
  static final String baseUrlProd = 'https://apiprod.khontext.com';
  // static final String baseUrlDev = 'https://netapi.dev-khontext.com';
  static final String baseUrlDev = 'https://khontext-api.mycodelibraries.com';
  static final String baseUrlQa = 'https://apiqa.khontext.com';
  static final String placeApi = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=';
  static final String placeIdApi = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=';

  static final String voiceCallUrl = "https://54ba1250bede.ngrok.io";

  /// Data dog configurations
  static final String dataDogServiceName = "khontext-Dev";
  /// Sign in user endpoints
  static const String signInUser = '/api/v1/Accounts/Login';

  /// Forget password endpoints
  static String forgetPassword = '/api/v1/Accounts/SentResetPasswordLink';

  /// Reset password endpoints
  static String resetPassword = '/api/v1/Accounts/ResetNewPassword';

  /// Verify identity
  static String sendVerificationCode = '/api/v1/Accounts/ResentSignInIdentityVerifyCode/';
  static String verifyIdentification = '/api/v1/Accounts/VerifyIdentificationCode';

  /// Sign up endpoints
  static String createUserProfile = '/api/v1/Accounts/CreateAccount';
  static String sendEmailVerification = '/api/v1/Comm/SendVerificationMail';
  static String verifyEmail = '/api/v1/Comm/VerifyUserEmail';
  static String checkPhoneNumber = '/api/v1/Accounts/CheckPhoneNumber';
  static String sendPhoneVerification = '/api/v1/Comm/SendVerificationMessage';
  static String verifyPhone = '/api/v1/Comm/VerifyUserPhone';
  static String completeUserProfile = '/api/v1/Accounts/CompleteUserAccount';

  /// On boarding endpoints
  static String getOnBoard = '/api/v1/Profiles/GetOnboardByUserId/';

  /// On boarding address endpoints
  static String getOnboardService = '/api/v1/Profiles/GetOnboardService';
  static String getOnboardAddressServices = '/api/v1/Profiles/AddOrUpdateAddressAndService';

  /// On boarding languages endpoints
  static String languages = '/api/v1/Languages/GetLanguages';
  static String specializations = '/api/v1/Languages/GetSpecializations';
  static String proficiencyLevel = '/api/v1/Jobs/GetProficiencyLevels';
  static String addUpdateOnBoardingLanguage = '/api/v1/Profiles/AddOrUpdateLanguage';
  static String deleteOnBoardingLanguage = '/api/v1/Profiles/DeleteOnboardLanguage/';

  /// On boarding education endpoints
  static String addDocumentFile = '/api/v1/FileDocuments/AddFileDocument';
  static String addUpdateOnBoardingEducation = '/api/v1/Profiles/AddOrUpdateEducation';
  static String deleteOnBoardingEducation = '/api/v1/Profiles/DeleteOnboardEducation/';

  /// On boarding experience endpoints
  static String addUpdateOnBoardingExperience = '/api/v1/Profiles/AddOrUpdateExperience';
  static String deleteOnBoardingExperience = '/api/v1/Profiles/DeleteOnboardExperience/';

  /// Profile api endpoints
  static String clientProfile = '/api/v1/Profiles/GetUserProfile/';
  static String clientProfileUpdate = '/api/v1/Profiles/UpdateUserProfile/';
  static String clientProfileImage = '/api/v1/Profiles/GetUserProfileImage/';
  static String clientProfileImageAdd = '/api/v1/Profiles/AddUserProfileImage/';
  static String clientProfileImageUpdate = '/api/v1/Profiles/UpdateUserProfileImage/';
  static String clientAddress = '/api/v1/Profiles/GetUserAddress/';
  static String clientAddAddress = '/api/v1/Profiles/CreateUserAddress/';
  static String clientUpdateAddress = '/api/v1/Profiles/UpdateUserAddress/';
  static String clientCompany = '/api/v1/Companies/GetUserCompany/';
  static String clientAddCompany = '/api/v1/Companies/CreateUserCompany/';
  static String clientUpdateCompany = '/api/v1/Companies/UpdateUserCompany/';
  static String clientCompanyImage = '/api/v1/Companies/GetCompanyImage/';
  static String clientCompanyImageAdd = '/api/v1/Companies/AddCompanyImage/';
  static String clientCompanyImageUpdate = '/api/v1/Companies/UpdateCompanyImage/';

  /// Post job api endpoints
  static String jobServices = '/api/v1/Jobs/GetJobServices';
  static String jobDescription = '/api/v1/Jobs/GetDescriptionOfTheJob/';
  static String addUpdateDescription = '/api/v1/Jobs/AddUpdateDescriptionOfTheJob';
  static String jobsLanguages = '/api/v1/Jobs/GetLanguageOfTheJob/';
  static String addUpdateJobsLanguages = '/api/v1/Jobs/AddUpdateLanguageOfTheJob';
  static String postJobAddress = '/api/v1/Jobs/GetJobAddress/';
  static String postJobAddAddress = '/api/v1/Jobs/CreateJobAddress/';
  static String postJobUpdateAddress = '/api/v1/Jobs/UpdateJobAddress/';
  static String states = '/api/v1/Locations/GetStates';
  static String jobVisibility = '/api/v1/Jobs/GetVisibilityOfTheJob/';
  static String addUpdateJobVisibility = '/api/v1/Jobs/AddUpdateVisibilityOfTheJob';
  static String postJobSchedule = '/api/v1/Jobs/GetScheduleOfTheJob/';
  static String addUpdateJobSchedule = '/api/v1/Jobs/AddUpdateScheduleOfTheJob';
  static String jobReview = '/api/v1/Jobs/GetReviewOfTheJob/';
  static String jobsList = '/api/v1/Jobs/GetListOfThePostedJob/';
  static String isJobReview = '/api/v1/Jobs/IsReviewOfTheJob/';

  /// Voice call api endpoints
  static String voiceCall = '$voiceCallUrl/api/v1/Call/GetMobileTwilioToken/';

  /// User conversations api endpoints
  static const String userChatToken = '/api/v1/Conversation/GetTwilioToken/';
  static String addConversation = '/api/v1/Conversation/AddChatConversation';
  static String getUserConversation = '/api/v1/Conversation/ListOfUserConversation/';

  /// Payments api endpoints
  static const String getUserAddressList = '/api/v1/Profiles/GetListOfUserAddressByUserId/';
  static String getPaymentMethodList = '/api/v1/Payment/GetPaymentMethodByUserId/';
  static String createCustomerPaymentMethod = '/api/v1/Payment/CreateStripeCustomerPaymentMethod';
  static String updateCustomerPaymentMethod = '/api/v1/Payment/UpdateCustomerStripePaymentMethod';
  static String deleteCustomerPaymentMethod = '/api/v1/Payment/DeleteStripePaymentMethod';
  static String createTranslatorPaymentMethod = '/api/v1/Payment/AddStripeCustomAccountPaymentMethod';
  static String updateTranslatorPaymentMethod = '/api/v1/Payment/UpdateCustomAccountPaymentMethod';
  static String deleteTranslatorPaymentMethod = '/api/v1/Payment/DeleteCustomAccountPaymentMethod';

  /// Stripe endpoints
  static String createStripeAccount = '/api/v1/Accounts/CreateStripeAccount';

  /// Translator experience endpoints
  static String getEmploymentTypes = '/api/v1/Translators/GetEmploymentTypes';
  static String getExperienceList = '/api/v1/Translators/GetUserExperiences/';
  static String addUpdateExperienceList = '/api/v1/Translators/AddUpdateExperience';

  /// Translator education endpoints
  static String getEducationList = '/api/v1/Translators/GetUserEducation/';
  static String addUpdateEducationList = '/api/v1/Translators/AddUpdateEducation';

  /// Translator identification endpoints
  static String getIdentificationList = '/api/v1/Checkr/GetIdentificationByUserId/';
  static String addIdentification = '/api/v1/Checkr/AddIdentificationForUser';

  /// Translator language endpoints
  static String addLanguage = '/api/v1/Languages/AddUpdateLanguagesOfTheTranslator';
  static String deleteLanguage = '/api/v1/Languages/DeleteTranslatorLanguage/';
  static String getLanguageList = '/api/v1/Languages/GetListLanguagesOfTheTranslator/';

  /// Translator tax endpoints
  static String getExistingUserAddress = '/api/v1/Translators/GetExistingUserAddress/';
  static String addUserAddress = '/api/v1/Translators/AddUpdateTaxResidence';

  /// Translator jobs endpoints
  static String searchJobs = '/api/v1/Jobs/SearchJob';
  static String favoriteJobs = '/api/v1/Jobs/GetAllTranslatorFavoriteJob';
  static String addFavoriteJob = '/api/v1/Jobs/AddTranslatorFavoriteJob';
  static String removeFavoriteJob = '/api/v1/Jobs/DeleteTranslatorFavoriteJob/';

  /// Plaid token generate
  static String generatePlaidToken = '/api/v1/Accounts/GetPlaidLinkToken';
  static String getBankAccountSource = '/api/v1/Accounts/GetBankAccountSourceUsingPlaid';

  /// Apply jobs endpoints
  static String applyJobsList = '/api/v1/Jobs/ListOfTranslatorApplyJobs/';
  static String addUpdateApplyJobs = '/api/v1/Jobs/AddOrUpdateTranslatorApplyJobs';
  static String removeApplyJobs = '/api/v1/Jobs/DeleteTranslatorApplyJobs/';

  /// Accept jobs endpoints
  static String jobsProposals = '/api/v1/Jobs/GetAllAppliedTransltorOfTheJobs/';
  static String acceptJobsProposals = '/api/v1/Jobs/AddHireTranslatorForAppliedJob';
}