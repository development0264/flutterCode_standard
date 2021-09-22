import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:http/http.dart' as http;
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/screens/clientprofile/client_profile.dart';
import 'package:khontext/src/screens/forgotpassword/forget_password_page.dart';
import 'package:khontext/src/screens/forgotpassword/reset_password.dart';
import 'package:khontext/src/screens/homepage/home_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingaddress/onboarding_address_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_add_education_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingeducation/onboarding_education_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingexperience/onboarding_add_experience_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingexperience/onboarding_experience_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_add_languages_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardinglanguages/onboarding_languages_page.dart';
import 'package:khontext/src/screens/onboarding/onboarding/onboardingverification/onboarding_verification_page.dart';
import 'package:khontext/src/screens/onboarding/preonboarding/get_started_screen.dart';
import 'package:khontext/src/screens/onboarding/preonboarding/welcome_back_screen.dart';
import 'package:khontext/src/screens/onboarding/preonboarding/welcome_screen.dart';
import 'package:khontext/src/screens/paymenthistory/payment_history.dart';
import 'package:khontext/src/screens/payments/payments.dart';
import 'package:khontext/src/screens/postedjobs/posted_jobs.dart';
import 'package:khontext/src/screens/postedjobs/posted_jobs_details.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/acceptjobs/jobs_proposals.dart';
import 'package:khontext/src/screens/postjobs/post_job_screen.dart';
import 'package:khontext/src/screens/requesttranslator/requesttranslator/request_translator.dart';
import 'package:khontext/src/screens/requesttranslator/requesttranslator/translator_list.dart';
import 'package:khontext/src/screens/signin/identityverfication/identity_verification_page.dart';
import 'package:khontext/src/screens/signin/signin/sign_in.dart';
import 'package:khontext/src/screens/signup/create_account_page.dart';
import 'package:khontext/src/screens/signup/phone_number_page.dart';
import 'package:khontext/src/screens/signup/user_role_page.dart';
import 'package:khontext/src/screens/signup/verify_email_page.dart';
import 'package:khontext/src/screens/signup/verify_phone_number_page.dart';
import 'package:khontext/src/screens/translate/translate_page.dart';
import 'package:khontext/src/screens/translate/translatemodules/appliedjobs/applied_jobs_page.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorcontracts/translator_contracts_details.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/billing_method_details.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorearnings/earnings_history.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorjobs/apply_jobs_page.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorjobs/translator_favourite_jobs.dart';
import 'package:khontext/src/screens/userchat/user_chat_page.dart';
import 'package:khontext/src/screens/userchat/user_chat_room_page.dart';
import 'package:khontext/src/screens/voicecall/voice_call_screen.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/utils.dart';
import 'package:redux/redux.dart';
import 'package:twilio_voice/twilio_voice.dart';

import 'src/screens/paymenthistory/payment_history.dart';

class KhontextApp extends StatefulWidget {
  final Store<AppState> store;

  const KhontextApp({Key key, this.store}) : super(key: key);

  @override
  _KhontextAppState createState() => _KhontextAppState();
}

class _KhontextAppState extends State<KhontextApp> with WidgetsBindingObserver {
  var hasPushedToCall = false;
  AppLifecycleState state;
  final GlobalKey<NavigatorState> _navigator = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Utils.initiatePreferences();
    ApiProvider.client = http.Client();
    // registerDeviceForCall();
    // waitForCall();
    // ChatUtils.initiateChatChannel(widget.store, _navigator);
    // PaymentUtils.initialPaymentChannel(widget.store, _navigator);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: 'Khontext App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'WorkSans',
        ),
        navigatorKey: _navigator,
        // navigatorObservers: [DatadogObserver()],
        routes: {
          RoutesConstants.signIn: (context) => SignInPage(),
          RoutesConstants.identityVerification: (context) => IdentityVerificationPage(),
          RoutesConstants.forgotPassword: (context) => ForgetPasswordPage(),
          RoutesConstants.signUp: (context) => CreateAccountPage(),
          RoutesConstants.addPhoneNumberSignUp: (context) => PhoneNumberPage(),
          RoutesConstants.userRolePage: (context) => UserRolePage(),
          RoutesConstants.welcomeScreen: (context) => WelcomeScreenPage(),
          RoutesConstants.getStartedScreen: (context) => GetStartedPage(),
          RoutesConstants.welcomeBackScreen: (context) => WelcomeBackScreen(),
          RoutesConstants.clientProfile: (context) => ClientProfilePage(),
          RoutesConstants.payment: (context) => PaymentsPage(),
          RoutesConstants.paymentHistory: (context) => PaymentHistory(),
          RoutesConstants.postedJobs: (context) => PostedJobsPage(),
          RoutesConstants.homePage: (context) => HomePage(),
          RoutesConstants.translatePage: (context) => TranslatePage(),
          RoutesConstants.earningsHistoryPage: (context) => EarningsHistoryPage(),
          RoutesConstants.requestTranslatorPage: (context) => RequestTranslatorPage(),
          RoutesConstants.userChatPage: (context) => UserChatPage(),
          RoutesConstants.translatorFavoriteJobs: (context) => TranslatorFavouriteJobs(),
        },
        onGenerateRoute: (settings) => onGenerateRoute(settings),
        localizationsDelegates: [
          FormBuilderLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('es', ''),
        ],
        home: Builder(builder: (rootContext) {
          Utils.setScreenSizes(rootContext);
          return SignInPage();
        }),
      ),
    );
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    Widget child;
    Map<String, dynamic> argsMaps = Map();
    if (settings.arguments != null) {
      argsMaps = (settings.arguments as Map<String, dynamic>);
    }
    switch (settings.name) {
      case RoutesConstants.verifyEmailSignUp:
        child = VerifyEmailPage(userEmail: argsMaps[RoutesConstantsArguments.userEmailArgs]);
        break;
      case RoutesConstants.verifyPhoneSignUp:
        child = VerifyPhoneNumberPage(
          phoneNumber: argsMaps[RoutesConstantsArguments.userPhoneArgs],
          countryCode: argsMaps[RoutesConstantsArguments.userCountryCodeArgs],
        );
        break;
      case RoutesConstants.postedJobsDetails:
        child = PostedJobsDetailsPage(jobsModel: argsMaps[RoutesConstantsArguments.jobModelArgs]);
        break;
      case RoutesConstants.translateContractDetailsPage:
        child = TranslatorContractDetails(
            singleModel: argsMaps[RoutesConstantsArguments.contractModelArgs]);
        break;
      case RoutesConstants.billingDetailsPage:
        child = BillingMethodDetails(usertype: argsMaps[RoutesConstantsArguments.userTypeArgs]);
        break;
      case RoutesConstants.postJobs:
        child = PostJobPage(jobId: argsMaps[RoutesConstantsArguments.jobIdArgs]);
        break;
      case RoutesConstants.translatorListPage:
        child = TranslatorListPage(language: argsMaps[RoutesConstantsArguments.translatorLanguage]);
        break;
      case RoutesConstants.userChatRoomPage:
        child = UserChatRoomPage(
          userName: argsMaps[RoutesConstantsArguments.userChatName],
          conversationId: argsMaps[RoutesConstantsArguments.userConversationId],
        );
        break;
      case RoutesConstants.applyJobsPage:
        child = ApplyJobsPage(jobRecord: argsMaps[RoutesConstantsArguments.jobData]);
        break;
      case RoutesConstants.appliedJobsPage:
        child = AppliedJobsPage();
        break;
      case RoutesConstants.acceptJobsPage:
        child = JobsProposalsPage(jobsModel: argsMaps[RoutesConstantsArguments.jobData]);
        break;
      case RoutesConstants.onBoardingAddressScreen:
        child = OnBoardingAddressPage();
        break;
      case RoutesConstants.onBoardingAddLanguagesScreen:
        child = OnBoardingAddLanguagesPage();
        break;
      case RoutesConstants.onBoardingLanguagesScreen:
        child = OnBoardingLanguagesPage();
        break;
      case RoutesConstants.onBoardingAddEducationScreen:
        child = OnBoardingAddEducationPage();
        break;
      case RoutesConstants.onBoardingEducationScreen:
        child = OnBoardingEducationPage();
        break;
      case RoutesConstants.onBoardingExperienceScreen:
        child = OnBoardingExperiencePage();
        break;
      case RoutesConstants.onBoardingAddExperienceScreen:
        child = OnBoardingAddExperiencePage();
        break;
      case RoutesConstants.onBoardingVerificationScreen:
        child = OnBoardingVerificationPage();
        break;
      default:
        child = SignInPage();
        break;
    }

    /// Conditions for the deep linking.
    /// The deep linking will give the route path as well as token in the [settings.name]
    /// So conditions have been placed to split the entire name path in the reset password screen
    /// and then move the path along with the split token value.
    if (settings.name.startsWith(Constants.changePasswordConst)) {
      String token = settings.name.split("/").last;
      print("The token --> $token");
      child = ResetPasswordPage(userToken: token);
    }

    return MaterialPageRoute(
        settings: RouteSettings(name: settings.name),
        builder: (context) {
          Utils.setScreenSizes(context);
          return child;
        });
  }

  void registerDeviceForCall() async {
    FirebaseMessaging message = FirebaseMessaging.instance;
    String _fcmToken = await message.getToken();
    Utils.setStringToPrefs(Constants.deviceToken, _fcmToken);
  }

  void checkActiveCall() async {
    final isOnCall = await TwilioVoice.instance.call.isOnCall();
    if (isOnCall &&
        !hasPushedToCall &&
        TwilioVoice.instance.call.activeCall?.callDirection == CallDirection.incoming) {
      pushToCallScreen();
      hasPushedToCall = true;
    }
  }

  void waitForCall() {
    checkActiveCall();
    TwilioVoice.instance.callEventsListener
      ..listen((event) {
        switch (event) {
          case CallEvent.answer:
            pushToCallScreen();
            hasPushedToCall = true;
            break;
          case CallEvent.connected:
            if (Platform.isAndroid &&
                TwilioVoice.instance.call.activeCall?.callDirection == CallDirection.incoming) {
              if (state != AppLifecycleState.resumed) {
                TwilioVoice.instance.showBackgroundCallUI();
              } else if (state == null || state == AppLifecycleState.resumed) {
                pushToCallScreen();
                hasPushedToCall = true;
              }
            }
            break;
          case CallEvent.callEnded:
            hasPushedToCall = false;
            break;
          case CallEvent.returningCall:
            pushToCallScreen();
            hasPushedToCall = true;
            break;
          case CallEvent.callError:
            final callError = TwilioVoice.instance.call.activeCall.callError;
            _navigator.currentState.pop();
            // Fluttertoast.showToast(msg: callError ?? 'Empty error');
            break;
          default:
            break;
        }
      });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    this.state = state;
    print("didChangeAppLifecycleState");
    if (state == AppLifecycleState.resumed) {
      checkActiveCall();
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void pushToCallScreen() {
    _navigator.currentState
        .push(MaterialPageRoute(fullscreenDialog: true, builder: (context) => VoiceCallScreen()));
  }
}
