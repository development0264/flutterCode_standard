import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/onboarding/onboarding_data_actions.dart';
import 'package:khontext/redux/actions/onboarding/onboardingaddress/onboarding_address_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/onboarding/onboarding_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_scroll_view.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/job_services_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingaddress/onboarding_address_response_model.dart';
import 'package:khontext/src/screens/onboarding/onboarding/time_line_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/base_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class OnBoardingAddressPage extends StatefulWidget {
  const OnBoardingAddressPage({Key key}) : super(key: key);

  @override
  OnBoardingAddressPageState createState() => OnBoardingAddressPageState();
}

class OnBoardingAddressPageState extends State<OnBoardingAddressPage> {
  /// Global key for maintaining the state of the form.
  final _onBoardingAddressFormKey = GlobalKey<FormBuilderState>();
  final _addressFormKey = GlobalKey<FormBuilderState>();

  /// [bool] value which holds the toggle flags.
  bool isRemember = false;

  /// [ClientAddressData] for the usage of showing the data.
  ClientAddressData clientAddressData;

  /// Store instance to use further
  Store<AppState> store;

  /// List of the selected job services. This list shall be passed in the api call.
  List<String> selectedJobServicesList = [];

  /// [TextEditingController] for the entire sign in form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _hourlyRateController = TextEditingController();
  final TextEditingController _ratePerPageController = TextEditingController();
  final TextEditingController _gasRateController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _hourlyRateFocus = FocusNode();
  final FocusNode _rateParPageFocus = FocusNode();
  final FocusNode _gasRateFocus = FocusNode();

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter _ratesState;

  /// Address model which will be used to pass data to the api
  AddressReturnModel addressReturnModel;

  /// OnBoarding address data to show the prefilled data
  OnBoardingAddressData onBoardingAddressData;

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key nextStepBtnKey = Key(Constants.nextStepBtnKey);
  Key hourlyRateKey = Key(Constants.hourlyKey);
  Key ratePerPageKey = Key(Constants.ratePerKey);
  Key gasRateKey = Key(Constants.gasKey);

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    _hourlyRateFocus.addListener(() {
      this._ratesState(() {});
    });
    _rateParPageFocus.addListener(() {
      this._ratesState(() {});
    });
    _gasRateFocus.addListener(() {
      this._ratesState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      resizeToAvoidBottomInset: true,
      baseChild: StoreConnector<AppState, OnBoardingAddressViewModel>(
          converter: (store) => OnBoardingAddressViewModel(store.state.onBoardingState),
          onInit: (store) => store.dispatch(GetJobServicesActions(context: context)),
          builder: (context, vm) {
            checkError(vm);
            if (!vm.onBoardingState.isLoading &&
                vm?.onBoardingState?.onBoardingDataResponseModel?.data?.addressAndServices !=
                    null) {
              onBoardingAddressData =
                  vm.onBoardingState.onBoardingDataResponseModel.data.addressAndServices;
              setAddressPrefill();
            }
            return Stack(
              children: [
                _onBoardAddressWidget(vm),
                if (vm.onBoardingState.isLoading &&
                    (vm.onBoardingState.currentAction == GetJobServicesActions ||
                        vm.onBoardingState.currentAction == AddOnBoardingAddressActions)) ...[
                  BaseLoadingWidget()
                ],
              ],
            );
          }),
    );
  }

  /// Widget function which gives ui for the on boarding address page
  Widget _onBoardAddressWidget(OnBoardingAddressViewModel vm) {
    return FormBuilderScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          Center(
            child: FormBuilderText(
              message: FormBuilderLocalizations.of(context).addressServicesText,
              textStyle: Styles.customTextStyle(
                textSize: Palette.largeFontSize,
                textColor: Palette.DarkTextColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          TimeLineWidget(ticks: 0),
          Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).yourAddressText,
            textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.DarkTextColor,
                fontWeight: FontWeight.bold),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          _addressFormWidget(vm),
        ],
      ),
    );
  }

  Widget _addressFormWidget(OnBoardingAddressViewModel vm) {
    return FormBuilder(
      key: _onBoardingAddressFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseAddressWidget(
            locationFormKey: _addressFormKey,
            clientAddressData: clientAddressData,
            onAddressChanged: (AddressReturnModel address) {
              this.addressReturnModel = address;
            },
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).yourTranslationText,
            textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.DarkTextColor,
                fontWeight: FontWeight.bold),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
          _servicesWidget(vm),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).yourRatesText,
            textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.DarkTextColor,
                fontWeight: FontWeight.bold),
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          _ratesLayout(),
          Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
          _nextStepButton(),
        ],
      ),
    );
  }

  /// Widget function which gives the ui for the  services widget which gives the list of the
  /// services. Calls the api and shows the data after.
  Widget _servicesWidget(OnBoardingAddressViewModel vm) {
    if (!vm.onBoardingState.isLoading &&
        vm.onBoardingState.jobServicesResponseModel.data.isNotEmpty) {
      return ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: vm.onBoardingState.jobServicesResponseModel.data.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          JobServicesData singleData = vm.onBoardingState.jobServicesResponseModel.data[index];
          return _servicesCheckbox(singleData);
        },
      );
    }

    return SizedBox();
  }

  /// Widget function for the single checkbox item.
  Widget _servicesCheckbox(JobServicesData jobServicesData) {
    return FormBuilderCheckbox(
      name: jobServicesData.name,
      decoration: Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
      initialValue: selectedJobServicesList.contains(jobServicesData.onboardQuizServiceId),
      activeColor: Palette.AppThemeColor,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      contentPadding: EdgeInsets.zero,
      onChanged: (value) => onCheckboxChanged(jobServicesData, mounted),
      title: Padding(
        padding: EdgeInsets.symmetric(vertical: Palette.smallSpace),
        child: FormBuilderText(
          message: jobServicesData.name,
          textStyle: Styles.customTextStyle(textSize: 15.0, textColor: Colors.black),
        ),
      ),
    );
  }

  /// Widget function which gives ui for the rates layout
  Widget _ratesLayout() {
    return StatefulBuilder(builder: (context, state) {
      this._ratesState = state;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: FormBuilderTextField(
                  key: hourlyRateKey,
                  name: Constants.hourlyRate,
                  controller: _hourlyRateController,
                  textInputAction: TextInputAction.next,
                  focusNode: _hourlyRateFocus,
                  keyboardType: TextInputType.number,
                  decoration: Styles.textInputDecoration(
                    hint: FormBuilderLocalizations.of(context).hourlyRateText,
                    focusNode: _hourlyRateFocus,
                  ),
                  validator: FormBuilderValidators.required(context,
                      errorText: FormBuilderLocalizations.of(context).hourlyRateErrorText),
                ),
              ),
              SizedBox(width: Palette.smallSpace),
              Expanded(
                child: FormBuilderTextField(
                  key: ratePerPageKey,
                  name: Constants.ratePerPage,
                  controller: _ratePerPageController,
                  textInputAction: TextInputAction.next,
                  focusNode: _rateParPageFocus,
                  keyboardType: TextInputType.number,
                  decoration: Styles.textInputDecoration(
                    hint: FormBuilderLocalizations.of(context).ratePerPageText,
                    focusNode: _rateParPageFocus,
                  ),
                  validator: FormBuilderValidators.required(context,
                      errorText: FormBuilderLocalizations.of(context).ratePerPageErrorText),
                ),
              ),
            ],
          ),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          FormBuilderTextField(
            key: gasRateKey,
            name: Constants.gasRate,
            controller: _gasRateController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.number,
            focusNode: _gasRateFocus,
            decoration: Styles.textInputDecoration(
              hint: FormBuilderLocalizations.of(context).gasText,
              focusNode: _gasRateFocus,
            ),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).gasErrorText),
          ),
        ],
      );
    });
  }

  /// Widget function which gives ui for the next step button
  Widget _nextStepButton() {
    return StatefulBuilder(
      builder: (context, setState) {
        return BaseButtonWidget(
          key: nextStepBtnKey,
          minWidth: Utils.screenWidth,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).nextStepText,
            textStyle: Styles.customTextStyle(
              textColor: Colors.white,
            ),
          ),
          onPressed: () => onNextStepClick(),
        );
      },
    );
  }

  /// Group of functions which gives the functionalities like button click events, state value
  /// changes.
  void onCheckboxChanged(JobServicesData jobServicesData, bool mounted) {
    if (!mounted) return;
    if (selectedJobServicesList.contains(jobServicesData.onboardQuizServiceId)) {
      selectedJobServicesList.remove(jobServicesData.onboardQuizServiceId);
    } else {
      selectedJobServicesList.add(jobServicesData.onboardQuizServiceId);
    }
  }

  void setAddressPrefill() {
    clientAddressData = ClientAddressData(
      addressId: onBoardingAddressData.addressId,
      streetNumber: '',
      streetName: '',
      line1: onBoardingAddressData.line1,
      line2: onBoardingAddressData.line2,
      addressType: Constants.clientType,
      city: onBoardingAddressData.city,
      county: onBoardingAddressData.state,
      zipCode: onBoardingAddressData.zipCode,
      timezone: '',
      country: onBoardingAddressData.country,
    );

    selectedJobServicesList.clear();
    onBoardingAddressData.services
        .map((e) => selectedJobServicesList.add(e.onboardQuizServiceId))
        .toList();
    _hourlyRateController.text = onBoardingAddressData.ratePerHour;
    _ratePerPageController.text = onBoardingAddressData.ratePerPage;
    _gasRateController.text = onBoardingAddressData.ratePerMileOrKm;
  }

  void onNextStepClick() {
    if (addressReturnModel?.streetRoute?.isEmpty == true) {
      Utils.showToast(
          context: context, message: FormBuilderLocalizations.of(context).streetAddressErrorText);
      return;
    }
    if (_addressFormKey.currentState.validate() &&
        _onBoardingAddressFormKey.currentState.validate()) {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      if (userId == null || userId.isEmpty) {
        Utils.showToast(
            context: context, message: FormBuilderLocalizations.of(context).loginFirstText);
        return;
      }

      List<String> line1 = [
        addressReturnModel.streetNumber,
        addressReturnModel.streetRoute,
        addressReturnModel.subLocality3
      ];

      List<String> line2 = [
        addressReturnModel.subLocality2,
        addressReturnModel.subLocality1,
        addressReturnModel.locality
      ];

      store.dispatch(
        AddOnBoardingAddressActions(
            context: context,
            onBoardingAddressRequestModel: getOnBoardingData(
                onBoardingAddressData?.addressId, userId, line1, line2, this.addressReturnModel)),
      );
    }
  }

  OnBoardingAddressRequestModel getOnBoardingData(String isAddress, String userId,
      List<String> line1, List<String> line2, AddressReturnModel addressReturnModel) {
    if (isAddress?.isNotEmpty == true) {
      return OnBoardingAddressRequestModel(
        addressId: isAddress,
        userId: userId,
        line1: Utils().getSeparatedAddress(line1),
        line2: Utils().getSeparatedAddress(line2),
        city: addressReturnModel.city,
        state: addressReturnModel.state,
        zipCode: addressReturnModel.postalCode,
        country: addressReturnModel.country,
        serviceIds: selectedJobServicesList,
        ratePerHour: _hourlyRateController.text,
        ratePerPage: _ratePerPageController.text,
        ratePerMileOrKm: _gasRateController.text,
        about: '',
      );
    } else {
      return OnBoardingAddressRequestModel(
        userId: userId,
        line1: Utils().getSeparatedAddress(line1),
        line2: Utils().getSeparatedAddress(line2),
        city: addressReturnModel.city,
        state: addressReturnModel.state,
        zipCode: addressReturnModel.postalCode,
        country: addressReturnModel.country,
        serviceIds: selectedJobServicesList,
        ratePerHour: _hourlyRateController.text,
        ratePerPage: _ratePerPageController.text,
        ratePerMileOrKm: _gasRateController.text,
        about: '',
      );
    }
  }

  void checkError(OnBoardingAddressViewModel vm) {
    if (vm?.onBoardingState?.isLoading == false && vm?.onBoardingState?.error?.isNotEmpty == true) {
      Utils.showToast(context: context, message: vm.onBoardingState.error);
      store.dispatch(OnBoardingClearActions());
    }
  }
}

class OnBoardingAddressViewModel {
  final OnBoardingState onBoardingState;

  OnBoardingAddressViewModel(this.onBoardingState);
}
