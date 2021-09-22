import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khontext/data.dart';
import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_address_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_company_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_profile_action.dart';
import 'package:khontext/redux/actions/forgetpassword/forget_password_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingaddress/onboarding_address_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingeducation/onboarding_education_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingexperience/onboarding_experience_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardinglanguages/onboarding_languages_actions.dart';
import 'package:khontext/redux/actions/paymenthistory/payment_history_actions.dart';
import 'package:khontext/redux/actions/payments/payments_actions.dart';
import 'package:khontext/redux/actions/postedjobs/posted_job_list_actions.dart';
import 'package:khontext/redux/actions/postjobs/accept_jobs_actions.dart';
import 'package:khontext/redux/actions/postjobs/change_page_actions.dart';
import 'package:khontext/redux/actions/postjobs/fetch_drawer_data_actions.dart';
import 'package:khontext/redux/actions/postjobs/move_backward_actions.dart';
import 'package:khontext/redux/actions/postjobs/move_forward_actions.dart';
import 'package:khontext/redux/actions/postjobs/post_job_description_actions.dart';
import 'package:khontext/redux/actions/postjobs/post_job_language_actions.dart';
import 'package:khontext/redux/actions/postjobs/post_job_locality_actions.dart';
import 'package:khontext/redux/actions/postjobs/post_job_review_actions.dart';
import 'package:khontext/redux/actions/postjobs/post_job_schedule_actions.dart';
import 'package:khontext/redux/actions/postjobs/post_job_visibility_actions.dart';
import 'package:khontext/redux/actions/signin/sign_in_action.dart';
import 'package:khontext/redux/actions/signin/verify_identity_actions.dart';
import 'package:khontext/redux/actions/signup/check_phone_number_action.dart';
import 'package:khontext/redux/actions/signup/complete_user_profile_action.dart';
import 'package:khontext/redux/actions/signup/create_user_profile_action.dart';
import 'package:khontext/redux/actions/signup/send_phone_verification_action.dart';
import 'package:khontext/redux/actions/signup/verify_email_action.dart';
import 'package:khontext/redux/actions/signup/verify_phone_action.dart';
import 'package:khontext/redux/actions/translate/change_translate_page_actions.dart';
import 'package:khontext/redux/actions/translate/fetch_translate_drawer_actions.dart';
import 'package:khontext/redux/actions/translate/translatorcontracts/fetch_translator_contracts.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_bank_account_source.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_billing_methods_type.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_translator_earnings.dart';
import 'package:khontext/redux/actions/translate/translatorearnings/fetch_translator_earnings_history.dart';
import 'package:khontext/redux/actions/translate/translatoreducation/translator_education_actions.dart';
import 'package:khontext/redux/actions/translate/translatorexperience/translator_experience_actions.dart';
import 'package:khontext/redux/actions/translate/translatoridentification/translator_identification_actions.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/apply_job_actions.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/translator_jobs_actions.dart';
import 'package:khontext/redux/actions/translate/translatorlanguage/translator_language_actions.dart';
import 'package:khontext/redux/actions/translate/translatorschedule/fetch_translator_schedules.dart';
import 'package:khontext/redux/actions/translate/translatortax/translator_tax_actions.dart';
import 'package:khontext/redux/actions/translatorpayments/translator_payments_actions.dart';
import 'package:khontext/redux/actions/userchat/user_chat_actions.dart';
import 'package:khontext/redux/actions/userchat/user_conversations_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_model.dart';
import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:khontext/src/models/onboarding/onboarding_data_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/job_services_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/onboarding_education_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/onboarding_experience_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/languages_essentials_model.dart';
import 'package:khontext/src/models/onboarding/onboardinglanguages/onboarding_add_lang_response_model.dart';
import 'package:khontext/src/models/payment_history_model.dart';
import 'package:khontext/src/models/payments/add_payment_method_request.dart';
import 'package:khontext/src/models/payments/add_payment_method_response.dart';
import 'package:khontext/src/models/payments/delete_payment_method_response.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/models/payments/user_address_list_model.dart';
import 'package:khontext/src/models/postedjobs/post_jobs_list_response_model.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/accept_proposal_response.dart';
import 'package:khontext/src/models/postjobs/acceptjobs/hire_applied_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/job_languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/languages_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobreview/job_review_response_model.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_states_model.dart';
import 'package:khontext/src/models/postjobs/post_job_status_model.dart';
import 'package:khontext/src/models/signup/check_phone_response_model.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/signup/send_phone_code_response_model.dart';
import 'package:khontext/src/models/signup/sign_up_request_model.dart';
import 'package:khontext/src/models/signup/user_profile_response_model.dart';
import 'package:khontext/src/models/signup/verify_email_response_model.dart';
import 'package:khontext/src/models/signup/verify_phone_response_model.dart';
import 'package:khontext/src/models/translator/translatorearnings/bank_account_source_response.dart';
import 'package:khontext/src/models/translator/translatoreducation/add_update_edu_response_model.dart';
import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';
import 'package:khontext/src/models/translator/translatorexperience/add_update_exp_response_model.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';
import 'package:khontext/src/models/translator/translatoridentification/add_translator_identiy_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_fav_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/apply_jobs_list_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/common_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorlanguage/add_update_language_response.dart';
import 'package:khontext/src/models/translator/translatorlanguage/delete_language_response_model.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';
import 'package:khontext/src/models/translator/translatortax/user_add_response_model.dart';
import 'package:khontext/src/models/translator_contracts_model.dart';
import 'package:khontext/src/models/translator_earnings_history_model.dart';
import 'package:khontext/src/models/translator_earnings_model.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_response.dart';
import 'package:khontext/src/models/userchats/chat_list_model.dart';
import 'package:khontext/src/models/userchats/user_conversations_model.dart';
import 'package:khontext/src/models/voicecall/call_token_response_model.dart';
import 'package:khontext/src/screens/clientprofile/apiprovider/client_profile_api.dart';
import 'package:khontext/src/screens/forgotpassword/apiprovider/forget_password_api.dart';
import 'package:khontext/src/screens/onboarding/apiprovider/onboarding_addresss_api.dart';
import 'package:khontext/src/screens/onboarding/apiprovider/onboarding_data_api.dart';
import 'package:khontext/src/screens/onboarding/apiprovider/onboarding_education_api.dart';
import 'package:khontext/src/screens/onboarding/apiprovider/onboarding_experience_api.dart';
import 'package:khontext/src/screens/onboarding/apiprovider/onboarding_language_api.dart';
import 'package:khontext/src/screens/paymenthistory/apiprovider/payment_history_api.dart';
import 'package:khontext/src/screens/payments/apiprovider/payments_api.dart';
import 'package:khontext/src/screens/postedjobs/apiprovider/posted_job_list_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/hire_applied_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_description_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_languages_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_location_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_review_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_schedule_api.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_visibility_api.dart';
import 'package:khontext/src/screens/signin/apiprovider/sign_in_api.dart';
import 'package:khontext/src/screens/signup/apiprovider/sign_up_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_apply_jobs_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_education_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_experience_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_identification_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_jobs_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_language_api.dart';
import 'package:khontext/src/screens/translate/apiprovider/translator_tax_api.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/apiprovider/translator_payments_api.dart';
import 'package:khontext/src/screens/userchat/apiprovider/user_chat_api.dart';
import 'package:khontext/utils/chat_utils.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

/// [AppMiddleware] will provide the middleware for the actions and reducers to connect.
class AppMiddleware {
  final PaymentHistoryApiCalls paymentHistoryApiCalls;

  const AppMiddleware({this.paymentHistoryApiCalls = const PaymentHistoryApiCalls()});

  /// [List] of middleware which will exist in the application.
  List<Middleware<AppState>> createMiddleware() {
    return <Middleware<AppState>>[
      TypedMiddleware<AppState, dynamic>(_logAction),

      /// Sign in calls
      TypedMiddleware<AppState, SignInAction>(_userSignIn),

      /// Verify identity calls
      TypedMiddleware<AppState, SendIdentificationCodeAction>(_sendVerificationCode),
      TypedMiddleware<AppState, VerifyIdentityAction>(_verifyUser),

      /// Forget password calls.
      TypedMiddleware<AppState, ForgetPasswordLinkAction>(_sendPasswordResetLink),

      /// Reset password calls
      TypedMiddleware<AppState, ResetPasswordAction>(_resetPasswordCall),

      /// Sign up calls
      TypedMiddleware<AppState, CreateUserProfileAction>(_createUserProfile),
      TypedMiddleware<AppState, SendVerifyEmailAction>(_sendVerifyEmail),
      TypedMiddleware<AppState, VerifyEmailAction>(_verifyEmail),
      TypedMiddleware<AppState, CheckPhoneNumberAction>(_checkPhoneNumber),
      TypedMiddleware<AppState, SendPhoneVerificationAction>(_sendPhoneNumber),
      TypedMiddleware<AppState, VerifyPhoneAction>(_verifyPhoneNumber),
      TypedMiddleware<AppState, CompleteUserProfileAction>(_completeProfile),

      /// On boarding calls
      TypedMiddleware<AppState, OnBoardingDataActions>(_getOnBoardingData),
      TypedMiddleware<AppState, OnBoardingClearActions>(_onBoardingDataClear),

      /// On boarding address
      TypedMiddleware<AppState, GetJobServicesActions>(_getJobsServices),
      TypedMiddleware<AppState, AddOnBoardingAddressActions>(_addOnBoardingServices),

      /// On boarding language
      TypedMiddleware<AppState, OnBoardingLangEssentialsActions>(_onBoardingLanguagesEssentials),
      TypedMiddleware<AppState, OnBoardingAddLangActions>(_onBoardingAddLanguage),
      TypedMiddleware<AppState, OnBoardingDeleteLangActions>(_onBoardingDeleteLanguage),

      /// On boarding education
      TypedMiddleware<AppState, OnBoardingAddEduActions>(_onBoardingAddEducation),
      TypedMiddleware<AppState, OnBoardingDeleteEduActions>(_onBoardingDeleteEducation),

      /// On boarding experience
      TypedMiddleware<AppState, OnBoardingEmploymentTypesFetchAction>(
          _onBoardingEmploymentTypeList),
      TypedMiddleware<AppState, OnBoardingAddExpActions>(_onBoardingAddExperience),
      TypedMiddleware<AppState, OnBoardingDeleteExpActions>(_onBoardingDeleteExperience),

      /// Payment history page middleware
      TypedMiddleware<AppState, PaymentHistoryFetchAction>(_paymentHistoryFetch),

      /// Posted jobs list
      TypedMiddleware<AppState, PostedJobListFetchAction>(_fetchJobsList),

      /// Post a job page middleware
      TypedMiddleware<AppState, DrawerDataFetchAction>(_drawerDataFetch),
      TypedMiddleware<AppState, ChangeCurrentPageAction>(_changeCurrentPage),
      TypedMiddleware<AppState, MoveForwardAction>(_moveForward),
      TypedMiddleware<AppState, MoveBackwardAction>(_moveBackward),

      /// Description
      TypedMiddleware<AppState, JobServicesFetchAction>(_fetchJobServices),
      TypedMiddleware<AppState, JobDescriptionFetchAction>(_fetchJobDescription),
      TypedMiddleware<AppState, JobDescriptionAddUpdateAction>(_addUpdateJobDescription),

      /// Languages
      TypedMiddleware<AppState, LanguagesEssentialsFetchAction>(_fetchJobLanguagesEssentials),
      TypedMiddleware<AppState, JobLanguagesFetchAction>(_fetchJobLanguages),
      TypedMiddleware<AppState, AddUpdateJobLanguagesAction>(_addUpdateJobLanguages),

      /// Locality
      TypedMiddleware<AppState, PostJobLocalityFetchAction>(_postJobAddressData),
      TypedMiddleware<AppState, PostJobLocalityAddAction>(_postJobAddAddressData),
      TypedMiddleware<AppState, PostJobLocalityUpdateAction>(_postJobUpdateAddressData),

      /// Visibility
      TypedMiddleware<AppState, JobVisibilityEssentialsAction>(_jobVisibilityEssentialsData),
      TypedMiddleware<AppState, JobVisibilityFetchAction>(_jobVisibilityData),
      TypedMiddleware<AppState, AddJobVisibilityAction>(_addUpdateJobVisibilityData),

      /// Schedule
      TypedMiddleware<AppState, PostJobScheduleFetchAction>(_jobScheduleData),
      TypedMiddleware<AppState, AddJobScheduleAction>(_jobScheduleAddUpdate),

      /// Review
      TypedMiddleware<AppState, PostJobReviewFetchAction>(_jobReviewData),
      TypedMiddleware<AppState, SetJobReviewAction>(_setJobReview),

      /// Translate page middleware
      TypedMiddleware<AppState, TranslateDrawerDataFetchAction>(_translateDrawerDataFetch),
      TypedMiddleware<AppState, ChangeTranslatePageAction>(_changeTranslatePage),

      /// Translate page experience section
      TypedMiddleware<AppState, EmploymentTypesFetchAction>(_employmentTypeList),
      TypedMiddleware<AppState, TranslateExperienceFetchAction>(_translateExperienceList),
      TypedMiddleware<AppState, AddUpdateExperienceAction>(_addUpdateTranslateExperience),

      /// Translate page language section
      TypedMiddleware<AppState, TranslateLanguageFetchAction>(_languageList),
      TypedMiddleware<AppState, AddUpdateTranslateLanguageAction>(_addUpdateTranslateLanguage),
      TypedMiddleware<AppState, DeleteTranslateLanguageAction>(_deleteTranslateLanguage),

      /// Translate page education section
      TypedMiddleware<AppState, TranslateEducationFetchAction>(_translateEducationList),
      TypedMiddleware<AppState, AddUpdateEducationAction>(_addTranslateEducation),

      /// Translate page identification section
      TypedMiddleware<AppState, TranslateIdentificationFetchAction>(_translateIdentificationList),
      TypedMiddleware<AppState, AddTranslateIdentificationAction>(_addTranslateIdentification),

      /// Translate page jobs section
      TypedMiddleware<AppState, TranslateJobsFetchAction>(_fetchTranslatorJobsList),
      TypedMiddleware<AppState, FavoriteJobsFetchAction>(_fetchTranslatorFavJobsList),
      TypedMiddleware<AppState, AddFavoriteJobsAction>(_addTranslatorFavJobsList),
      TypedMiddleware<AppState, RemoveFavoriteJobsAction>(_deleteTranslatorFavJobsList),

      /// Translator apply jobs
      TypedMiddleware<AppState, ApplyJobsListFetchAction>(_fetchTranslatorApplyJobsList),
      TypedMiddleware<AppState, AddUpdateApplyJobsAction>(_addTranslatorApplyJobsList),
      TypedMiddleware<AppState, DeleteApplyJobsAction>(_deleteTranslatorApplyJobsList),

      /// Translate page contract section
      TypedMiddleware<AppState, TranslateContractsFetchAction>(_fetchTranslatorContractList),

      /// Translate page Schedule section
      TypedMiddleware<AppState, TranslateScheduleFetchAction>(_fetchTranslatorScheduleList),

      /// Translate page earnings section
      TypedMiddleware<AppState, TranslateEarningsFetchAction>(_fetchTranslatorEarningsList),
      TypedMiddleware<AppState, PaymentMethodListFetchAction>(_fetchBillingMethodsList),
      TypedMiddleware<AppState, TranslateBillingTypeFetchAction>(_fetchBillingTypeList),
      TypedMiddleware<AppState, TranslateEarningsHistoryFetchAction>(
          _fetchTranslatorEarningsHistoryList),

      /// Translate tax section
      TypedMiddleware<AppState, ExistingUserAddressFetchAction>(_getTranslatorExistingResidence),
      TypedMiddleware<AppState, AddUserAddressAction>(_addTranslateTaxAddress),

      /// Client profile calls.
      TypedMiddleware<AppState, ClientProfileFetchAction>(_clientProfileData),
      TypedMiddleware<AppState, ChangeEditStatusAction>(_changeEditStatus),
      TypedMiddleware<AppState, ClientProfileImageAddAction>(_clientAddProfileImageData),
      TypedMiddleware<AppState, ClientProfileUpdateAction>(_updateUserProfile),
      TypedMiddleware<AppState, ClientProfileImageUpdateAction>(_clientUpdateProfileImageData),

      /// Client address
      TypedMiddleware<AppState, ClientAddressFetchAction>(_clientAddressData),
      TypedMiddleware<AppState, ClientAddAddressAction>(_clientAddAddressData),
      TypedMiddleware<AppState, ClientUpdateAddressAction>(_clientUpdateAddressData),

      /// Client company
      TypedMiddleware<AppState, ClientCompanyFetchAction>(_clientCompanyData),
      TypedMiddleware<AppState, ClientCompanyAddAction>(_clientAddCompanyData),
      TypedMiddleware<AppState, ClientCompanyAddImageAction>(_clientAddCompanyImageData),
      TypedMiddleware<AppState, ClientCompanyUpdateAction>(_clientUpdateCompanyData),
      TypedMiddleware<AppState, ClientCompanyUpdateImageAction>(_clientUpdateCompanyImageData),

      /// User Conversations
      TypedMiddleware<AppState, GetUserConversationsAction>(_getUserConversations),

      /// User Chat
      TypedMiddleware<AppState, SetUserChatAction>(_setUserChatList),
      TypedMiddleware<AppState, AddSingleChatAction>(_addSingleChatMessage),

      /// Payments
      TypedMiddleware<AppState, UserAddressListFetchAction>(_userAddressList),
      TypedMiddleware<AppState, PaymentMethodListFetchAction>(_paymentMethodList),
      TypedMiddleware<AppState, AddPaymentMethodAction>(_addNewPaymentMethod),
      TypedMiddleware<AppState, UpdatePaymentMethodAction>(_updateNewPaymentMethod),
      TypedMiddleware<AppState, DeletePaymentMethodAction>(_deleteNewPaymentMethod),

      /// Translator payments
      TypedMiddleware<AppState, CreateStripeAccountAction>(_createStripeAccount),
      TypedMiddleware<AppState, ClearTranslatorPaymentStateAction>(_clearTranslatorPaymentState),
      TypedMiddleware<AppState, BankAccountSourceFetchAction>(getBankSource),

      /// Accept jobs
      TypedMiddleware<AppState, JobProposalsFetchAction>(_fetchPostedJobsProposals),
      TypedMiddleware<AppState, AcceptJobProposalsAction>(_acceptPostedJobsProposals),
    ];
  }

  void _logAction(Store<AppState> store, dynamic action, NextDispatcher next) async {
    next(action);
    print("Action => $action");
  }

  /// Function which will hold the logic and api call for the [SignInAction].
  void _userSignIn(Store<AppState> store, SignInAction action, NextDispatcher next) async {
    next(action);
    try {
      CompleteProfileResponseModel completeProfileResponseModel =
          await SignInApiCalls.signInUser(action.signInRequestModel);
      if (completeProfileResponseModel.isSuccessful &&
          completeProfileResponseModel?.data?.userId != Constants.nullUser) {
        String userName = _getFromName(completeProfileResponseModel);

        // CallTokenResponseModel tokenData = await VoiceCallApiCalls.getVoiceCallToken(userName);
        //
        // if (tokenData?.isSuccessful == true && tokenData?.data?.isNotEmpty == true) {
        //   Utils.setStringToPrefs(Constants.accessToken, tokenData?.data);
        //   TwilioVoice.instance.setTokens(
        //     accessToken: tokenData?.data,
        //     deviceToken: Utils.getStringFromPrefs(Constants.deviceToken),
        //   );
        //   TwilioVoice.instance.registerClient(
        //     _getFromName(completeProfileResponseModel),
        //     _getFromName(completeProfileResponseModel, isName: true),
        //   );
        // } else {
        //   Utils.setStringToPrefs(Constants.accessToken, null);
        // }

        CallTokenResponseModel chatTokenData =
            await UserChatApiCalls.getChatToken(completeProfileResponseModel.data.userId);

        if (chatTokenData?.isSuccessful == true && chatTokenData?.data?.isNotEmpty == true) {
          Utils.setStringToPrefs(Constants.chatAccessToken, chatTokenData?.data);
          store.dispatch(UserAddressListFetchAction());
          ChatUtils.chatBridgePlatform.invokeMethod(Constants.initiateChat, {
            Constants.accessToken: chatTokenData?.data,
          });
        }
        store.dispatch(
            SignInSuccessAction(completeProfileResponseModel: completeProfileResponseModel));
        Utils.navigateTo(action.context, RoutesConstants.identityVerification);
      } else {
        store.dispatch(
            SignInErrorAction(error: FormBuilderLocalizations.of(action.context).noUserText));
      }
    } catch (e) {
      store.dispatch(
          SignInErrorAction(error: FormBuilderLocalizations.of(action.context).noUserText));
    }
  }

  /// Function which will hold the logic for the [UserAddressListFetchAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _userAddressList(
      Store<AppState> store, UserAddressListFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(UserAddressListErrorAction(error: 'Please login first.'));
        return;
      }
      UserAddressListResponseModel userAddressListResponseModel =
          await PaymentsApiCalls.getUsersAddressList(userId);

      if (userAddressListResponseModel?.isSuccessful == false &&
          userAddressListResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(UserAddressListErrorAction(error: userAddressListResponseModel?.errors[0]));
      } else {
        store.dispatch(UserAddressListSuccessAction(
            userAddressListResponseModel: userAddressListResponseModel));
      }
    } catch (e) {
      store.dispatch(UserAddressListErrorAction(error: 'Error in getting the user address list.'));
    }
  }

  /// Function which will send the verification code to the user's phone.
  void _sendVerificationCode(
      Store<AppState> store, SendIdentificationCodeAction action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel commonResponseModel =
          await SignInApiCalls.sendVerificationCode(action.userId);

      if (commonResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(SendIdentificationCodeErrorAction(error: commonResponseModel.errors[0]));
      } else {
        store.dispatch(
            SendIdentificationCodeSuccessAction(commonResponseModel: commonResponseModel));
      }
    } catch (e) {
      store.dispatch(SendIdentificationCodeErrorAction(
          error: FormBuilderLocalizations.of(action.context).sendCodeErrorText));
    }
  }

  /// Function which will verify the user.
  void _verifyUser(Store<AppState> store, VerifyIdentityAction action, NextDispatcher next) async {
    next(action);
    try {
      CompleteProfileResponseModel completeProfileResponseModel =
          await SignInApiCalls.verifyIdentity(action.verifyIdentityRequestModel);

      if (completeProfileResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(VerifyIdentityErrorAction(error: completeProfileResponseModel.errors[0]));
      } else {
        store.dispatch(VerifyIdentitySuccessAction(
            completeProfileResponseModel: completeProfileResponseModel));
        Utils.setStringToPrefs(Constants.userToken, completeProfileResponseModel.data.userId);
        Utils.navigateTo(action.context, RoutesConstants.welcomeBackScreen);
      }
    } catch (e) {
      store.dispatch(VerifyIdentityErrorAction(
          error: FormBuilderLocalizations.of(action.context).verifyUserErrorText));
    }
  }

  /// Function which will send the forget password link to the registered user.
  void _sendPasswordResetLink(
      Store<AppState> store, ForgetPasswordLinkAction action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel commonResponseModel =
          await ForgetPasswordApiCalls.sendForgetPasswordLink(action.forgetPasswordRequestModel);

      if (commonResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(ForgetPasswordLinkErrorAction(
            error: FormBuilderLocalizations.of(action.context).resetLinkErrorText));
      } else {
        store.dispatch(ForgetPasswordLinkSuccessAction(commonResponseModel: commonResponseModel));
        Utils.openSuccessPopup(
            action.context, FormBuilderLocalizations.of(action.context).clickOnLinkText);
      }
    } catch (e) {
      store.dispatch(ForgetPasswordLinkErrorAction(
          error: FormBuilderLocalizations.of(action.context).resetPasswordErrorText));
    }
  }

  /// Function which will reset the password of a existing user.
  void _resetPasswordCall(
      Store<AppState> store, ResetPasswordAction action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel commonResponseModel =
          await ForgetPasswordApiCalls.resetPasswordApi(action.resetPasswordRequestModel);

      if (commonResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(ResetPasswordErrorAction(
            error: FormBuilderLocalizations.of(action.context).cannotResetErrorText));
      } else {
        store.dispatch(ResetPasswordSuccessAction(commonResponseModel: commonResponseModel));
        Utils.openSuccessPopup(
            action.context, FormBuilderLocalizations.of(action.context).passwordResetSuccessText);
      }
    } catch (e) {
      store.dispatch(ResetPasswordErrorAction(
          error: FormBuilderLocalizations.of(action.context).cannotResetErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [CreateUserProfileAction].
  void _createUserProfile(
      Store<AppState> store, CreateUserProfileAction action, NextDispatcher next) async {
    next(action);
    try {
      UserProfileResponseModel profileModel =
          await SignUpApiCalls.createUserProfile(action.userProfileModel);
      if (profileModel?.isSuccessful == true && profileModel?.data?.isNotEmpty == true) {
        store.dispatch(CreateUserProfileSuccessAction(
            userProfileModel: action.userProfileModel, userProfileResponseModel: profileModel));
      } else if (profileModel.errors != null && profileModel.errors.isNotEmpty) {
        store.dispatch(CreateUserProfileErrorAction(error: profileModel.errors[0]));
      } else {
        store.dispatch(CreateUserProfileErrorAction(error: 'Error creating user account'));
      }
    } catch (e) {
      store.dispatch(CreateUserProfileErrorAction(error: 'Error creating user account'));
    }
  }

  /// Function which will hold the logic and api call for the [SendVerifyEmailAction].
  void _sendVerifyEmail(
      Store<AppState> store, SendVerifyEmailAction action, NextDispatcher next) async {
    next(action);
    try {
      VerifyEmailResponseModel verifyEmailResponseModel =
          await SignUpApiCalls.sendEmailVerificationCode(action.sendVerifyMailRequestModel);
      if (verifyEmailResponseModel.isSuccessful && verifyEmailResponseModel.data) {
        store.dispatch(
            SendVerifyEmailSuccessAction(verifyEmailResponseModel: verifyEmailResponseModel));
      } else if (verifyEmailResponseModel.errors != null &&
          verifyEmailResponseModel.errors.isNotEmpty) {
        store.dispatch(SendVerifyEmailErrorAction(error: verifyEmailResponseModel.errors[0]));
      } else {
        store.dispatch(SendVerifyEmailErrorAction(
            error: FormBuilderLocalizations.of(action.context).createAccountErrorText));
      }
    } catch (e) {
      store.dispatch(SendVerifyEmailErrorAction(
          error: FormBuilderLocalizations.of(action.context).createAccountErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [VerifyEmailAction].
  void _verifyEmail(Store<AppState> store, VerifyEmailAction action, NextDispatcher next) async {
    next(action);
    try {
      VerifyEmailResponseModel verifyEmailResponseModel =
          await SignUpApiCalls.verifyEmail(action.verifyEmailModel);
      if (verifyEmailResponseModel.isSuccessful && verifyEmailResponseModel.data) {
        store.dispatch(
          VerifyEmailSuccessAction(
              verifyEmailModel: action.verifyEmailModel,
              verifyEmailResponseModel: verifyEmailResponseModel),
        );
      } else if (!verifyEmailResponseModel.data) {
        store.dispatch(VerifyEmailErrorAction(
            error: FormBuilderLocalizations.of(action.context).enterCorrectCodeErrorText));
      }
    } catch (e) {
      store.dispatch(VerifyEmailErrorAction(
          error: FormBuilderLocalizations.of(action.context).enterCorrectCodeErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [CheckPhoneNumberAction].
  void _checkPhoneNumber(
      Store<AppState> store, CheckPhoneNumberAction action, NextDispatcher next) async {
    next(action);
    try {
      CheckPhoneResponseModel checkPhoneResponseModel =
          await SignUpApiCalls.checkPhoneNumber(action.phoneNumber);
      if (!checkPhoneResponseModel.data) {
        store.dispatch(
            CheckPhoneNumberSuccessAction(checkPhoneResponseModel: checkPhoneResponseModel));
        store.dispatch(
          SendPhoneVerificationAction(
            context: action.context,
            isResend: false,
            sendVerificationPhoneModel: SendVerificationPhoneModel(
              userId: action.userId,
              toNumber: action.phoneNumber.phoneNumber,
              countryCode: action.phoneNumber.countryCode,
            ),
          ),
        );
      } else if (checkPhoneResponseModel.errors != null &&
          checkPhoneResponseModel.errors.isNotEmpty) {
        store.dispatch(CheckPhoneNumberErrorAction(error: checkPhoneResponseModel.errors[0]));
      } else {
        store.dispatch(CheckPhoneNumberErrorAction(
            error: FormBuilderLocalizations.of(action.context).checkNumberErrorText));
      }
    } catch (e) {
      store.dispatch(CheckPhoneNumberErrorAction(
          error: FormBuilderLocalizations.of(action.context).checkNumberErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [SendPhoneVerificationAction].
  void _sendPhoneNumber(
      Store<AppState> store, SendPhoneVerificationAction action, NextDispatcher next) async {
    next(action);
    try {
      PhoneCodeResponseModel phoneCodeResponseModel =
          await SignUpApiCalls.sendPhoneVerification(action.sendVerificationPhoneModel);
      if (phoneCodeResponseModel.isSuccessful) {
        store.dispatch(SendPhoneVerificationSuccessAction(
            sendVerificationPhoneModel: action.sendVerificationPhoneModel,
            phoneCodeResponseModel: phoneCodeResponseModel));
        if (!action.isResend) {
          Utils.navigationWithArguments(action.context, RoutesConstants.verifyPhoneSignUp, {
            RoutesConstantsArguments.userPhoneArgs: action.sendVerificationPhoneModel.toNumber,
            RoutesConstantsArguments.userCountryCodeArgs:
                action.sendVerificationPhoneModel.countryCode,
          });
        }
      } else if (phoneCodeResponseModel.errors != null &&
          phoneCodeResponseModel.errors.isNotEmpty) {
        store.dispatch(SendPhoneVerificationErrorAction(error: phoneCodeResponseModel.errors[0]));
      } else {
        store.dispatch(SendPhoneVerificationErrorAction(
            error: FormBuilderLocalizations.of(action.context).sendCodeErrorText));
      }
    } catch (e) {
      store.dispatch(SendPhoneVerificationErrorAction(
          error: FormBuilderLocalizations.of(action.context).sendCodeErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [VerifyPhoneAction].
  void _verifyPhoneNumber(
      Store<AppState> store, VerifyPhoneAction action, NextDispatcher next) async {
    next(action);
    try {
      VerifyPhoneResponseModel verifyPhoneResponseModel =
          await SignUpApiCalls.verifyPhone(action.verifyPhoneModel);
      if (verifyPhoneResponseModel.isSuccessful && verifyPhoneResponseModel.data) {
        store.dispatch(VerifyPhoneSuccessAction(
            verifyPhoneModel: null, verifyPhoneResponseModel: verifyPhoneResponseModel));
      } else if (verifyPhoneResponseModel.errors != null &&
          verifyPhoneResponseModel.errors.isNotEmpty) {
        store.dispatch(VerifyPhoneErrorAction(error: verifyPhoneResponseModel.errors[0]));
      } else {
        store.dispatch(VerifyPhoneErrorAction(
            error: FormBuilderLocalizations.of(action.context).verifyNumberErrorText));
      }
    } catch (e) {
      store.dispatch(VerifyPhoneErrorAction(
          error: FormBuilderLocalizations.of(action.context).verifyNumberErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [CompleteUserProfileAction].
  void _completeProfile(
      Store<AppState> store, CompleteUserProfileAction action, NextDispatcher next) async {
    next(action);
    try {
      CompleteProfileResponseModel completeProfileResponseModel =
          await SignUpApiCalls.completeProfile(action.completeUserProfileModel);
      if (completeProfileResponseModel.isSuccessful &&
          completeProfileResponseModel?.data?.userId != Constants.nullUser) {
        store.dispatch(CompleteUserProfileSuccessAction(
            completeUserProfileModel: action.completeUserProfileModel,
            completeProfileResponseModel: completeProfileResponseModel));
      } else if (completeProfileResponseModel.errors != null &&
          completeProfileResponseModel.errors.isNotEmpty) {
        store.dispatch(
            CompleteUserProfileErrorAction(error: completeProfileResponseModel.errors[0]));
      } else {
        store.dispatch(CompleteUserProfileErrorAction(
            error: FormBuilderLocalizations.of(action.context).completeProfileErrorText));
      }
    } catch (e) {
      store.dispatch(CompleteUserProfileErrorAction(
          error: FormBuilderLocalizations.of(action.context).completeProfileErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingDataActions].
  void _getOnBoardingData(
      Store<AppState> store, OnBoardingDataActions action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(OnBoardingDataErrorAction(
            error: FormBuilderLocalizations.of(action.context).loginFirstText));
        return;
      }
      OnBoardingDataResponseModel onBoardingDataResponseModel =
          await OnBoardingApiCalls.getOnBoardingData(userId);
      if (onBoardingDataResponseModel.isSuccessful && onBoardingDataResponseModel.data != null) {
        store.dispatch(
            OnBoardingDataSuccessAction(onBoardingDataResponseModel: onBoardingDataResponseModel));
        moveToNextRoute(action.context, action.nextRoute, store);
      } else if (onBoardingDataResponseModel.errors != null &&
          onBoardingDataResponseModel.errors.isNotEmpty) {
        store.dispatch(OnBoardingDataErrorAction(error: onBoardingDataResponseModel.errors[0]));
      } else {
        store.dispatch(OnBoardingDataErrorAction(
            error: FormBuilderLocalizations.of(action.context).onBoardingErrorText));
      }
    } catch (e) {
      store.dispatch(OnBoardingDataErrorAction(
          error: FormBuilderLocalizations.of(action.context).onBoardingErrorText));
    }
  }

  /// Function which takes in the context and route to move user to that particular page on the
  /// base of the api calls.
  void moveToNextRoute(BuildContext context, String nextRoute, Store<AppState> store) {
    OnBoardingData onBoardingData = store.state.onBoardingState.onBoardingDataResponseModel.data;
    switch (nextRoute) {
      case RoutesConstants.onBoardingAddLanguagesScreen:
        if (onBoardingData?.language?.isNotEmpty == true) {
          Utils.navigateTo(context, RoutesConstants.onBoardingLanguagesScreen);
        } else {
          Utils.navigateTo(context, nextRoute);
        }
        break;
      case RoutesConstants.onBoardingLanguagesScreen:
        Utils.navigateReplacement(context, nextRoute);
        break;
      case RoutesConstants.onBoardingEducationScreen:
        Utils.navigateReplacement(context, nextRoute);
        break;
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingClearActions].
  void _onBoardingDataClear(
      Store<AppState> store, OnBoardingClearActions action, NextDispatcher next) async {
    next(action);
    try {
      store.dispatch(OnBoardingClearSuccessAction());
    } catch (e) {
      store.dispatch(OnBoardingClearErrorAction(error: 'Unable to clear the state'));
    }
  }

  /// Function which will hold the logic and api call for the [GetJobServicesActions].
  void _getJobsServices(
      Store<AppState> store, GetJobServicesActions action, NextDispatcher next) async {
    next(action);
    try {
      JobServicesResponseModel jobServicesResponseModel =
          await OnBoardingAddressApiCalls.getJobServices();
      if (jobServicesResponseModel.isSuccessful && jobServicesResponseModel.data.isNotEmpty) {
        store.dispatch(
            GetJobServicesSuccessAction(jobServicesResponseModel: jobServicesResponseModel));
        store.dispatch(OnBoardingDataActions(context: action.context));
      } else if (jobServicesResponseModel.errors != null &&
          jobServicesResponseModel.errors.isNotEmpty) {
        store.dispatch(GetJobServicesErrorAction(error: jobServicesResponseModel.errors[0]));
      } else {
        store.dispatch(GetJobServicesErrorAction(
            error: FormBuilderLocalizations.of(action.context).jobServicesErrorText));
      }
    } catch (e) {
      store.dispatch(GetJobServicesErrorAction(
          error: FormBuilderLocalizations.of(action.context).jobServicesErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [AddOnBoardingAddressActions].
  void _addOnBoardingServices(
      Store<AppState> store, AddOnBoardingAddressActions action, NextDispatcher next) async {
    next(action);
    try {
      OnBoardingAddressResponseModel onBoardingAddressResponseModel =
          await OnBoardingAddressApiCalls.addOnBoardingAddress(
              action.onBoardingAddressRequestModel);
      if (onBoardingAddressResponseModel.isSuccessful &&
          onBoardingAddressResponseModel.data != null) {
        store.dispatch(OnBoardingDataActions(
            context: action.context, nextRoute: RoutesConstants.onBoardingAddLanguagesScreen));
      } else if (onBoardingAddressResponseModel.errors != null &&
          onBoardingAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(
            AddOnBoardingAddressErrorAction(error: onBoardingAddressResponseModel.errors[0]));
      } else {
        store.dispatch(AddOnBoardingAddressErrorAction(
            error: FormBuilderLocalizations.of(action.context).addUpdateAddressErrorText));
      }
    } catch (e) {
      store.dispatch(AddOnBoardingAddressErrorAction(
          error: FormBuilderLocalizations.of(action.context).addUpdateAddressErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingLangEssentialsActions].
  void _onBoardingLanguagesEssentials(
      Store<AppState> store, OnBoardingLangEssentialsActions action, NextDispatcher next) async {
    next(action);
    try {
      LanguagesResponseModel languagesResponseModel = await PostJobLanguagesApiCalls.getLanguages();
      SpecializationsResponseModel specializationsResponseModel =
          await PostJobLanguagesApiCalls.getSpecializations();
      ProficiencyResponseModel proficiencyResponseModel =
          await PostJobVisibilityApiCalls.getProficiency();
      String error = languageEssentialsError(
          languagesResponseModel, specializationsResponseModel, proficiencyResponseModel);
      if (error?.isNotEmpty == true) {
        store.dispatch(OnBoardingLangEssentialsErrorAction(error: error));
      } else {
        store.dispatch(OnBoardingLangEssentialsSuccessAction(
            languageEssentialsModel: LanguageEssentialsModel(
                proficiencyResponseModel: proficiencyResponseModel,
                languagesResponseModel: languagesResponseModel,
                specializationsResponseModel: specializationsResponseModel)));
      }
    } catch (e) {
      store.dispatch(OnBoardingLangEssentialsErrorAction(
          error: FormBuilderLocalizations.of(action.context).languageEssentialsErrorText));
    }
  }

  /// Function which will extract the error for [_onBoardingLanguagesEssentials] and
  /// [_fetchJobLanguagesEssentials]
  String languageEssentialsError(
      LanguagesResponseModel languagesResponseModel,
      SpecializationsResponseModel specializationsResponseModel,
      ProficiencyResponseModel proficiencyResponseModel) {
    if (languagesResponseModel.errors != null && languagesResponseModel.errors.isNotEmpty) {
      return languagesResponseModel.errors[0];
    } else if (specializationsResponseModel.errors != null &&
        specializationsResponseModel.errors.isNotEmpty) {
      return specializationsResponseModel.errors[0];
    } else if (proficiencyResponseModel?.errors?.isNotEmpty == true) {
      return proficiencyResponseModel.errors[0];
    }
    return null;
  }

  /// Function which will hold the logic and api call for the [OnBoardingAddLangActions].
  void _onBoardingAddLanguage(
      Store<AppState> store, OnBoardingAddLangActions action, NextDispatcher next) async {
    next(action);
    try {
      OnBoardingAddLangResponseModel onBoardingAddLangResponseModel =
          await OnBoardingLanguageApiCalls.addOnBoardingLanguageApi(
              action.onBoardingAddLangRequestModel);
      if (onBoardingAddLangResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(
            OnBoardingAddLangErrorAction(error: onBoardingAddLangResponseModel.errors[0]));
      } else {
        store.dispatch(OnBoardingAddLangSuccessAction(
            onBoardingAddLangResponseModel: onBoardingAddLangResponseModel));
        store.dispatch(OnBoardingDataActions(
            context: action.context, nextRoute: RoutesConstants.onBoardingLanguagesScreen));
      }
    } catch (e) {
      store.dispatch(OnBoardingLangEssentialsErrorAction(
          error: FormBuilderLocalizations.of(action.context).languageAddErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingDeleteLangActions].
  void _onBoardingDeleteLanguage(
      Store<AppState> store, OnBoardingDeleteLangActions action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel commonResponseModel =
          await OnBoardingLanguageApiCalls.deleteOnBoardingLanguage(action.languageId);
      if (commonResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(OnBoardingDeleteLangErrorAction(error: commonResponseModel.errors[0]));
      } else {
        store.dispatch(OnBoardingDeleteLangSuccessAction(commonResponseModel: commonResponseModel));
        store.dispatch(OnBoardingDataActions(context: action.context));
      }
    } catch (e) {
      store.dispatch(OnBoardingDeleteLangErrorAction(
          error: FormBuilderLocalizations.of(action.context).languageDeleteErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingAddEduActions].
  void _onBoardingAddEducation(
      Store<AppState> store, OnBoardingAddEduActions action, NextDispatcher next) async {
    next(action);
    try {
      DocumentUploadResponseModel documentUploadResponseModel;
      if (action?.documentsList?.isNotEmpty == true) {
        documentUploadResponseModel = await OnBoardingApiCalls.addFileDocument(
            DocumentUploadRequestModel(fileOrDocumentInformations: action.documentsList));
      }
      if (documentUploadResponseModel?.isSuccessful == true &&
          documentUploadResponseModel?.data?.fileOrDocumentInformations?.isNotEmpty == true) {
        action.addEducationRequestModel[0].fileOrDocumentId =
            documentUploadResponseModel.data.fileOrDocumentInformations[0].fileDocumentId;
      }
      OnBoardingEducationResponseModel onBoardingEducationResponseModel =
          await OnBoardingEducationApiCalls.addOnBoardingEducationApi(
              action.addEducationRequestModel);

      if (onBoardingEducationResponseModel?.isSuccessful == true) {
        store.dispatch(OnBoardingAddEduSuccessAction(
            addEducationResponseModel: onBoardingEducationResponseModel));
        store.dispatch(OnBoardingDataActions(
            context: action.context, nextRoute: RoutesConstants.onBoardingEducationScreen));
      } else if (onBoardingEducationResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(
            OnBoardingAddEduErrorAction(error: onBoardingEducationResponseModel.errors[0]));
      }
    } catch (e) {
      store.dispatch(OnBoardingAddEduErrorAction(
          error: FormBuilderLocalizations.of(action.context).addEducationErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingDeleteEduActions].
  void _onBoardingDeleteEducation(
      Store<AppState> store, OnBoardingDeleteEduActions action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel commonResponseModel =
          await OnBoardingEducationApiCalls.deleteOnBoardingEducation(action.educationId);
      if (commonResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(OnBoardingDeleteEduErrorAction(error: commonResponseModel.errors[0]));
      } else {
        store.dispatch(OnBoardingDeleteEduSuccessAction(commonResponseModel: commonResponseModel));
        store.dispatch(OnBoardingDataActions(context: action.context));
      }
    } catch (e) {
      store.dispatch(OnBoardingDeleteEduErrorAction(
          error: FormBuilderLocalizations.of(action.context).deleteEducationErrorText));
    }
  }

  /// Function which will fetch the list of translate employment list.
  void _onBoardingEmploymentTypeList(Store<AppState> store,
      OnBoardingEmploymentTypesFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      EmploymentTypeResponseModel modelList =
          await OnBoardingExperienceApiCalls.getEmploymentTypes();
      if (modelList?.isSuccessful == true && modelList?.data?.isNotEmpty == true) {
        store.dispatch(
            OnBoardingEmploymentTypesSuccessAction(employmentTypeResponseModel: modelList));
      } else {
        store.dispatch(OnBoardingEmploymentTypesErrorAction(
            error: FormBuilderLocalizations.of(action.context).employmentErrorText));
      }
    } catch (e) {
      store.dispatch(OnBoardingEmploymentTypesErrorAction(
          error: FormBuilderLocalizations.of(action.context).employmentErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingAddExpActions].
  void _onBoardingAddExperience(
      Store<AppState> store, OnBoardingAddExpActions action, NextDispatcher next) async {
    next(action);
    try {
      DocumentUploadResponseModel documentUploadResponseModel;
      if (action?.documentsList?.isNotEmpty == true) {
        documentUploadResponseModel = await OnBoardingApiCalls.addFileDocument(
            DocumentUploadRequestModel(fileOrDocumentInformations: action.documentsList));
      }
      if (documentUploadResponseModel?.isSuccessful == true &&
          documentUploadResponseModel?.data?.fileOrDocumentInformations?.isNotEmpty == true) {
        action.onBoardingExperienceRequestModel.fileOrDocumentId =
            documentUploadResponseModel.data.fileOrDocumentInformations[0].fileDocumentId;
      }
      OnBoardingExperienceResponseModel onBoardingExperienceResponseModel =
          await OnBoardingExperienceApiCalls.addOnBoardingExperienceApi(
              action.onBoardingExperienceRequestModel);

      if (onBoardingExperienceResponseModel?.isSuccessful == true) {
        store.dispatch(OnBoardingAddExpSuccessAction(
            onBoardingExperienceResponseModel: onBoardingExperienceResponseModel));
        store.dispatch(OnBoardingDataActions(
            context: action.context, nextRoute: RoutesConstants.onBoardingExperienceScreen));
      } else if (onBoardingExperienceResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(
            OnBoardingAddExpErrorAction(error: onBoardingExperienceResponseModel.errors[0]));
      }
    } catch (e) {
      store.dispatch(OnBoardingAddExpErrorAction(
          error: FormBuilderLocalizations.of(action.context).addExperienceErrorText));
    }
  }

  /// Function which will hold the logic and api call for the [OnBoardingDeleteExpActions].
  void _onBoardingDeleteExperience(
      Store<AppState> store, OnBoardingDeleteExpActions action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel commonResponseModel =
          await OnBoardingExperienceApiCalls.deleteOnBoardingExperience(action.experienceId);
      if (commonResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(OnBoardingDeleteExpErrorAction(error: commonResponseModel.errors[0]));
      } else {
        store.dispatch(OnBoardingDeleteExpSuccessAction(commonResponseModel: commonResponseModel));
        store.dispatch(OnBoardingDataActions(context: action.context));
      }
    } catch (e) {
      store.dispatch(OnBoardingDeleteExpErrorAction(
          error: FormBuilderLocalizations.of(action.context).deleteExperienceErrorText));
    }
  }

  /// Function which will fetch the data for the payment history async.
  /// TODO - Will have to add the api logic for this function.
  void _paymentHistoryFetch(
      Store<AppState> store, PaymentHistoryFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      var paymentHistoryModel =
          await paymentHistoryApiCalls.getPaymentHistory(action.limit, action.startingAfter);
      if (paymentHistoryModel.error != null) {
        store.dispatch(PaymentHistoryErrorAction(error: paymentHistoryModel.error));
      } else {
        store.dispatch(PaymentHistorySuccessAction(paymentHistoryModel: paymentHistoryModel));
      }
    } catch (e) {
      store.dispatch(PaymentHistoryErrorAction(error: PaymentHistoryError(message: e.toString())));
    }
  }

  /// Function which will let user fetch the job description.
  void _fetchJobsList(
      Store<AppState> store, PostedJobListFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(PostedJobListErrorAction(error: 'Please login first.'));
        return;
      }
      JobsListResponseModel jobsList =
          await PostedJobApiCalls.getJobsList(action.postedJobsRequestModel);

      if (jobsList?.errors?.isNotEmpty == true && jobsList?.data == null) {
        store.dispatch(PostedJobListErrorAction(error: jobsList.errors[0]));
      } else {
        store.dispatch(PostedJobListSuccessAction(jobReviewResponseModel: jobsList));
      }
    } catch (e) {
      store.dispatch(PostedJobListErrorAction(error: 'Error in fetching job review data.'));
    }
  }

  /// Function which will fetch the current navigation list.
  void _drawerDataFetch(Store<AppState> store, DrawerDataFetchAction action, NextDispatcher next) {
    next(action);
    try {
      if (store.state.postJobsState.jobsPostList.isNotEmpty) {
        store.dispatch(
            DrawerDataSuccessAction(jobsPostList: store.state.postJobsState.jobsPostList));
      } else {
        List<PostJobsStatusModel> tempList = [];
        PostJobsModulesList.values.map((e) {
          tempList.add(PostJobsStatusModel(describeEnum(e), false));
          if (e.index == PostJobsModulesList.values.length - 1) {
            store.dispatch(DrawerDataSuccessAction(jobsPostList: tempList));
          }
        }).toList();
      }
    } catch (e) {
      store.dispatch(DrawerDataErrorAction(error: 'Error fetching drawer data.'));
    }
  }

  /// Function which will change the state of the current page.
  void _changeCurrentPage(
      Store<AppState> store, ChangeCurrentPageAction action, NextDispatcher next) {
    next(action);
    try {
      store.dispatch(ChangeCurrentPageSuccessAction(newPage: action.currentPage));
    } catch (e) {
      store.dispatch(ChangeCurrentPageErrorAction(error: 'Error changing current page.'));
    }
  }

  /// Function which will let user move forward and change the state of the current model.
  void _moveForward(Store<AppState> store, MoveForwardAction action, NextDispatcher next) {
    next(action);
    try {
      PostJobsState currentState = store.state.postJobsState;
      currentState.jobsPostList[currentState.currentPage].moduleDoneStatus = true;
      store.dispatch(MoveForwardSuccessAction(jobsPostList: currentState.jobsPostList));
    } catch (e) {
      store.dispatch(MoveForwardErrorAction(error: 'Error moving forward.'));
    }
  }

  /// Function which will let user backward forward and change the state of the current model.
  void _moveBackward(Store<AppState> store, MoveBackwardAction action, NextDispatcher next) {
    next(action);
    try {
      store.dispatch(MoveBackwardSuccessAction());
    } catch (e) {
      store.dispatch(MoveBackwardErrorAction(error: 'Error moving forward.'));
    }
  }

  /// Function which will let user fetch the job services.
  void _fetchJobServices(
      Store<AppState> store, JobServicesFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      PostJobServicesResponseModel jobServicesResponseModel =
          await PostJobDescriptionApiCalls.getJobServices();
      if (jobServicesResponseModel.isSuccessful && jobServicesResponseModel.data != null) {
        store.dispatch(
            JobServicesFetchSuccessAction(jobServicesResponseModel: jobServicesResponseModel));
        if (action.jobId != null && action.jobId.isNotEmpty) {
          store.dispatch(JobDescriptionFetchAction(jobId: action.jobId));
        }
      } else if (jobServicesResponseModel.errors != null &&
          jobServicesResponseModel.errors.isNotEmpty) {
        store.dispatch(JobServicesFetchErrorAction(error: jobServicesResponseModel.errors[0]));
      } else {
        store.dispatch(JobServicesFetchErrorAction(error: 'Cannot fetch the job services'));
      }
    } catch (e) {
      store.dispatch(JobServicesFetchErrorAction(error: 'Cannot fetch the job services'));
    }
  }

  /// Function which will let user fetch the job description.
  void _fetchJobDescription(
      Store<AppState> store, JobDescriptionFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      JobDescriptionResponseModel jobDescriptionResponseModel =
          await PostJobDescriptionApiCalls.getJobDescription(action.jobId);

      if (jobDescriptionResponseModel.isSuccessful && jobDescriptionResponseModel.data != null) {
        store.dispatch(JobDescriptionFetchSuccessAction(
            jobDescriptionResponseModel: jobDescriptionResponseModel));
      } else if (jobDescriptionResponseModel.errors != null &&
          jobDescriptionResponseModel.errors.isNotEmpty) {
        store
            .dispatch(JobDescriptionFetchErrorAction(error: jobDescriptionResponseModel.errors[0]));
      } else {
        store.dispatch(JobDescriptionFetchErrorAction(error: 'Cannot fetch the job description'));
      }
    } catch (e) {
      store.dispatch(JobDescriptionFetchErrorAction(error: 'Cannot fetch the job description'));
    }
  }

  /// Function which will let user add/update the job description.
  void _addUpdateJobDescription(
      Store<AppState> store, JobDescriptionAddUpdateAction action, NextDispatcher next) async {
    next(action);
    try {
      DocumentUploadResponseModel jobImageUploadResponseModel;
      if (action?.imagesList?.isNotEmpty == true) {
        jobImageUploadResponseModel = await OnBoardingApiCalls.addFileDocument(
            DocumentUploadRequestModel(fileOrDocumentInformations: action.imagesList));
      }
      if (jobImageUploadResponseModel?.isSuccessful == true &&
          jobImageUploadResponseModel?.data?.fileOrDocumentInformations?.isNotEmpty == true) {
        action.jobDescriptionRequestModel.fileDocumentIds = jobImageUploadResponseModel
            .data.fileOrDocumentInformations
            .map((e) => e.fileDocumentId)
            .toList();
      }
      JobDescriptionResponseModel jobDescriptionResponseModel =
          await PostJobDescriptionApiCalls.addUpdateJobDescription(
              action.jobDescriptionRequestModel);
      if (jobDescriptionResponseModel.isSuccessful && jobDescriptionResponseModel.data != null) {
        store.dispatch(MoveForwardAction());
        store.dispatch(JobDescriptionAddUpdateSuccessAction(
            jobDescriptionResponseModel: jobDescriptionResponseModel));
      } else if (jobDescriptionResponseModel.errors != null &&
          jobDescriptionResponseModel.errors.isNotEmpty) {
        store.dispatch(
            JobDescriptionAddUpdateErrorAction(error: jobDescriptionResponseModel.errors[0]));
      } else {
        store.dispatch(
            JobDescriptionAddUpdateErrorAction(error: 'Cannot add/update the job description'));
      }
    } catch (e) {
      store.dispatch(
          JobDescriptionAddUpdateErrorAction(error: 'Cannot add/update the job description'));
    }
  }

  /// Function which will let user fetch the job languages essentials.
  void _fetchJobLanguagesEssentials(
      Store<AppState> store, LanguagesEssentialsFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      LanguagesResponseModel languagesResponseModel = await PostJobLanguagesApiCalls.getLanguages();
      SpecializationsResponseModel specializationsResponseModel =
          await PostJobLanguagesApiCalls.getSpecializations();
      String error =
          languageEssentialsError(languagesResponseModel, specializationsResponseModel, null);
      if (error == null || error.isEmpty) {
        if (action.jobId != null && action.jobId.isNotEmpty) {
          store.dispatch(JobLanguagesFetchAction(jobId: action.jobId));
        }
        store.dispatch(
          LanguagesEssentialsFetchSuccessAction(
              languagesResponseModel: languagesResponseModel,
              specializationsResponseModel: specializationsResponseModel),
        );
      } else {
        store.dispatch(LanguagesEssentialsFetchErrorAction(error: error));
      }
    } catch (e) {
      store.dispatch(LanguagesEssentialsFetchErrorAction(
          error: 'Cannot fetch the job languages essential services.'));
    }
  }

  /// Function which will let user fetch the job languages.
  void _fetchJobLanguages(
      Store<AppState> store, JobLanguagesFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      JobLanguagesResponseModel jobLanguagesResponseModel =
          await PostJobLanguagesApiCalls.getJobLanguages(action.jobId);
      String error = fetchJobErrorCheck(jobLanguagesResponseModel);
      if (error?.isEmpty == true) {
        store.dispatch(
            JobLanguagesFetchSuccessAction(jobLanguagesResponseModel: jobLanguagesResponseModel));
      } else {
        store.dispatch(JobLanguagesFetchErrorAction(error: error));
      }
    } catch (e) {
      store.dispatch(JobLanguagesFetchErrorAction(error: 'Cannot fetch the job languages'));
    }
  }

  /// Function which will extract the error for the [_fetchJobLanguages]
  String fetchJobErrorCheck(JobLanguagesResponseModel jobLanguagesResponseModel) {
    if (jobLanguagesResponseModel?.errors?.isNotEmpty == true) {
      return jobLanguagesResponseModel.errors[0];
    } else if (jobLanguagesResponseModel?.isSuccessful == false ||
        jobLanguagesResponseModel?.data?.fromLanguage == null ||
        jobLanguagesResponseModel?.data?.toLanguage == null) {
      return "No data selected yet.";
    }
    return '';
  }

  /// Function which will let user add/update the job languages.
  void _addUpdateJobLanguages(
      Store<AppState> store, AddUpdateJobLanguagesAction action, NextDispatcher next) async {
    next(action);
    try {
      JobLanguagesResponseModel jobLanguagesResponseModel =
          await PostJobLanguagesApiCalls.addUpdateJobLanguages(action.jobLanguagesRequestModel);
      if (jobLanguagesResponseModel?.isSuccessful == true &&
          jobLanguagesResponseModel?.data != null) {
        store.dispatch(MoveForwardAction());
        store.dispatch(AddUpdateJobLanguagesSuccessAction(
            jobLanguagesResponseModel: jobLanguagesResponseModel));
      } else if (jobLanguagesResponseModel.errors != null &&
          jobLanguagesResponseModel.errors.isNotEmpty) {
        store
            .dispatch(AddUpdateJobLanguagesErrorAction(error: jobLanguagesResponseModel.errors[0]));
      } else {
        store.dispatch(
            AddUpdateJobLanguagesErrorAction(error: 'Cannot add/update the job language'));
      }
    } catch (e) {
      store.dispatch(AddUpdateJobLanguagesErrorAction(error: 'Cannot add/update the job language'));
    }
  }

  /// Function which will hold the logic and api call for the [PostJobLocalityFetchAction].
  void _postJobAddressData(
      Store<AppState> store, PostJobLocalityFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientAddressResponseModel postJobAddressResponseModel =
          await PostJobLocationApiCalls.getPostJobsAddress(action.jobId);
      if (postJobAddressResponseModel.errors != null &&
          postJobAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(
            PostJobLocalityFetchErrorAction(error: postJobAddressResponseModel.errors[0]));
      } else {
        store.dispatch(PostJobLocalityFetchSuccessAction(
            userAddressResponseModel: postJobAddressResponseModel));
      }
    } catch (e) {
      store.dispatch(PostJobLocalityFetchErrorAction(error: 'Error in fetching post job address.'));
    }
  }

  /// Function which will hold the logic and api call for the [PostJobLocalityAddAction].
  void _postJobAddAddressData(
      Store<AppState> store, PostJobLocalityAddAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientAddressResponseModel postJobAddAddressResponseModel =
          await PostJobLocationApiCalls.addPostJobAddress(action.jobId,
              addressCreateRequestModel: action.addressCreateRequestModel);
      if (postJobAddAddressResponseModel.errors != null &&
          postJobAddAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(
            PostJobLocalityAddErrorAction(error: postJobAddAddressResponseModel.errors[0]));
      } else {
        store.dispatch(MoveForwardAction());
        store.dispatch(PostJobLocalityAddSuccessAction(
            userAddressResponseModel: postJobAddAddressResponseModel));
      }
    } catch (e) {
      store.dispatch(PostJobLocalityAddErrorAction(error: 'Error in adding post job address.'));
    }
  }

  /// Function which will hold the logic and api call for the [PostJobLocalityUpdateAction].
  void _postJobUpdateAddressData(
      Store<AppState> store, PostJobLocalityUpdateAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientAddressResponseModel clientAddressResponseModel =
          store.state.postJobLocalityState.clientAddressResponseModel;
      if (clientAddressResponseModel != null &&
          clientAddressResponseModel.data != null &&
          clientAddressResponseModel.data.addressId.isNotEmpty) {
        clientAddressResponseModel = await PostJobLocationApiCalls.updatePostJobAddress(
            clientAddressResponseModel.data.addressId,
            addressCreateRequestModel: action.addressCreateRequestModel);
      }

      if (clientAddressResponseModel.errors != null &&
          clientAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(
            PostJobLocalityUpdateErrorAction(error: clientAddressResponseModel.errors[0]));
      } else {
        store.dispatch(MoveForwardAction());
        store.dispatch(PostJobLocalityUpdateSuccessAction(
            userAddressResponseModel: clientAddressResponseModel));
      }
    } catch (e) {
      store
          .dispatch(PostJobLocalityUpdateErrorAction(error: 'Error in updating post job address.'));
    }
  }

  /// Function which will hold the logic and api call for the [JobVisibilityEssentialsAction].
  void _jobVisibilityEssentialsData(
      Store<AppState> store, JobVisibilityEssentialsAction action, NextDispatcher next) async {
    next(action);
    try {
      JobStatesResponseModel jobStatesResponseModel = await PostJobVisibilityApiCalls.getStates();
      SpecializationsResponseModel specializationsResponseModel =
          await PostJobVisibilityApiCalls.getSpecializations();
      ProficiencyResponseModel jobProficiencyResponseModel =
          await PostJobVisibilityApiCalls.getProficiency();
      String error = checkJobEssentialsErrors(
          jobStatesResponseModel, specializationsResponseModel, jobProficiencyResponseModel);
      if (error == null || error.isEmpty) {
        store.dispatch(JobVisibilityEssentialsSuccessAction(
            jobStatesResponseModel: jobStatesResponseModel,
            jobProficiencyResponseModel: jobProficiencyResponseModel,
            specializationsResponseModel: specializationsResponseModel));
        if (action.jobId != null && action.jobId.isNotEmpty) {
          store.dispatch(JobVisibilityFetchAction(jobId: action.jobId));
        }
      } else {
        store.dispatch(JobVisibilityEssentialsErrorAction(error: error));
      }
    } catch (e) {
      store.dispatch(JobVisibilityEssentialsErrorAction(
          error: 'Error in fetching job visibility essentials.'));
    }
  }

  String checkJobEssentialsErrors(
      JobStatesResponseModel jobStatesResponseModel,
      SpecializationsResponseModel specializationsResponseModel,
      ProficiencyResponseModel jobProficiencyResponseModel) {
    if (jobStatesResponseModel?.errors?.isNotEmpty == true) {
      return jobStatesResponseModel.errors[0];
    } else if (specializationsResponseModel?.errors?.isNotEmpty == true) {
      return specializationsResponseModel.errors[0];
    } else if (jobProficiencyResponseModel?.errors?.isNotEmpty == true) {
      return jobProficiencyResponseModel.errors[0];
    }
    return null;
  }

  /// Function which will hold the logic and api call for the [JobVisibilityFetchAction].
  void _jobVisibilityData(
      Store<AppState> store, JobVisibilityFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      JobVisibilityResponseModel jobVisibilityResponseModel =
          await PostJobVisibilityApiCalls.getJobVisibility(action.jobId);

      if (jobVisibilityResponseModel?.errors?.isNotEmpty == true &&
          jobVisibilityResponseModel?.data == null) {
        store.dispatch(JobVisibilityFetchErrorAction(error: jobVisibilityResponseModel.errors[0]));
      } else {
        store.dispatch(JobVisibilityFetchSuccessAction(
            jobVisibilityResponseModel: jobVisibilityResponseModel));
      }
    } catch (e) {
      store
          .dispatch(JobVisibilityFetchErrorAction(error: 'Error in fetching job visibility data.'));
    }
  }

  /// Function which will hold the logic and api call for the [AddJobVisibilityAction].
  void _addUpdateJobVisibilityData(
      Store<AppState> store, AddJobVisibilityAction action, NextDispatcher next) async {
    next(action);
    try {
      JobVisibilityResponseModel jobVisibilityResponseModel =
          await PostJobVisibilityApiCalls.addUpdateJobVisibility(action.jobVisibilityRequestModel);

      if (jobVisibilityResponseModel?.errors?.isNotEmpty == true &&
          jobVisibilityResponseModel?.data == null) {
        store.dispatch(AddJobVisibilityErrorAction(error: jobVisibilityResponseModel.errors[0]));
      } else {
        store.dispatch(
            AddJobVisibilitySuccessAction(jobVisibilityResponseModel: jobVisibilityResponseModel));
        store.dispatch(MoveForwardAction());
      }
    } catch (e) {
      store
          .dispatch(AddJobVisibilityErrorAction(error: 'Error in add/update job visibility data.'));
    }
  }

  /// Function which will hold the logic and api call for the [PostJobScheduleFetchAction].
  void _jobScheduleData(
      Store<AppState> store, PostJobScheduleFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      JobScheduleResponseModel jobScheduleResponseModel =
          await PostJobScheduleApiCalls.getSchedules(action.jobId);

      if (jobScheduleResponseModel?.errors?.isNotEmpty == true &&
          jobScheduleResponseModel?.data == null) {
        store.dispatch(PostJobScheduleFetchErrorAction(error: jobScheduleResponseModel.errors[0]));
      } else {
        store.dispatch(
            PostJobScheduleFetchSuccessAction(jobScheduleResponseModel: jobScheduleResponseModel));
      }
    } catch (e) {
      store
          .dispatch(PostJobScheduleFetchErrorAction(error: 'Error in fetching job schedule data.'));
    }
  }

  /// Function which will hold the logic and api call for the [AddJobScheduleAction].
  void _jobScheduleAddUpdate(
      Store<AppState> store, AddJobScheduleAction action, NextDispatcher next) async {
    next(action);
    try {
      JobScheduleResponseModel jobScheduleResponseModel =
          await PostJobScheduleApiCalls.addUpdateSchedules(action.jobScheduleRequestModel);

      if (jobScheduleResponseModel?.errors?.isNotEmpty == true &&
          jobScheduleResponseModel?.data == null) {
        store.dispatch(AddJobScheduleErrorAction(error: jobScheduleResponseModel.errors[0]));
      } else {
        store.dispatch(
            AddJobScheduleSuccessAction(jobScheduleResponseModel: jobScheduleResponseModel));
        store.dispatch(MoveForwardAction());
      }
    } catch (e) {
      store.dispatch(
          AddJobScheduleErrorAction(error: 'Error in adding/updating job schedule data.'));
    }
  }

  /// Function which will hold the logic and api call for the [PostJobReviewFetchAction].
  void _jobReviewData(
      Store<AppState> store, PostJobReviewFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      JobReviewResponseModel jobReviewResponseModel =
          await PostJobReviewApiCalls.getReview(action.jobId);

      if (jobReviewResponseModel?.errors?.isNotEmpty == true &&
          jobReviewResponseModel?.data == null) {
        store.dispatch(PostJobReviewFetchErrorAction(error: jobReviewResponseModel.errors[0]));
      } else {
        store.dispatch(
            PostJobReviewFetchSuccessAction(jobReviewResponseModel: jobReviewResponseModel));
      }
    } catch (e) {
      store.dispatch(PostJobReviewFetchErrorAction(error: 'Error in fetching job review data.'));
    }
  }

  /// Function which will hold the logic and api call for the [SetJobReviewAction].
  void _setJobReview(Store<AppState> store, SetJobReviewAction action, NextDispatcher next) async {
    next(action);
    try {
      print("The job id ---> ${action.jobId}");
      CommonResponseModel commonResponseModel = await PostedJobApiCalls.setReviewJob(action.jobId);

      if (commonResponseModel?.errors?.isNotEmpty == true && commonResponseModel?.data == null) {
        showMessageToast(context: null, message: commonResponseModel.errors[0]);
      } else {
        showMessageToast(context: null, message: "Job now listed.");
        Navigator.of(action.context).pop();
      }
    } catch (e) {
      store.dispatch(PostJobReviewFetchErrorAction(error: 'Error in setting review data.'));
    }
  }

  /// Function which will fetch the current navigation list.
  /// TODO - Will have to add the localization for this, if data not from api.
  void _translateDrawerDataFetch(
      Store<AppState> store, TranslateDrawerDataFetchAction action, NextDispatcher next) {
    next(action);
    try {
      if (store.state.translateState.translateDrawerList.isNotEmpty) {
        store.dispatch(TranslateDrawerDataSuccessAction(
            translateDrawerList: store.state.translateState.translateDrawerList));
      } else {
        List<String> tempList = [
          'Profile',
          'Language',
          'Experience',
          'Education',
          'Identification',
          'Jobs',
          'Contracts',
          'Scheduling',
          'Earnings',
          'Tax'
        ];
        store.dispatch(TranslateDrawerDataSuccessAction(translateDrawerList: tempList));
      }
    } catch (e) {
      store.dispatch(TranslateDrawerDataErrorAction(error: 'Error fetching drawer data.'));
    }
  }

  /// Function which will change the state of the current translate page.
  void _changeTranslatePage(
      Store<AppState> store, ChangeTranslatePageAction action, NextDispatcher next) {
    next(action);
    try {
      store.dispatch(ChangeTranslatePageSuccessAction(newPage: action.currentPage));
    } catch (e) {
      store.dispatch(ChangeTranslatePageErrorAction(error: 'Error changing current page.'));
    }
  }

  /// Function which will fetch the list of translate employment list.
  void _employmentTypeList(
      Store<AppState> store, EmploymentTypesFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      EmploymentTypeResponseModel modelList =
          await TranslatorExperienceApiCalls.getEmploymentTypes();
      if (modelList?.isSuccessful == true && modelList?.data?.isNotEmpty == true) {
        store.dispatch(EmploymentTypesSuccessAction(employmentTypeResponseModel: modelList));
      } else {
        store.dispatch(EmploymentTypesErrorAction(error: 'Error fetching translate employment.'));
      }
    } catch (e) {
      store.dispatch(EmploymentTypesErrorAction(error: 'Error fetching translate employment.'));
    }
  }

  /// Function which will fetch the list of translate experience list.
  void _translateExperienceList(
      Store<AppState> store, TranslateExperienceFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(TranslateExperienceErrorAction(error: 'Please login first.'));
        return;
      }
      ExperienceListResponseModel experienceListResponseModel =
          await TranslatorExperienceApiCalls.getExperienceList(userId);

      if (experienceListResponseModel?.isSuccessful == true &&
          experienceListResponseModel?.data?.isNotEmpty == true) {
        store.dispatch(TranslateExperienceSuccessAction(
            experienceListResponseModel: experienceListResponseModel));
      } else {
        store.dispatch(
            TranslateExperienceErrorAction(error: 'Error fetching translate experience section.'));
      }
    } catch (e) {
      store.dispatch(
          TranslateExperienceErrorAction(error: 'Error fetching translate experience section.'));
    }
  }

  /// Function which will add the experience to the local list for now.
  void _addUpdateTranslateExperience(
      Store<AppState> store, AddUpdateExperienceAction action, NextDispatcher next) async {
    next(action);
    try {
      AddUpdateExperienceResponseModel addUpdateExperienceResponseModel =
          await TranslatorExperienceApiCalls.addUpdateExperienceList(action.model);
      if (addUpdateExperienceResponseModel?.isSuccessful == true &&
          addUpdateExperienceResponseModel?.data != null) {
        showMessageToast(context: null, message: "Add/update successful");
        store.dispatch(TranslateExperienceFetchAction());
      } else {
        showMessageToast(context: null, message: "Error in add/update translator experience");
      }
    } catch (e) {
      store.dispatch(
          AddUpdateExperienceErrorAction(error: 'Error adding translate experience section.'));
    }
  }

  /// Function which will fetch the list of translate language list.
  void _languageList(
      Store<AppState> store, TranslateLanguageFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(TranslateLanguageErrorAction(error: 'Please login first.'));
        return;
      }
      TranslatorLanguageListResponse languageListResponse =
          await TranslatorLanguageApiCalls.getLanguageList(userId);
      if (languageListResponse?.isSuccessful == true &&
          languageListResponse?.data?.isNotEmpty == true) {
        store.dispatch(
            TranslateLanguageSuccessAction(translatorLanguageListResponse: languageListResponse));
      } else {
        store.dispatch(TranslateLanguageErrorAction(error: 'Error fetching translate language.'));
      }
    } catch (e) {
      store.dispatch(TranslateLanguageErrorAction(error: 'Error fetching translate language.'));
    }
  }

  /// Function which will add/update the translator language.
  void _addUpdateTranslateLanguage(
      Store<AppState> store, AddUpdateTranslateLanguageAction action, NextDispatcher next) async {
    next(action);
    try {
      AddUpdateLanguageResponse addUpdateLanguageResponse =
          await TranslatorLanguageApiCalls.addUpdateLanguageList(action.addUpdateLanguageRequest);
      if (addUpdateLanguageResponse?.isSuccessful == true &&
          addUpdateLanguageResponse?.data != null) {
        showMessageToast(context: null, message: "Add/update successful");
        store.dispatch(TranslateLanguageFetchAction());
      } else {
        showMessageToast(context: null, message: "Error in add/update translator language");
      }
    } catch (e) {
      store.dispatch(
          AddUpdateExperienceErrorAction(error: 'Error adding translate language section.'));
    }
  }

  /// Function which will delete the translator language.
  void _deleteTranslateLanguage(
      Store<AppState> store, DeleteTranslateLanguageAction action, NextDispatcher next) async {
    next(action);
    try {
      DeleteLanguageResponseModel deleteLanguageResponseModel =
          await TranslatorLanguageApiCalls.deleteLanguage(action.languageId);
      if (deleteLanguageResponseModel?.isSuccessful == true) {
        showMessageToast(context: null, message: "Delete successful");
        store.dispatch(TranslateLanguageFetchAction());
      } else {
        showMessageToast(context: null, message: "Error in deleting translator language");
      }
    } catch (e) {
      store.dispatch(
          AddUpdateExperienceErrorAction(error: 'Error adding translate language section.'));
    }
  }

  /// Function which will fetch the list of translate education list.
  void _translateEducationList(
      Store<AppState> store, TranslateEducationFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(TranslateEducationErrorAction(error: 'Please login first.'));
        return;
      }
      EducationListResponseModel modelList =
          await TranslatorEducationApiCalls.getEducationList(userId);
      store.dispatch(TranslateEducationSuccessAction(translateEducationModel: modelList));
    } catch (e) {
      store.dispatch(
          TranslateEducationErrorAction(error: 'Error fetching translate education section.'));
    }
  }

  /// Function which will add the education to the local list for now.
  void _addTranslateEducation(
      Store<AppState> store, AddUpdateEducationAction action, NextDispatcher next) async {
    next(action);
    try {
      AddUpdateEducationResponseModel addUpdateEducationResponseModel =
          await TranslatorEducationApiCalls.addUpdateEducationList(action.model);
      if (addUpdateEducationResponseModel?.isSuccessful == true &&
          addUpdateEducationResponseModel?.data != null) {
        showMessageToast(context: null, message: "Add/update successful");
        store.dispatch(TranslateEducationFetchAction());
      } else {
        showMessageToast(context: null, message: "Error in add/update translator education");
      }
    } catch (e) {
      store.dispatch(AddEducationErrorAction(error: 'Error adding translate education section.'));
    }
  }

  /// Function which will fetch the list of translate identification list.
  void _translateIdentificationList(
      Store<AppState> store, TranslateIdentificationFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(TranslateIdentificationErrorAction(error: 'Please login first.'));
        return;
      }
      AddIdentificationResponseModel model =
          await TranslatorIdentificationApiCalls.getIdentification(userId);
      store.dispatch(TranslateIdentificationSuccessAction(addIdentificationResponseModel: model));
    } catch (e) {
      store.dispatch(TranslateIdentificationErrorAction(
          error: 'Error fetching translate identification section.'));
    }
  }

  /// Function which will add the identification.
  void _addTranslateIdentification(
      Store<AppState> store, AddTranslateIdentificationAction action, NextDispatcher next) async {
    next(action);
    try {
      AddIdentificationResponseModel addIdentificationResponseModel =
          await TranslatorIdentificationApiCalls.addIdentification(
              action.addIdentificationRequestModel);
      if (addIdentificationResponseModel?.isSuccessful == true &&
          addIdentificationResponseModel?.data != null) {
        showMessageToast(context: null, message: "Add/update successful");
        store.dispatch(TranslateIdentificationFetchAction());
      } else {
        showMessageToast(context: null, message: "Error in add/update translator identification");
      }
    } catch (e) {
      store.dispatch(TranslateIdentificationErrorAction(
          error: 'Error adding translate identification section.'));
    }
  }

  /// Function which will fetch the jobs list for now.
  void _fetchTranslatorJobsList(
      Store<AppState> store, TranslateJobsFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      TranslatorJobsResponse translatorJobsResponse =
          await TranslatorJobsApiCalls.fetchTranslatorJobs(action.translatorJobsRequest);

      if (translatorJobsResponse?.isSuccessful == true &&
          translatorJobsResponse?.data?.records?.isNotEmpty == true) {
        store.dispatch(TranslateJobsSuccessAction(translatorJobsResponse: translatorJobsResponse));
      } else if (translatorJobsResponse?.errors?.isNotEmpty == true) {
        store.dispatch(TranslateJobsErrorAction(error: translatorJobsResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(TranslateJobsErrorAction(error: 'Error fetching translate jobs section.'));
    }
  }

  /// Function which will fetch the favorite jobs list for now.
  void _fetchTranslatorFavJobsList(
      Store<AppState> store, FavoriteJobsFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      TranslatorFavJobsResponse translatorJobsResponse =
          await TranslatorJobsApiCalls.fetchTranslatorFavoriteJobs(action.translatorFavJobsRequest);

      if (translatorJobsResponse?.isSuccessful == true &&
          translatorJobsResponse?.data?.favoriteJobsResponses?.isNotEmpty == true) {
        store
            .dispatch(FavoriteJobsSuccessAction(translatorFavJobsResponse: translatorJobsResponse));
      } else if (translatorJobsResponse?.errors?.isNotEmpty == true) {
        store.dispatch(FavoriteJobsErrorAction(error: translatorJobsResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(FavoriteJobsErrorAction(error: 'Error fetching translate jobs section.'));
    }
  }

  /// Function which will add the favorite jobs list for now.
  void _addTranslatorFavJobsList(
      Store<AppState> store, AddFavoriteJobsAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(FavoriteJobsErrorAction(error: 'Please login first.'));
        return;
      }
      AddFavJobResponse addFavJobResponse =
          await TranslatorJobsApiCalls.addTranslatorFavoriteJobs(action.addFavJobRequest);

      if (addFavJobResponse?.isSuccessful == true) {
        showMessageToast(context: null, message: "Item added to favorite");
      } else if (addFavJobResponse?.errors?.isNotEmpty == true) {
        store.dispatch(FavoriteJobsErrorAction(error: addFavJobResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(
          FavoriteJobsErrorAction(error: 'Error adding job to favorite translate jobs section.'));
    }
  }

  /// Function which will remove the favorite jobs list for now.
  void _deleteTranslatorFavJobsList(
      Store<AppState> store, RemoveFavoriteJobsAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(FavoriteJobsErrorAction(error: 'Please login first.'));
        return;
      }
      CommonResponseModel deleteFavJobResponse =
          await TranslatorJobsApiCalls.deleteTranslatorFavoriteJobs(action.jobId);

      if (deleteFavJobResponse?.isSuccessful == true) {
        store.dispatch(
          FavoriteJobsFetchAction(
            translatorFavJobsRequest: TranslatorFavJobsRequest(
                userId: userId, pageNumber: 1, pageSize: 5, searchJobTitle: '', queryList: []),
          ),
        );
      } else if (deleteFavJobResponse?.errors?.isNotEmpty == true) {
        store.dispatch(FavoriteJobsErrorAction(error: deleteFavJobResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(FavoriteJobsErrorAction(
          error: 'Error removing job from favorite translate jobs section.'));
    }
  }

  /// Function which will fetch the apply jobs list for now.
  void _fetchTranslatorApplyJobsList(
      Store<AppState> store, ApplyJobsListFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ApplyJobsListErrorAction(error: 'Please login first.'));
        return;
      }

      ApplyJobsListResponse applyJobsListResponse =
          await TranslatorApplyJobsApiCalls.getApplyJobsList(userId);

      if (applyJobsListResponse?.isSuccessful == true &&
          applyJobsListResponse?.data?.isNotEmpty == true) {
        store.dispatch(ApplyJobsListSuccessAction(applyJobsListResponse: applyJobsListResponse));
      } else if (applyJobsListResponse?.errors?.isNotEmpty == true) {
        store.dispatch(ApplyJobsListErrorAction(error: applyJobsListResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(
          ApplyJobsListErrorAction(error: 'Error fetching translate apply jobs section.'));
    }
  }

  /// Function which will add the favorite jobs list for now.
  void _addTranslatorApplyJobsList(
      Store<AppState> store, AddUpdateApplyJobsAction action, NextDispatcher next) async {
    next(action);
    try {
      DocumentUploadResponseModel jobImageUploadResponseModel;
      if (action?.imageList?.isNotEmpty == true) {
        jobImageUploadResponseModel = await OnBoardingApiCalls.addFileDocument(
            DocumentUploadRequestModel(fileOrDocumentInformations: action.imageList));
      }
      if (jobImageUploadResponseModel?.isSuccessful == true &&
          jobImageUploadResponseModel?.data?.fileOrDocumentInformations?.isNotEmpty == true) {
        action.addUpdateApplyJobsRequest.fileOrDocumentIds = jobImageUploadResponseModel
            .data.fileOrDocumentInformations
            .map((e) => e.fileDocumentId)
            .toList();
      }
      AddUpdateApplyJobsResponse addUpdateApplyJobsResponse =
          await TranslatorApplyJobsApiCalls.addUpdateApplyJobs(action.addUpdateApplyJobsRequest);

      if (addUpdateApplyJobsResponse?.isSuccessful == true) {
        store.dispatch(AddUpdateApplyJobsSuccessAction(
            addUpdateApplyJobsResponse: addUpdateApplyJobsResponse));
      } else if (addUpdateApplyJobsResponse?.errors?.isNotEmpty == true) {
        store.dispatch(AddUpdateApplyJobsErrorAction(error: addUpdateApplyJobsResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(
          AddUpdateApplyJobsErrorAction(error: 'Error adding job to apply jobs section.'));
    }
  }

  /// Function which will remove the favorite jobs list for now.
  void _deleteTranslatorApplyJobsList(
      Store<AppState> store, DeleteApplyJobsAction action, NextDispatcher next) async {
    next(action);
    try {
      CommonResponseModel deleteFavJobResponse =
          await TranslatorApplyJobsApiCalls.removeApplyJobs(action.applyJobId);

      if (deleteFavJobResponse?.isSuccessful == true) {
        store.dispatch(ApplyJobsListFetchAction());
      } else if (deleteFavJobResponse?.errors?.isNotEmpty == true) {
        store.dispatch(DeleteApplyJobsErrorAction(error: deleteFavJobResponse.errors[0]));
      }
    } catch (e) {
      store.dispatch(DeleteApplyJobsErrorAction(
          error: 'Error removing job from apply translate jobs section.'));
    }
  }

  /// Function which will fetch the contracts list for now.
  /// TODO - Will have to add the api logic for this function.
  void _fetchTranslatorContractList(
      Store<AppState> store, TranslateContractsFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      List<TranslatorContractsModel> tempList = Data.contractsModel;
      store.state.translateContractsState.translateContractsList.addAll(tempList);
      store.dispatch(TranslateContractsSuccessAction(
          translateContractsList: store.state.translateContractsState.translateContractsList));
    } catch (e) {
      store.dispatch(
          TranslateContractsErrorAction(error: 'Error fetching translate contracts section.'));
    }
  }

  /// Function which will fetch the schedule list for now.
  /// TODO - Will have to add the api logic for this function.
  void _fetchTranslatorScheduleList(
      Store<AppState> store, TranslateScheduleFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      Map<DateTime, List<dynamic>> tempList = Map();
      if (tempList != null) {
        store.dispatch(TranslateScheduleSuccessAction(translateScheduleList: tempList));
      } else {
        store.dispatch(TranslateScheduleErrorAction(error: 'No data found.'));
      }
    } catch (e) {
      store.dispatch(
          TranslateScheduleErrorAction(error: 'Error fetching translate schedule section.'));
    }
  }

  /// Function which will fetch the earnings list for now.
  /// TODO - Will have to add the api logic for this function.
  void _fetchTranslatorEarningsList(
      Store<AppState> store, TranslateEarningsFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      List<TranslatorEarningsModel> tempList = Data.earnings;
      store.dispatch(TranslateEarningsSuccessAction(translateEarningsList: tempList));
    } catch (e) {
      store
          .dispatch(TranslateEarningsErrorAction(error: 'Error fetching translate earnings list.'));
    }
  }

  /// Function which will fetch the billing list for now.
  void _fetchBillingMethodsList(
      Store<AppState> store, PaymentMethodListFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(PaymentMethodListErrorAction(error: 'Please login first.'));
        return;
      }
      PaymentMethodListModel paymentMethodListModel =
          await PaymentsApiCalls.getPaymentMethodList(userId);

      if (paymentMethodListModel?.isSuccessful == false &&
          paymentMethodListModel?.errors?.isNotEmpty == true) {
        store.dispatch(PaymentMethodListErrorAction(error: paymentMethodListModel?.errors[0]));
      } else {
        store.dispatch(
            PaymentMethodListSuccessAction(paymentMethodListModel: paymentMethodListModel));
      }
    } catch (e) {
      store.dispatch(PaymentMethodListErrorAction(error: 'Error fetching translate billing list.'));
    }
  }

  /// Function which will fetch the billing list for now.
  /// TODO - Will have to add the api logic for this function.
  void _fetchBillingTypeList(
      Store<AppState> store, TranslateBillingTypeFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      List<String> tempList = Data.paymentType;
      store.dispatch(TranslateBillingTypeSuccessAction(translateBillingTypeList: tempList));
    } catch (e) {
      store.dispatch(
          TranslateBillingTypeErrorAction(error: 'Error fetching translate billing type list.'));
    }
  }

  /// Function which will fetch the earnings history list for now.
  /// TODO - Will have to add the api logic for this function.
  void _fetchTranslatorEarningsHistoryList(Store<AppState> store,
      TranslateEarningsHistoryFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      List<TranslatorEarningsHistoryModel> tempList = Data.earningsHistory;
      store.dispatch(TranslateEarningsHistorySuccessAction(translateEarningsHistoryList: tempList));
    } catch (e) {
      store.dispatch(TranslateEarningsHistoryErrorAction(
          error: 'Error fetching translate earnings history list.'));
    }
  }

  /// Function which will fetch the list of translate language list.
  void _getTranslatorExistingResidence(
      Store<AppState> store, ExistingUserAddressFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(TranslateLanguageErrorAction(error: 'Please login first.'));
        return;
      }
      UserAddResponseModel userAddResponseModel =
          await TranslatorTaxApiCalls.getExistingUserAdd(userId);
      if (userAddResponseModel?.isSuccessful == true && userAddResponseModel?.data != null) {
        store
            .dispatch(ExistingUserAddressSuccessAction(userAddResponseModel: userAddResponseModel));
      } else {
        store.dispatch(ExistingUserAddressErrorAction(error: 'Error fetching translate residence'));
      }
    } catch (e) {
      store.dispatch(ExistingUserAddressErrorAction(error: 'Error fetching translate residence.'));
    }
  }

  /// Function which will add the translate tax residence.
  void _addTranslateTaxAddress(
      Store<AppState> store, AddUserAddressAction action, NextDispatcher next) async {
    next(action);
    try {
      UserAddResponseModel userAddResponseModel =
          await TranslatorTaxApiCalls.addUpdateUserAddress(action.addressRequestModel);
      if (userAddResponseModel?.isSuccessful == true && userAddResponseModel?.data != null) {
        showMessageToast(context: null, message: "Add/update successful");
        store.dispatch(ExistingUserAddressFetchAction());
      } else {
        showMessageToast(context: null, message: "Error in add/update translator residence");
      }
    } catch (e) {
      store.dispatch(AddEducationErrorAction(error: 'Error adding translate tax section.'));
    }
  }

  /// Function which will hold the logic and api call for the [ClientProfileFetchAction].
  void _clientProfileData(
      Store<AppState> store, ClientProfileFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientProfileFetchErrorAction(error: 'Please login first.'));
        return;
      }
      ClientProfileResponseModel clientProfileResponseModel =
          await ClientProfileApiCalls.getClientProfile(userId);
      ClientProfileImageResponseModel clientProfileImageResponseModel =
          await ClientProfileApiCalls.getClientProfileImage(userId);
      String error =
          clientProfileError(clientProfileResponseModel, clientProfileImageResponseModel);
      if (error == null || error.isEmpty) {
        store.dispatch(
          ClientProfileFetchSuccessAction(
            userProfileResponseModel: clientProfileResponseModel,
            userProfileImageResponseModel: clientProfileImageResponseModel,
          ),
        );
      } else {
        store.dispatch(ClientProfileFetchErrorAction(error: error));
      }
    } catch (e) {
      store.dispatch(ClientProfileFetchErrorAction(error: 'Error in fetching client profile.'));
    }
  }

  /// Function which will extract the error for the [_clientProfileData]
  String clientProfileError(ClientProfileResponseModel clientProfileResponseModel,
      ClientProfileImageResponseModel clientProfileImageResponseModel) {
    if (clientProfileResponseModel.errors != null && clientProfileResponseModel.errors.isNotEmpty) {
      return clientProfileResponseModel.errors[0];
    } else if (clientProfileImageResponseModel.errors != null &&
        clientProfileImageResponseModel.errors.isNotEmpty) {
      return clientProfileImageResponseModel.errors[0];
    }
    return null;
  }

  /// Function which will hold the logic and api call for the [ClientProfileUpdateAction].
  void _updateUserProfile(
      Store<AppState> store, ClientProfileUpdateAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientProfileUpdateErrorAction(error: 'Please login first.'));
        return;
      }
      ClientProfileResponseModel profileModel = await ClientProfileApiCalls.updateClientProfile(
          userId, action.clientProfileUpdateRequestModel);
      if (profileModel.isSuccessful) {
        store.dispatch(ClientProfileUpdateSuccessAction(userProfileResponseModel: profileModel));
      } else if (profileModel.errors != null && profileModel.errors.isNotEmpty) {
        store.dispatch(ClientProfileUpdateErrorAction(error: profileModel.errors[0]));
      } else {
        store.dispatch(ClientProfileUpdateErrorAction(error: 'Error updating user profile'));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(ClientProfileUpdateErrorAction(error: 'Error updating user profile'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic and api call for the [ClientProfileImageAddAction].
  void _clientAddProfileImageData(
      Store<AppState> store, ClientProfileImageAddAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientProfileImageAddErrorAction(error: 'Please login first.'));
        return;
      }
      ClientProfileImageResponseModel clientProfileImageResponseModel =
          await ClientProfileApiCalls.addClientProfileImage(userId,
              clientProfileImageRequestModel: action.clientProfileImageRequestModel);
      if (clientProfileImageResponseModel.errors != null &&
          clientProfileImageResponseModel.errors.isNotEmpty) {
        store.dispatch(
            ClientProfileImageAddErrorAction(error: clientProfileImageResponseModel.errors[0]));
      } else {
        store.dispatch(ClientProfileImageAddSuccessAction(
            userProfileImageResponseModel: clientProfileImageResponseModel));
      }
    } catch (e) {
      store.dispatch(
          ClientProfileImageAddErrorAction(error: 'Error in adding client profile image.'));
    }
  }

  /// Function which will hold the logic and api call for the [ClientProfileImageUpdateAction].
  void _clientUpdateProfileImageData(
      Store<AppState> store, ClientProfileImageUpdateAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientProfileImageResponseModel clientProfileImageResponseModel =
          store.state.clientProfileState.clientProfileImageResponseModel;
      if (clientProfileImageResponseModel != null &&
          clientProfileImageResponseModel.data != null &&
          clientProfileImageResponseModel.data.fileDocumentId.isNotEmpty) {
        clientProfileImageResponseModel = await ClientProfileApiCalls.updateClientProfileImage(
            clientProfileImageResponseModel.data.fileDocumentId,
            clientProfileImageRequestModel: action.clientProfileImageRequestModel);
      }
      if (clientProfileImageResponseModel.errors != null &&
          clientProfileImageResponseModel.errors.isNotEmpty) {
        store.dispatch(
            ClientProfileImageUpdateErrorAction(error: clientProfileImageResponseModel.errors[0]));
      } else {
        store.dispatch(ClientProfileImageUpdateSuccessAction(
            userProfileImageResponseModel: clientProfileImageResponseModel));
      }
    } catch (e) {
      store.dispatch(
          ClientProfileImageUpdateErrorAction(error: 'Error in updating client profile image.'));
    }
  }

  /// Function which will hold the logic and api call for the [ClientAddressFetchAction].
  void _clientAddressData(
      Store<AppState> store, ClientAddressFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientAddressFetchErrorAction(error: 'Please login first.'));
        return;
      }
      ClientAddressResponseModel clientAddressResponseModel =
          await ClientProfileApiCalls.getClientAddress(userId);
      if (clientAddressResponseModel.errors != null &&
          clientAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(ClientAddressFetchErrorAction(error: clientAddressResponseModel.errors[0]));
      } else {
        store.dispatch(
            ClientAddressFetchSuccessAction(userAddressResponseModel: clientAddressResponseModel));
      }
    } catch (e) {
      store.dispatch(ClientAddressFetchErrorAction(error: 'Error in fetching client address.'));
    }
  }

  /// Function which will hold the logic and api call for the [ClientAddAddressAction].
  void _clientAddAddressData(
      Store<AppState> store, ClientAddAddressAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientAddAddressErrorAction(error: 'Please login first.'));
        return;
      }
      ClientAddressResponseModel clientAddressResponseModel =
          await ClientProfileApiCalls.addClientAddress(userId,
              addressCreateRequestModel: action.addressCreateRequestModel);
      if (clientAddressResponseModel.errors != null &&
          clientAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(ClientAddAddressErrorAction(error: clientAddressResponseModel.errors[0]));
      } else {
        store.dispatch(
            ClientAddAddressSuccessAction(userAddressResponseModel: clientAddressResponseModel));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(ClientAddAddressErrorAction(error: 'Error in adding client address.'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic and api call for the [ClientUpdateAddressAction].
  void _clientUpdateAddressData(
      Store<AppState> store, ClientUpdateAddressAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientAddressResponseModel clientAddressResponseModel;
      if (action?.addressCreateRequestModel?.addressId?.isNotEmpty == true) {
        clientAddressResponseModel = await ClientProfileApiCalls.updateClientAddress(
            action.addressCreateRequestModel.addressId,
            addressCreateRequestModel: action.addressCreateRequestModel);
      }

      if (clientAddressResponseModel.errors != null &&
          clientAddressResponseModel.errors.isNotEmpty) {
        store.dispatch(ClientUpdateAddressErrorAction(error: clientAddressResponseModel.errors[0]));
      } else {
        store.dispatch(
            ClientUpdateAddressSuccessAction(userAddressResponseModel: clientAddressResponseModel));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(ClientUpdateAddressErrorAction(error: 'Error in updating client address.'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic and api call for the [ClientCompanyFetchAction].
  void _clientCompanyData(
      Store<AppState> store, ClientCompanyFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientCompanyFetchErrorAction(error: 'Please login first.'));
        return;
      }
      ClientCompanyResponseModel clientCompanyResponseModel =
          await ClientProfileApiCalls.getClientCompany(userId);
      ClientCompanyImageResponseModel clientCompanyProfileImageResponseModel;
      if (clientCompanyResponseModel != null &&
          clientCompanyResponseModel.data != null &&
          clientCompanyResponseModel.data.companyId.isNotEmpty) {
        clientCompanyProfileImageResponseModel = await ClientProfileApiCalls.getClientCompanyImage(
            clientCompanyResponseModel.data.companyId);
      }
      String error =
          clientCompanyError(clientCompanyResponseModel, clientCompanyProfileImageResponseModel);
      if (error == null || error.isEmpty) {
        store.dispatch(
          ClientCompanyFetchSuccessAction(
            clientCompanyResponseModel: clientCompanyResponseModel,
            clientCompanyProfileImageResponseModel: clientCompanyProfileImageResponseModel,
          ),
        );
      } else {
        store.dispatch(ClientCompanyFetchErrorAction(error: error));
      }
    } catch (e) {
      store.dispatch(ClientCompanyFetchErrorAction(error: 'Error in fetching client company.'));
    }
  }

  /// Function which will extract the error for the [_clientProfileData]
  String clientCompanyError(ClientCompanyResponseModel clientCompanyResponseModel,
      ClientCompanyImageResponseModel clientCompanyProfileImageResponseModel) {
    if (clientCompanyResponseModel.errors != null && clientCompanyResponseModel.errors.isNotEmpty) {
      return clientCompanyResponseModel.errors[0];
    } else if (clientCompanyProfileImageResponseModel != null &&
        clientCompanyProfileImageResponseModel.errors != null &&
        clientCompanyProfileImageResponseModel.errors.isNotEmpty) {
      return clientCompanyProfileImageResponseModel.errors[0];
    }
    return null;
  }

  /// Function which will hold the logic and api call for the [ClientCompanyAddAction].
  void _clientAddCompanyData(
      Store<AppState> store, ClientCompanyAddAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(ClientCompanyAddErrorAction(error: 'Please login first.'));
        return;
      }
      ClientCompanyResponseModel clientCompanyResponseModel =
          await ClientProfileApiCalls.addClientCompany(userId,
              clientCompanyRequestModel: action.clientCompanyRequestModel);
      if (clientCompanyResponseModel.errors != null &&
          clientCompanyResponseModel.errors.isNotEmpty) {
        store.dispatch(ClientCompanyAddErrorAction(error: clientCompanyResponseModel.errors[0]));
      } else {
        store.dispatch(
            ClientCompanyAddSuccessAction(clientCompanyResponseModel: clientCompanyResponseModel));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(ClientCompanyAddErrorAction(error: 'Error in adding client company.'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic and api call for the [ClientCompanyUpdateAction].
  void _clientUpdateCompanyData(
      Store<AppState> store, ClientCompanyUpdateAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientCompanyResponseModel clientCompanyResponseModel =
          store.state.clientCompanyState.clientCompanyResponseModel;
      if (clientCompanyResponseModel != null &&
          clientCompanyResponseModel.data != null &&
          clientCompanyResponseModel.data.companyId.isNotEmpty) {
        clientCompanyResponseModel = await ClientProfileApiCalls.updateClientCompany(
            clientCompanyResponseModel.data.companyId,
            clientCompanyRequestModel: action.clientCompanyRequestModel);
      }
      if (clientCompanyResponseModel.errors != null &&
          clientCompanyResponseModel.errors.isNotEmpty) {
        store.dispatch(ClientCompanyUpdateErrorAction(error: clientCompanyResponseModel.errors[0]));
      } else {
        store.dispatch(ClientCompanyUpdateSuccessAction(
            clientCompanyResponseModel: clientCompanyResponseModel));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(ClientCompanyUpdateErrorAction(error: 'Error in updating client company.'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic and api call for the [ClientCompanyAddImageAction].
  void _clientAddCompanyImageData(
      Store<AppState> store, ClientCompanyAddImageAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientCompanyResponseModel clientCompanyResponseModel =
          store.state.clientCompanyState.clientCompanyResponseModel;
      ClientCompanyImageResponseModel clientCompanyImageResponseModel;
      if (clientCompanyResponseModel != null &&
          clientCompanyResponseModel.data != null &&
          clientCompanyResponseModel.data.companyId.isNotEmpty) {
        clientCompanyImageResponseModel = await ClientProfileApiCalls.addClientCompanyImage(
            clientCompanyResponseModel.data.companyId,
            clientCompanyImageRequestModel: action.clientCompanyImageRequestModel);
      }

      if (clientCompanyImageResponseModel.errors != null &&
          clientCompanyImageResponseModel.errors.isNotEmpty) {
        store.dispatch(
            ClientCompanyAddImageErrorAction(error: clientCompanyImageResponseModel.errors[0]));
      } else {
        store.dispatch(ClientCompanyAddImageSuccessAction(
            clientCompanyImageResponseModel: clientCompanyImageResponseModel));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(
          ClientCompanyAddImageErrorAction(error: 'Error in adding client company image.'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic and api call for the [ClientCompanyUpdateImageAction].
  void _clientUpdateCompanyImageData(
      Store<AppState> store, ClientCompanyUpdateImageAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientCompanyImageResponseModel clientCompanyImageResponseModel =
          store.state.clientCompanyState.clientCompanyProfileImageResponseModel;
      if (clientCompanyImageResponseModel != null &&
          clientCompanyImageResponseModel.data != null &&
          clientCompanyImageResponseModel.data.fileDocumentId.isNotEmpty) {
        clientCompanyImageResponseModel = await ClientProfileApiCalls.updateClientCompanyImage(
            clientCompanyImageResponseModel.data.fileDocumentId,
            clientCompanyImageRequestModel: action.clientCompanyImageRequestModel);
      }

      if (clientCompanyImageResponseModel.errors != null &&
          clientCompanyImageResponseModel.errors.isNotEmpty) {
        store.dispatch(
            ClientCompanyUpdateImageErrorAction(error: clientCompanyImageResponseModel.errors[0]));
      } else {
        store.dispatch(ClientCompanyUpdateImageSuccessAction(
            clientCompanyImageResponseModel: clientCompanyImageResponseModel));
      }
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    } catch (e) {
      store.dispatch(
          ClientCompanyUpdateImageErrorAction(error: 'Error in updating client company image.'));
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
    }
  }

  /// Function which will hold the logic for the [ChangeEditStatusAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _changeEditStatus(
      Store<AppState> store, ChangeEditStatusAction action, NextDispatcher next) async {
    next(action);
    try {
      store.dispatch(ChangeEditStatusSuccessAction(editStatus: action.editStatus));
    } catch (e) {
      store.dispatch(ChangeEditStatusErrorAction(error: 'Error in changing the status.'));
    }
  }

  /// Function which will hold the logic for the [GetUserConversationsAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _getUserConversations(
      Store<AppState> store, GetUserConversationsAction action, NextDispatcher next) async {
    next(action);
    try {
      UserConversationsResponseModel userConversationsResponseModel =
          await UserChatApiCalls.getUserConversation(action.userId);

      if (userConversationsResponseModel?.isSuccessful == false &&
          userConversationsResponseModel?.errors?.isNotEmpty == true) {
        store.dispatch(
            GetUserConversationsErrorAction(error: userConversationsResponseModel?.errors[0]));
      } else {
        store.dispatch(GetUserConversationsSuccessAction(
            userConversationsResponseModel: userConversationsResponseModel));
      }
    } catch (e) {
      store.dispatch(
          GetUserConversationsErrorAction(error: 'Error in getting the user conversations.'));
    }
  }

  /// Function which will hold the logic for the [SetUserChatAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _setUserChatList(
      Store<AppState> store, SetUserChatAction action, NextDispatcher next) async {
    next(action);
    try {
      if (action?.chatListModel?.messageListData?.isNotEmpty == true) {
        store.dispatch(SetUserChatSuccessAction(chatListModel: action?.chatListModel));
      } else {
        store.dispatch(SetUserChatErrorAction(error: 'Error in getting the user chats.'));
      }
    } catch (e) {
      store.dispatch(SetUserChatErrorAction(error: 'Error in getting the user chats.'));
    }
  }

  /// Function which will hold the logic for the [AddSingleChatAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _addSingleChatMessage(
      Store<AppState> store, AddSingleChatAction action, NextDispatcher next) async {
    next(action);
    try {
      ChatListModel listModel = store.state.userChatState.chatListModel;

      if (action.singleMessageData != null) {
        listModel.messageListData.insert(0, action.singleMessageData);
        store.dispatch(AddSingleChatSuccessAction(chatListModel: listModel));
      } else {
        store.dispatch(AddSingleChatErrorAction(error: 'Error in adding the single chat.'));
      }
    } catch (e) {
      store.dispatch(AddSingleChatErrorAction(error: 'Error in adding the single chat.'));
    }
  }

  /// Function which will hold the logic for the [PaymentMethodListFetchAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _paymentMethodList(
      Store<AppState> store, PaymentMethodListFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(PaymentMethodListErrorAction(error: 'Please login first.'));
        return;
      }
      PaymentMethodListModel paymentMethodListModel;

      if (!store.state.paymentState.isLoading) {
        paymentMethodListModel = await PaymentsApiCalls.getPaymentMethodList(userId);
      }

      if (paymentMethodListModel?.isSuccessful == false &&
          paymentMethodListModel?.errors?.isNotEmpty == true) {
        store.dispatch(PaymentMethodListErrorAction(error: paymentMethodListModel?.errors[0]));
      } else {
        store.dispatch(
            PaymentMethodListSuccessAction(paymentMethodListModel: paymentMethodListModel));
      }
    } catch (e) {
      store.dispatch(
          PaymentMethodListErrorAction(error: 'Error in getting the payment method list.'));
    }
  }

  /// Function which will hold the logic for the [AddPaymentMethodAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _addNewPaymentMethod(
      Store<AppState> store, AddPaymentMethodAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientAddressResponseModel clientAddressResponseModel;
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(AddPaymentMethodErrorAction(error: 'Please login first.'));
        return;
      }

      if (action?.addressData?.addressId == Constants.paymentNewAddressKey) {
        clientAddressResponseModel = await ClientProfileApiCalls.addClientAddress(
          userId,
          addressCreateRequestModel: AddressCreateRequestModel(
            streetNumber: action.addressData.streetNumber,
            streetName: action.addressData.streetName,
            line1: action.addressData.line1,
            line2: action.addressData.line2,
            addressType: action.addressData.addressType,
            city: action.addressData.city,
            county: action.addressData.county,
            zipCode: action.addressData.zipCode,
            timezone: action.addressData.timezone,
            country: action.addressData.country,
          ),
        );

        if (clientAddressResponseModel.isSuccessful && clientAddressResponseModel.data != null) {
          action.createPaymentMethodRequestModel.addressId =
              clientAddressResponseModel.data.addressId;
        }
      }

      if (action.createPaymentMethodRequestModel.addressId == Constants.paymentNewAddressKey) {
        store.dispatch(AddPaymentMethodErrorAction(
            error: 'Something went wrong with address, please try again later.'));
        return;
      }

      action.createPaymentMethodRequestModel.userId = userId;

      AddPaymentMethodResponseModel addPaymentMethodResponseModel =
          await PaymentsApiCalls.createCustomerPaymentMethod(
              action.userType, action.createPaymentMethodRequestModel);

      if (addPaymentMethodResponseModel?.isSuccessful == false &&
          addPaymentMethodResponseModel?.errors?.isNotEmpty == true) {
        store
            .dispatch(AddPaymentMethodErrorAction(error: addPaymentMethodResponseModel?.errors[0]));
      } else {
        store.dispatch(PaymentMethodListFetchAction());
        store.dispatch(AddPaymentMethodSuccessAction(
            paymentMethodResponseModel: addPaymentMethodResponseModel));
      }
    } catch (e) {
      store.dispatch(AddPaymentMethodErrorAction(error: 'Error in adding the payment method.'));
    }
  }

  /// Function which will hold the logic for the [UpdatePaymentMethodAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _updateNewPaymentMethod(
      Store<AppState> store, UpdatePaymentMethodAction action, NextDispatcher next) async {
    next(action);
    try {
      AddPaymentMethodResponseModel updatePaymentMethodResponseModel =
          await PaymentsApiCalls.updateCustomerPaymentMethod(
              action.userType, action.updatePaymentMethodRequestModel);

      if (updatePaymentMethodResponseModel?.isSuccessful == true &&
          updatePaymentMethodResponseModel?.data != null) {
        store.dispatch(PaymentMethodListFetchAction());
        store.dispatch(UpdatePaymentMethodSuccessAction(
            paymentMethodResponseModel: updatePaymentMethodResponseModel));
      } else {
        store.dispatch(
            UpdatePaymentMethodErrorAction(error: 'Error in updating the payment method.'));
      }
    } catch (e) {
      store
          .dispatch(UpdatePaymentMethodErrorAction(error: 'Error in updating the payment method.'));
    }
  }

  /// Function which will hold the logic for the [DeletePaymentMethodAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _deleteNewPaymentMethod(
      Store<AppState> store, DeletePaymentMethodAction action, NextDispatcher next) async {
    next(action);
    try {
      DeletePaymentMethodResponseModel deletePaymentMethodResponseModel =
          await PaymentsApiCalls.deleteCustomerPaymentMethod(
              action.userType, action.deletePaymentMethodRequestModel);

      if (deletePaymentMethodResponseModel?.isSuccessful == true &&
          deletePaymentMethodResponseModel?.data != null) {
        store.dispatch(PaymentMethodListFetchAction());
        store.dispatch(DeletePaymentMethodSuccessAction(
            deletePaymentMethodResponseModel: deletePaymentMethodResponseModel));
      } else {
        store.dispatch(
            DeletePaymentMethodErrorAction(error: 'Error in deleting the payment method.'));
      }
    } catch (e) {
      store
          .dispatch(DeletePaymentMethodErrorAction(error: 'Error in deleting the payment method.'));
    }
  }

  /// Function which will hold the logic for the [CreateStripeAccountAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _createStripeAccount(
      Store<AppState> store, CreateStripeAccountAction action, NextDispatcher next) async {
    next(action);
    try {
      ClientAddressResponseModel clientAddressResponseModel;
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(CreateStripeAccountErrorAction(error: 'Please login first.'));
        return;
      }

      if (action.addressData.addressId == Constants.paymentNewAddressKey) {
        clientAddressResponseModel = await ClientProfileApiCalls.addClientAddress(
          userId,
          addressCreateRequestModel: AddressCreateRequestModel(
            streetNumber: action.addressData.streetNumber,
            streetName: action.addressData.streetName,
            line1: action.addressData.line1,
            line2: action.addressData.line2,
            addressType: action.addressData.addressType,
            city: action.addressData.city,
            county: action.addressData.county,
            zipCode: action.addressData.zipCode,
            timezone: action.addressData.timezone,
            country: action.addressData.country,
          ),
        );

        if (clientAddressResponseModel.isSuccessful && clientAddressResponseModel.data != null) {
          action.createStripeAccountRequestModel.addressId =
              clientAddressResponseModel.data.addressId;
        }
      }

      if (action.createStripeAccountRequestModel.addressId == Constants.paymentNewAddressKey) {
        store.dispatch(CreateStripeAccountErrorAction(
            error: 'Something went wrong with address, please try again later.'));
        return;
      }

      CreateStripeAccountResponseModel createStripeAccountResponseModel =
          await TranslatorPaymentApiCalls.createStripeAccount(
              action.createStripeAccountRequestModel);

      if (createStripeAccountResponseModel?.isSuccessful == true &&
          createStripeAccountResponseModel?.data != null) {
        store.dispatch(PaymentMethodListFetchAction());
        store.dispatch(CreateStripeAccountSuccessAction(
            createStripeAccountResponseModel: createStripeAccountResponseModel));
      } else {
        store.dispatch(CreateStripeAccountErrorAction(error: 'Error in creating stripe account.'));
      }
    } catch (e) {
      store.dispatch(CreateStripeAccountErrorAction(error: 'Error in creating stripe account.'));
    }
  }

  /// Function which will hold the logic for the [ClearTranslatorPaymentStateAction].
  /// It will take the current state from the action and add a success dispatcher with that state in order
  /// to change the state.
  void _clearTranslatorPaymentState(
      Store<AppState> store, ClearTranslatorPaymentStateAction action, NextDispatcher next) async {
    next(action);
    try {
      store.dispatch(ClearTranslatorPaymentStateSuccessAction());
    } catch (e) {
      store.dispatch(ClearTranslatorPaymentStateErrorAction(
          error: 'Error in clearing the translator payment state.'));
    }
  }

  /// Function which will hold the logic for the [getBankSource].
  void getBankSource(
      Store<AppState> store, BankAccountSourceFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        store.dispatch(CreateStripeAccountErrorAction(error: 'Please login first.'));
        return;
      }
      BankAccountSourceResponse bankAccountSourceResponse =
          await TranslatorPaymentApiCalls.getBankSource(action.bankAccountSourceRequest);

      if (bankAccountSourceResponse?.isSuccessful == false &&
          bankAccountSourceResponse?.errors?.isNotEmpty == true) {
        store.dispatch(AddPaymentMethodErrorAction(error: bankAccountSourceResponse?.errors[0]));
      } else {
        store.dispatch(
          AddPaymentMethodAction(
            userType: action.usertype,
            addressData: null,
            createPaymentMethodRequestModel: CreatePaymentMethodRequestModel(
              userId: userId,
              sourceToken: bankAccountSourceResponse.data,
              type: 'bank_account',
              addressId: '00000000-0000-0000-0000-000000000000',
            ),
          ),
        );
      }
    } catch (e) {
      store
          .dispatch(AddPaymentMethodErrorAction(error: 'Error in getting the user conversations.'));
    }
  }

  /// Function which will hold the logic for the [JobProposalsFetchAction] and fetch the jobs
  /// proposals for job posted
  void _fetchPostedJobsProposals(
      Store<AppState> store, JobProposalsFetchAction action, NextDispatcher next) async {
    next(action);
    try {
      HireAppliedResponseModel hireAppliedResponseModel =
          await HireAppliedApiCalls.getJobProposals(action.jobId);

      if (hireAppliedResponseModel?.isSuccessful == true &&
          hireAppliedResponseModel?.data != null) {
        store.dispatch(
            JobProposalsFetchSuccessAction(hireAppliedResponseModel: hireAppliedResponseModel));
      } else {
        store
            .dispatch(JobProposalsFetchErrorAction(error: 'Error in fetching the jobs proposals.'));
      }
    } catch (e) {
      store.dispatch(JobProposalsFetchErrorAction(error: 'Error in fetching the jobs proposals.'));
    }
  }

  /// Function which will hold the logic for the [AcceptJobProposalsAction] and accept the jobs
  /// proposals for job posted
  void _acceptPostedJobsProposals(
      Store<AppState> store, AcceptJobProposalsAction action, NextDispatcher next) async {
    next(action);
    try {
      AcceptProposalResponse acceptProposalResponse =
          await HireAppliedApiCalls.acceptJobProposals(action.acceptTranslatorProposal);

      if (acceptProposalResponse?.isSuccessful == true && acceptProposalResponse?.data != null) {
        showMessageToast(context: null, message: "Offer have been accepted.");
        Navigator.of(action.context).pop();
      } else {
        store.dispatch(
            AcceptJobProposalsErrorAction(error: 'Error in accepting the jobs proposals.'));
      }
    } catch (e) {
      store
          .dispatch(AcceptJobProposalsErrorAction(error: 'Error in accepting the jobs proposals.'));
    }
  }

  String _getFromName(CompleteProfileResponseModel completeProfileResponseModel,
      {bool isName: false}) {
    List<String> tempAd = [];
    List<String> list = [
      completeProfileResponseModel?.data?.firstName,
      completeProfileResponseModel?.data?.lastName
    ];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i].isNotEmpty) {
        tempAd.add(list[i]);
      }
    }

    if (isName) {
      return tempAd.join(' ');
    }
    return tempAd.join('_');
  }

  void showMessageToast({
    String message: '',
    @required BuildContext context,
  }) {
    print("the load 00000");
    Toast.show(
      message,
      context,
      textColor: Colors.white,
      backgroundColor: Colors.black,
      gravity: 0,
    );
  }
}
