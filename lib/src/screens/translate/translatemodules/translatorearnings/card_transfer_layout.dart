import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/payments/payments_actions.dart';
import 'package:khontext/redux/actions/translatorpayments/translator_payments_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/payments/payments_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/redux/states/translatorpayments/translator_payments_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_credit_card.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/payments/add_payment_method_request.dart';
import 'package:khontext/src/models/signup/complete_profile_response_model.dart';
import 'package:khontext/src/models/translatorpayments/create_stripe_account_request.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/payment_utils.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

class CardTransferLayout extends StatefulWidget {
  final USERTYPE userType;

  const CardTransferLayout({Key key, @required this.userType}) : super(key: key);

  @override
  _CardTransferLayoutState createState() => _CardTransferLayoutState();
}

class _CardTransferLayoutState extends State<CardTransferLayout> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormState> addCardFormKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> detailsFormKey = GlobalKey<FormBuilderState>();
  final GlobalKey<FormBuilderState> addAddressFormKey = GlobalKey<FormBuilderState>();

  /// String values used for page
  String currentAddress = '';
  String paymentToken = '';
  String file64 = '';

  /// BirthDate [DateTime]
  DateTime birthDate;

  /// New model which will give the updated values.
  CreditCardModel newCreditCardModel;

  /// New model for address which will give the value for the new address.
  ClientAddressData currentAddressModel = ClientAddressData.initial();

  /// [bool] for the loading at particular instances
  bool isLoading = false;

  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _ssnNumberController = TextEditingController();
  final TextEditingController _idProofController = TextEditingController();

  /// Store instance to use further
  Store<AppState> store;

  /// [SignInState], [PaymentState] and [ProfileData] which will help getting the current account status of the user.
  SignInState signInState;
  PaymentState paymentState;
  ProfileData profileData;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    signInState = store.state.signInState;
    paymentState = store.state.paymentState;
    profileData = signInState.completeProfileResponseModel.data;
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, CreateAccountViewModel>(
      converter: (store) => CreateAccountViewModel(store, store.state.translatorPaymentState),
      builder: (context, vm) {
        if (isLoading ||
            vm?.translatorPaymentState?.isLoading == true &&
                vm?.translatorPaymentState?.currentAction == CreateStripeAccountAction &&
                mounted) {
          return BaseLoadingWidget();
        } else if (vm.translatorPaymentState?.createStripeAccountResponseModel?.isSuccessful ==
                true &&
            mounted) {
          vm.store.dispatch(ClearTranslatorPaymentStateAction());
          Navigator.of(context).popUntil(ModalRoute.withName(RoutesConstants.translatePage));
        }
        return mounted
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    CreditCardForm(
                      formKey: addCardFormKey,
                      obscureCvv: true,
                      obscureNumber: false,
                      cardNumberDecoration:
                          Styles.textInputDecoration(hint: Constants.paymentCardNumberHint),
                      expiryDateDecoration:
                          Styles.textInputDecoration(hint: Constants.paymentExpiryDateHint),
                      cvvCodeDecoration: Styles.textInputDecoration(hint: Constants.paymentCVVHint),
                      cardHolderDecoration:
                          Styles.textInputDecoration(hint: Constants.paymentCardHolderHint),
                      onCreditCardModelChange: (onCreditCardModelChange) {
                        this.newCreditCardModel = onCreditCardModelChange;
                      },
                    ),
                    const SizedBox(height: 8.0),
                    commonTextTitle(FormBuilderLocalizations.of(context).billingAddText),
                    const SizedBox(height: 5),
                    _addressSelectionView(),
                    BaseButtonWidget(
                      minWidth: Utils.screenWidth,
                      btnChild: FormBuilderText(
                        message: FormBuilderLocalizations.of(context).saveText,
                        textStyle: Styles.customTextStyle(textColor: Colors.white),
                      ),
                      onPressed: () => onSaveClick(vm),
                    ),
                  ],
                ),
              )
            : SizedBox();
      },
    );
  }

  Widget _otherDetailsLayout(CreateAccountViewModel vm) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          children: [
            commonTextTitle(FormBuilderLocalizations.of(context).personalDetailsText),
            const SizedBox(height: 15.0),
            FormBuilder(
              key: detailsFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonTextTitle(FormBuilderLocalizations.of(context).ssNumberText),
                  FormBuilderTextField(
                    name: Constants.ssnNumberText,
                    controller: _ssnNumberController,
                    textInputAction: TextInputAction.next,
                    decoration: Styles.textInputDecoration(
                        hint: FormBuilderLocalizations.of(context).ssNNumber),
                    validator: FormBuilderValidators.required(context,
                        errorText: FormBuilderLocalizations.of(context).ssNError),
                  ),
                  const SizedBox(height: 15),
                  commonTextTitle(FormBuilderLocalizations.of(context).dateOfBirthText),
                  FormBuilderDateTimePicker(
                    name: Constants.startDatePicker,
                    inputType: InputType.date,
                    onChanged: (newDateTime) {
                      this.birthDate = newDateTime;
                    },
                    decoration: Styles.textInputDecoration(
                        hint: FormBuilderLocalizations.of(context).dateOfBirthText),
                  ),
                  const SizedBox(height: 15),
                  commonTextTitle(
                      "${FormBuilderLocalizations.of(context).idVerificationText} ${profileData.firstName}"),
                  commonTextTitle(FormBuilderLocalizations.of(context).securityText),
                  const SizedBox(height: 5),
                  _pickSingleFile(),
                  const SizedBox(height: 15),
                  BaseButtonWidget(
                    minWidth: Utils.screenWidth * 0.2,
                    padding: 2.0,
                    borderRadius: 3,
                    btnChild: FormBuilderText(
                        message: FormBuilderLocalizations.of(context).verifyText,
                        textStyle: Styles.customTextStyle(textColor: Colors.white)),
                    onPressed: () => verifyAndCreateAccount(vm),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Widget function which gives the single file picker for the document of a user.
  Widget _pickSingleFile() {
    return Row(
      children: [
        Expanded(
          child: FormBuilderTextField(
            name: Constants.idProofText,
            controller: _idProofController,
            textInputAction: TextInputAction.next,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).chooseFileText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectFileText),
          ),
        ),
        BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.2,
          padding: 2.0,
          borderRadius: 3,
          btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).browseFileText,
              textStyle: Styles.customTextStyle(textColor: Colors.white)),
          onPressed: () async {
            FilePickerResult result = await FilePicker.platform.pickFiles();
            if (result != null) {
              File pickedFile = File(result.files.single.path);
              final bytes = pickedFile.readAsBytesSync();
              file64 = base64Encode(bytes);
              setState(() {
                _idProofController.text = file64;
              });
            }
          },
        ),
      ],
    );
  }

  /// Widget which gives the UI and functionality for the address selection.
  /// It contains the radio buttons with the list of all the current addresses and one extra address radiobutton
  /// which lets users add new address.
  Widget _addressSelectionView() {
    var store = StoreProvider.of<AppState>(context);
    var state = store.state.paymentState.userAddressListResponseModel;
    if (!state.data.contains(FormBuilderLocalizations.of(context).addNewAddressText)) {
      state.data.add(FormBuilderLocalizations.of(context).addNewAddressText);
    }
    return Column(
      children: [
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).addAddressText,
          textStyle: Styles.customTextStyle(fontWeight: FontWeight.w500, textSize: 18.0),
        ),
        FormBuilderRadioGroup(
          name: Constants.paymentAddressKey,
          validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
          onChanged: (option) {
            if (option == Constants.paymentNewAddressKey) {
              currentAddressModel.addressId = Constants.paymentNewAddressKey;
            } else {
              ClientAddressData model =
                  state.data.firstWhere((element) => element.addressId == option);
              this.currentAddressModel = model;
            }
            onAddressTypeChanged(option);
          },
          decoration: const InputDecoration(border: InputBorder.none),
          options: state.data.map((address) {
            String addressFull = '';
            if (address is ClientAddressData) {
              addressFull = Utils().getSeparatedAddress([
                address.line1,
                address.line2,
                address.city,
                address.county,
                address.country,
                address.zipCode,
              ]);
            }
            return FormBuilderFieldOption(
              value:
                  address is ClientAddressData ? address.addressId : Constants.paymentNewAddressKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FormBuilderText(
                  message: address is ClientAddressData ? addressFull : address,
                  textStyle: Styles.customTextStyle(textSize: 16.0),
                ),
              ),
            );
          }).toList(growable: false),
        ),
        SizedBox(height: currentAddress == Constants.paymentNewAddressKey ? 15.0 : 0),
        newAddressForm(key: addAddressFormKey),
      ],
    );
  }

  /// Widget function which gives the UI for the add new address form.
  Widget newAddressForm({final key}) {
    print("The current address ---> $currentAddress");
    return (currentAddress != '' && currentAddress == Constants.paymentNewAddressKey)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BaseAddressWidget(
              locationFormKey: key,
              clientAddressData: null,
              onAddressChanged: (AddressReturnModel addressReturnModel) {
                this.currentAddressModel.streetNumber = addressReturnModel.streetNumber;
                this.currentAddressModel.streetName = addressReturnModel.streetRoute;
                this.currentAddressModel.line1 = addressReturnModel.subLocality3.isNotEmpty
                    ? addressReturnModel.subLocality3
                    : addressReturnModel.streetRoute;
                this.currentAddressModel.line2 = addressReturnModel.subLocality2;
                this.currentAddressModel.city = addressReturnModel.city;
                this.currentAddressModel.county = addressReturnModel.state;
                this.currentAddressModel.country = addressReturnModel.country;
                this.currentAddressModel.zipCode = addressReturnModel.postalCode;
                this.currentAddressModel.timezone = addressReturnModel.selectedTimeZone;
              },
            ),
          )
        : SizedBox();
  }

  /// Widget function which gives the common text for the title.
  Widget commonTextTitle(String title) {
    return FormBuilderText(
      message: title,
      textStyle: Styles.customTextStyle(textSize: 16.0),
    );
  }

  /// Function which creates the card token and opens the bottomsheet for the further addition
  void onSaveClick(CreateAccountViewModel vm) async {
    if (addCardFormKey?.currentState?.validate() == false || newCreditCardModel == null) {
      Toast.show(FormBuilderLocalizations.of(context).addCardDetailsText, context);
    } else {
      setState(() {
        isLoading = true;
      });
      paymentToken = await PaymentUtils.paymentBridgePlatform.invokeMethod(Constants.paymentCard, {
        Constants.paymentCardNumber: newCreditCardModel.cardNumber,
        Constants.cardExpiryMonth: int.parse(newCreditCardModel.expiryDate.split("/")[0]),
        Constants.cardExpiryYear: int.parse(newCreditCardModel.expiryDate.split("/")[1]),
        Constants.cardCVC: newCreditCardModel.cvvCode,
        Constants.cardHolder: newCreditCardModel.cardHolderName,
      });
      setState(() {
        isLoading = false;
      });
      if (paymentToken?.isNotEmpty == true) {
        showModalBottomSheet(
            context: context,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            builder: (builderContext) {
              return _otherDetailsLayout(vm);
            });
      } else {
        Toast.show(FormBuilderLocalizations.of(context).tokenGenerateErrorText, context);
      }
    }
  }

  /// Function which set the modal state when the address type is changed.
  void onAddressTypeChanged(String value) {
    setState(() {
      currentAddress = value;
    });
  }

  void verifyAndCreateAccount(CreateAccountViewModel vm) {
    if (detailsFormKey?.currentState?.validate() == false ||
        addAddressFormKey?.currentState?.validate() == false) {
      Toast.show(FormBuilderLocalizations.of(context).fillDetailsText, context);
    } else {
      if (widget.userType == USERTYPE.TRANSLATOR) {
        currentAddressModel.addressType = Constants.billingText;
        vm.store.dispatch(CreateStripeAccountAction(
          addressData: currentAddressModel,
          createStripeAccountRequestModel: CreateStripeAccountRequestModel(
            userId: profileData.userId,
            externalAccountSource: paymentToken,
            externalSourceType: 'card',
            country: "us",
            email: profileData.email,
            addressId: currentAddressModel.addressId,
            identificationDocument: file64,
            dateOfBirth: DateOfBirth(
                day: this.birthDate.day, month: this.birthDate.month, year: this.birthDate.year),
            ssnNumber: _ssnNumberController.text,
            ipAddress: '192.0.0.1',
          ),
        ));
      } else {
        store.dispatch(AddPaymentMethodAction(
          addressData: currentAddressModel,
          userType: widget.userType,
          createPaymentMethodRequestModel: CreatePaymentMethodRequestModel(
            userId: '',
            sourceToken: paymentToken,
            type: Constants.cardText,
            addressId: currentAddressModel.addressId,
          ),
        ));
      }
    }
  }
}

class CreateAccountViewModel {
  final TranslatorPaymentState translatorPaymentState;
  final Store<AppState> store;

  CreateAccountViewModel(this.store, this.translatorPaymentState);
}
