import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_model.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/payments/payments_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_radio_group.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_credit_card.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/form_builder_field_option.dart';
import 'package:khontext/src/khontext_widgets/form_builder_validators.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/payments/add_payment_method_request.dart';
import 'package:khontext/src/models/payments/payment_method_list_model.dart';
import 'package:khontext/src/models/payments/update_payment_method_request.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/payment_utils.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';
import 'package:toast/toast.dart';

class DialogWidget extends StatefulWidget {
  final bool isUpdate;
  final PaymentMethodListData creditCardModel;
  final int index;
  final USERTYPE userType;

  const DialogWidget({Key key, @required this.userType, this.isUpdate, this.creditCardModel, this.index})
      : super(key: key);

  @override
  _DialogWidgetState createState() => _DialogWidgetState();
}

class _DialogWidgetState extends State<DialogWidget> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormState> addCardFormKey = GlobalKey<FormState>();
  final GlobalKey<FormBuilderState> addAddressFormKey = GlobalKey<FormBuilderState>();

  /// String which gives the current selected value of the address
  String currentAddress = '';

  /// New model which will give the updated values.
  CreditCardModel newCreditCardModel;

  /// New model for address which will give the value for the new address.
  ClientAddressData currentAddressModel = ClientAddressData.initial();

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 25.0),
        child: Column(
          children: [
            FormBuilderText(
              message: FormBuilderLocalizations.of(context).addMethodText,
              textStyle: Styles.customTextStyle(fontWeight: FontWeight.w500, textSize: 18.0),
            ),
            CreditCardForm(
              formKey: addCardFormKey,
              obscureCvv: true,
              obscureNumber: false,
              cardNumber: '',
              isCardNumberEnabled: !widget.isUpdate,
              isCvvEnabled: !widget.isUpdate,
              expiryDate: widget.isUpdate
                  ? widget.creditCardModel.expireMonth.toString() + "/" + widget.creditCardModel.expireYear.toString()
                  : '',
              cvvCode: '',
              cardHolderName: widget.isUpdate ? widget.creditCardModel.accountHolderName : '',
              cardNumberDecoration: Styles.textInputDecoration(hint: Constants.paymentCardNumberHint),
              expiryDateDecoration: Styles.textInputDecoration(hint: Constants.paymentExpiryDateHint),
              cvvCodeDecoration: Styles.textInputDecoration(hint: Constants.paymentCVVHint),
              cardHolderDecoration: Styles.textInputDecoration(hint: Constants.paymentCardHolderHint),
              onCreditCardModelChange: (onCreditCardModelChange) {
                this.newCreditCardModel = onCreditCardModelChange;
              },
            ),
            _addressSelectionView(),
            const SizedBox(height: 15.0),
            _actionButtons(context, widget.isUpdate)
          ],
        ),
      ),
    );
  }

  /// Widget which gives the UI and functionality for the address selection.
  /// It contains the radio buttons with the list of all the current addresses and one extra address radiobutton
  /// which lets users add new address.
  Widget _addressSelectionView() {
    var store = StoreProvider.of<AppState>(context);
    var state = store.state.paymentState.userAddressListResponseModel;
    if (widget.isUpdate == false && !state.data.contains(FormBuilderLocalizations.of(context).addNewAddressText)) {
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
            onAddressTypeChanged(option);
            if (option == Constants.paymentNewAddressKey) {
              currentAddressModel.addressId = Constants.paymentNewAddressKey;
            } else {
              ClientAddressData model = state.data.firstWhere((element) => element.addressId == option);
              this.currentAddressModel = model;
            }
          },
          initialValue: widget.creditCardModel?.cardAddress?.addressId,
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
              value: address is ClientAddressData ? address.addressId : Constants.paymentNewAddressKey,
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
    return (currentAddress != '' && currentAddress == Constants.paymentNewAddressKey)
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: BaseAddressWidget(
              locationFormKey: key,
              clientAddressData: null,
              onAddressChanged: (AddressReturnModel addressReturnModel) {
                this.currentAddressModel.streetNumber = addressReturnModel.streetNumber;
                this.currentAddressModel.streetName = addressReturnModel.streetRoute;
                this.currentAddressModel.line1 = addressReturnModel.subLocality3;
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

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons(BuildContext context, bool isUpdate) {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
                message: FormBuilderLocalizations.of(context).cancelText,
                textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor)),
            onPressed: () => cancelButtonClick(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
              message: isUpdate
                  ? FormBuilderLocalizations.of(context).updateText
                  : FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => saveButtonClick(),
          ),
        ),
      ],
    );
  }

  /// Group of [Function] which gives the value changed, button click events.
  void saveButtonClick() async {
    if (widget.isUpdate) {
      store.dispatch(
        UpdatePaymentMethodAction(
          userType: widget.userType,
          updatePaymentMethodRequestModel: widget.userType == USERTYPE.CLIENT
              ? UpdatePaymentMethodRequestModel(
                  userId: widget.creditCardModel.userId,
                  cardId: widget.creditCardModel.sourceId,
                  cardholderName: newCreditCardModel.cardHolderName,
                  addressId: currentAddressModel?.addressId?.isNotEmpty == true
                      ? currentAddressModel?.addressId
                      : widget.creditCardModel.cardAddress.addressId,
                  expireMonth: int.parse(newCreditCardModel.expiryDate.split("/")[0]),
                  expireYear: int.parse(newCreditCardModel.expiryDate.split("/")[1]),
                  type: Constants.cardText,
                )
              : UpdatePaymentMethodRequestModel(
                  userId: widget.creditCardModel.userId,
                  cardId: widget.creditCardModel.sourceId,
                  cardholderName: newCreditCardModel.cardHolderName,
                  addressId: currentAddressModel?.addressId?.isNotEmpty == true
                      ? currentAddressModel?.addressId
                      : widget.creditCardModel.cardAddress.addressId,
                  expireMonth: int.parse(newCreditCardModel.expiryDate.split("/")[0]),
                  expireYear: int.parse(newCreditCardModel.expiryDate.split("/")[1]),
                  type: Constants.cardText,
                  bankAccountId: widget.creditCardModel.accountId,
                ),
        ),
      );
      cancelButtonClick();
    } else if (addCardFormKey?.currentState?.validate() == false || newCreditCardModel == null) {
      Toast.show(FormBuilderLocalizations.of(context).addCardDetailsText, context);
    } else if (addAddressFormKey?.currentState?.validate() == false || currentAddressModel?.addressId == '') {
      Toast.show(FormBuilderLocalizations.of(context).addCardAddressText, context);
    } else {
      currentAddressModel.addressType = Constants.billingText;
      String paymentToken = await PaymentUtils.paymentBridgePlatform.invokeMethod(Constants.paymentCard, {
        Constants.paymentCardNumber: newCreditCardModel.cardNumber,
        Constants.cardExpiryMonth: int.parse(newCreditCardModel.expiryDate.split("/")[0]),
        Constants.cardExpiryYear: int.parse(newCreditCardModel.expiryDate.split("/")[1]),
        Constants.cardCVC: newCreditCardModel.cvvCode,
        Constants.cardHolder: newCreditCardModel.cardHolderName,
      });

      if (paymentToken?.isNotEmpty == true) {
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
        cancelButtonClick();
      } else {
        Toast.show(FormBuilderLocalizations.of(context).tokenGenerateErrorText, context);
      }
    }
  }

  void cancelButtonClick() {
    addCardFormKey.currentState.reset();
    Navigator.of(context).pop();
  }

  void onAddressTypeChanged(String value) {
    setState(() {
      currentAddress = value;
    });
  }
}
