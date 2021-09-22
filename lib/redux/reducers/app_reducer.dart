import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/reducers/applyjobs/apply_jobs_reducer.dart';
import 'package:khontext/redux/reducers/clientprofile/client_address_reducer.dart';
import 'package:khontext/redux/reducers/clientprofile/client_company_reducer.dart';
import 'package:khontext/redux/reducers/clientprofile/client_profile_local_reducer.dart';
import 'package:khontext/redux/reducers/clientprofile/client_profile_reducer.dart';
import 'package:khontext/redux/reducers/forgetpassword/forget_password_reducer.dart';
import 'package:khontext/redux/reducers/onboarding/onboarding_reducer.dart';
import 'package:khontext/redux/reducers/paymenthistory/payment_history_reducer.dart';
import 'package:khontext/redux/reducers/payments/payments_reducer.dart';
import 'package:khontext/redux/reducers/postedjobs/posted_jobs_list_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_description_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_language_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_locality_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_review_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_schedule_reducer.dart';
import 'package:khontext/redux/reducers/postjobs/post_jobs_visibility_reducer.dart';
import 'package:khontext/redux/reducers/signin/sign_in_reducer.dart';
import 'package:khontext/redux/reducers/signin/verify_identity_reducer.dart';
import 'package:khontext/redux/reducers/signup/sign_up_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_contracts_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_earning_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_education_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_experience_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_identification_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_jobs_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_language_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_schedule_reducer.dart';
import 'package:khontext/redux/reducers/translate/translate_tax_reducer.dart';
import 'package:khontext/redux/reducers/translatorpayments/translator_payments_reducer.dart';
import 'package:khontext/redux/reducers/userchat/user_chat_reducer.dart';
import 'package:khontext/redux/reducers/userchat/user_conversation_reducer.dart';

/// [appReducer] will have all the reducers that exists in the application.
/// This will return the current state of the application. Will be following the [AppMiddleware].
AppState appReducer(AppState state, dynamic action) {
  return AppState(
    signInState: signInReducer(state.signInState, action),
    forgetPasswordState: forgetPasswordReducer(state.forgetPasswordState, action),
    verifyIdentityState: verifyIdentityReducer(state.verifyIdentityState, action),
    signUpState: signUpReducer(state.signUpState, action),
    onBoardingState: onBoardingReducer(state.onBoardingState, action),
    paymentHistoryState: paymentHistoryReducer(state.paymentHistoryState, action),
    postJobsState: postJobsReducer(state.postJobsState, action),
    translateState: translateReducer(state.translateState, action),
    translateExperienceState: translateExperienceReducer(state.translateExperienceState, action),
    translateEducationState: translateEducationReducer(state.translateEducationState, action),
    translateJobsState: translateJobsReducer(state.translateJobsState, action),
    translateContractsState: translateContractsReducer(state.translateContractsState, action),
    translateScheduleState: translateScheduleReducer(state.translateScheduleState, action),
    translateEarningsState: translateEarningsReducer(state.translateEarningsState, action),
    translateTaxState: translateTaxReducer(state.translateTaxState, action),
    clientProfileState: clientProfileReducer(state.clientProfileState, action),
    clientAddressState: clientAddressReducer(state.clientAddressState, action),
    clientCompanyState: clientCompanyReducer(state.clientCompanyState, action),
    clientProfileLocalState: clientProfileLocalReducer(state.clientProfileLocalState, action),
    postJobDescriptionState: postJobsDescriptionReducer(state.postJobDescriptionState, action),
    postJobLanguageState: postJobsLanguageReducer(state.postJobLanguageState, action),
    postJobLocalityState: postJobLocalityReducer(state.postJobLocalityState, action),
    postJobVisibilityState: postJobVisibilityReducer(state.postJobVisibilityState, action),
    postJobScheduleState: postJobScheduleReducer(state.postJobScheduleState, action),
    postJobReviewState: postJobReviewReducer(state.postJobReviewState, action),
    postedJobsListState: postedJobsListReducer(state.postedJobsListState, action),
    userConversationState: userConversationReducer(state.userConversationState, action),
    userChatState: userChatReducer(state.userChatState, action),
    paymentState: paymentsReducer(state.paymentState, action),
    translatorPaymentState: translatorPaymentsReducer(state.translatorPaymentState, action),
    translateIdentificationState:
        translateIdentificationReducer(state.translateIdentificationState, action),
    translateLanguageState: translateLanguageReducer(state.translateLanguageState, action),
    translateApplyJobsState: translateApplyJobsReducer(state.translateApplyJobsState, action),
  );
}
