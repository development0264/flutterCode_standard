import 'package:khontext/redux/states/applyjobs/translate_apply_jobs_state.dart';
import 'package:khontext/redux/states/clientprofile/client_address_state.dart';
import 'package:khontext/redux/states/clientprofile/client_company_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_state.dart';
import 'package:khontext/redux/states/forgetpassword/forget_password_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/redux/states/paymenthistory/payment_history_state.dart';
import 'package:khontext/redux/states/payments/payments_state.dart';
import 'package:khontext/redux/states/postedjobs/posted_jobs_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_description_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_languages_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_locality_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_review_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_schedule_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_visibility_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/redux/states/signin/verify_identity_state.dart';
import 'package:khontext/redux/states/signup/sign_up_state.dart';
import 'package:khontext/redux/states/translate/translate_contracts_state.dart';
import 'package:khontext/redux/states/translate/translate_earnings_state.dart';
import 'package:khontext/redux/states/translate/translate_education_state.dart';
import 'package:khontext/redux/states/translate/translate_experience_state.dart';
import 'package:khontext/redux/states/translate/translate_identification_state.dart';
import 'package:khontext/redux/states/translate/translate_jobs_state.dart';
import 'package:khontext/redux/states/translate/translate_language_state.dart';
import 'package:khontext/redux/states/translate/translate_schedule_state.dart';
import 'package:khontext/redux/states/translate/translate_state.dart';
import 'package:khontext/redux/states/translate/translate_tax_state.dart';
import 'package:khontext/redux/states/translatorpayments/translator_payments_state.dart';
import 'package:khontext/redux/states/userchat/user_chat_state.dart';
import 'package:khontext/redux/states/userchat/user_conversations_state.dart';
import 'package:meta/meta.dart';

/// [AppState] class is the root class which will provide the state of the entire application.
class AppState {
  final SignInState signInState;
  final VerifyIdentityState verifyIdentityState;
  final ForgetPasswordState forgetPasswordState;
  final SignUpState signUpState;
  OnBoardingState onBoardingState;
  final PaymentHistoryState paymentHistoryState;
  final TranslateState translateState;
  final TranslateExperienceState translateExperienceState;
  final TranslateEducationState translateEducationState;
  final TranslateJobsState translateJobsState;
  final TranslateContractsState translateContractsState;
  final TranslateScheduleState translateScheduleState;
  final TranslateEarningsState translateEarningsState;
  final TranslateTaxState translateTaxState;
  final ClientProfileState clientProfileState;
  final ClientAddressState clientAddressState;
  final ClientCompanyState clientCompanyState;
  final ClientProfileLocalState clientProfileLocalState;
  PostJobsState postJobsState;
  PostJobDescriptionState postJobDescriptionState;
  final PostJobLanguageState postJobLanguageState;
  final PostJobLocalityState postJobLocalityState;
  final PostJobVisibilityState postJobVisibilityState;
  final PostJobScheduleState postJobScheduleState;
  final PostJobReviewState postJobReviewState;
  final PostedJobsListState postedJobsListState;
  final UserConversationState userConversationState;
  final UserChatState userChatState;
  final PaymentState paymentState;
  final TranslatorPaymentState translatorPaymentState;
  final TranslateIdentificationState translateIdentificationState;
  final TranslateLanguageState translateLanguageState;
  final TranslateApplyJobsState translateApplyJobsState;

  AppState({
    @required this.signInState,
    @required this.verifyIdentityState,
    @required this.forgetPasswordState,
    @required this.signUpState,
    @required this.onBoardingState,
    @required this.paymentHistoryState,
    @required this.postJobsState,
    @required this.translateState,
    @required this.translateExperienceState,
    @required this.translateEducationState,
    @required this.translateJobsState,
    @required this.translateContractsState,
    @required this.translateScheduleState,
    @required this.translateEarningsState,
    @required this.translateTaxState,
    @required this.clientProfileState,
    @required this.clientAddressState,
    @required this.clientCompanyState,
    @required this.clientProfileLocalState,
    @required this.postJobDescriptionState,
    @required this.postJobLanguageState,
    @required this.postJobLocalityState,
    @required this.postJobVisibilityState,
    @required this.postJobScheduleState,
    @required this.postJobReviewState,
    @required this.postedJobsListState,
    @required this.userConversationState,
    @required this.userChatState,
    @required this.paymentState,
    @required this.translatorPaymentState,
    @required this.translateIdentificationState,
    @required this.translateLanguageState,
    @required this.translateApplyJobsState,
  });

  /// [factory] method which is passed as the initial state of the redux store.
  factory AppState.initial() {
    return AppState(
      signInState: SignInState.initial(),
      verifyIdentityState: VerifyIdentityState.initial(),
      forgetPasswordState: ForgetPasswordState.initial(),
      signUpState: SignUpState.initial(),
      onBoardingState: OnBoardingState.initial(),
      paymentHistoryState: PaymentHistoryState.initial(),
      postJobsState: PostJobsState.initial(),
      translateState: TranslateState.initial(),
      translateExperienceState: TranslateExperienceState.initial(),
      translateEducationState: TranslateEducationState.initial(),
      translateIdentificationState: TranslateIdentificationState.initial(),
      translateJobsState: TranslateJobsState.initial(),
      translateContractsState: TranslateContractsState.initial(),
      translateScheduleState: TranslateScheduleState.initial(),
      translateEarningsState: TranslateEarningsState.initial(),
      translateTaxState: TranslateTaxState.initial(),
      clientProfileState: ClientProfileState.initial(),
      clientAddressState: ClientAddressState.initial(),
      clientCompanyState: ClientCompanyState.initial(),
      clientProfileLocalState: ClientProfileLocalState.initial(),
      postJobDescriptionState: PostJobDescriptionState.initial(),
      postJobLanguageState: PostJobLanguageState.initial(),
      postJobLocalityState: PostJobLocalityState.initial(),
      postJobVisibilityState: PostJobVisibilityState.initial(),
      postJobScheduleState: PostJobScheduleState.initial(),
      postJobReviewState: PostJobReviewState.initial(),
      postedJobsListState: PostedJobsListState.initial(),
      userConversationState: UserConversationState.initial(),
      userChatState: UserChatState.initial(),
      paymentState: PaymentState.initial(),
      translatorPaymentState: TranslatorPaymentState.initial(),
      translateLanguageState: TranslateLanguageState.initial(),
      translateApplyJobsState: TranslateApplyJobsState.initial(),
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          signInState == other.signInState &&
          verifyIdentityState == other.verifyIdentityState &&
          forgetPasswordState == other.forgetPasswordState &&
          signUpState == other.signUpState &&
          onBoardingState == other.onBoardingState &&
          paymentHistoryState == other.paymentHistoryState &&
          postJobsState == other.postJobsState &&
          translateState == other.translateState &&
          translateExperienceState == other.translateExperienceState &&
          translateEducationState == other.translateEducationState &&
          translateJobsState == other.translateJobsState &&
          translateContractsState == other.translateContractsState &&
          translateScheduleState == other.translateScheduleState &&
          translateEarningsState == other.translateEarningsState &&
          translateIdentificationState == other.translateIdentificationState &&
          translateTaxState == other.translateTaxState &&
          clientProfileState == other.clientProfileState &&
          clientAddressState == other.clientAddressState &&
          clientCompanyState == other.clientCompanyState &&
          clientProfileLocalState == other.clientProfileLocalState &&
          postJobDescriptionState == other.postJobDescriptionState &&
          postJobLanguageState == other.postJobLanguageState &&
          postJobLocalityState == other.postJobLocalityState &&
          postJobVisibilityState == other.postJobVisibilityState &&
          postJobScheduleState == other.postJobScheduleState &&
          postJobReviewState == other.postJobReviewState &&
          postedJobsListState == other.postedJobsListState &&
          userConversationState == other.userConversationState &&
          userChatState == other.userChatState &&
          paymentState == other.paymentState &&
          translatorPaymentState == other.translatorPaymentState &&
          translateLanguageState == other.translateLanguageState &&
          translateApplyJobsState == other.translateApplyJobsState;

  @override
  int get hashCode =>
      signInState.hashCode ^
      verifyIdentityState.hashCode ^
      forgetPasswordState.hashCode ^
      signUpState.hashCode ^
      onBoardingState.hashCode ^
      paymentHistoryState.hashCode ^
      postJobsState.hashCode ^
      translateState.hashCode ^
      translateExperienceState.hashCode ^
      translateEducationState.hashCode ^
      translateJobsState.hashCode ^
      translateContractsState.hashCode ^
      translateScheduleState.hashCode ^
      translateEarningsState.hashCode ^
      translateIdentificationState.hashCode ^
      translateTaxState.hashCode ^
      clientProfileState.hashCode ^
      clientAddressState.hashCode ^
      clientCompanyState.hashCode ^
      clientProfileLocalState.hashCode ^
      postJobDescriptionState.hashCode ^
      postJobLanguageState.hashCode ^
      postJobLocalityState.hashCode ^
      postJobVisibilityState.hashCode ^
      postJobScheduleState.hashCode ^
      postJobReviewState.hashCode ^
      postedJobsListState.hashCode ^
      userConversationState.hashCode ^
      userChatState.hashCode ^
      paymentState.hashCode ^
      translatorPaymentState.hashCode ^
      translateLanguageState.hashCode ^
      translateApplyJobsState.hashCode;
}
