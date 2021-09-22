import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/clientprofile/client_address_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_request_model.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:toast/toast.dart';

class UpdateAddressWidget extends StatefulWidget {
  final ClientAddressData cardAddressModel;

  const UpdateAddressWidget({Key key, this.cardAddressModel}) : super(key: key);

  @override
  _UpdateAddressWidgetState createState() => _UpdateAddressWidgetState();
}

class _UpdateAddressWidgetState extends State<UpdateAddressWidget> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormBuilderState> addAddressFormKey = GlobalKey<FormBuilderState>();

  /// [AddressReturnModel] is a model which will be returned from the common address widget
  AddressReturnModel addressReturnModel;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 25.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              FormBuilderText(
                message: FormBuilderLocalizations.of(context).updateAddressText,
                textStyle: Styles.customTextStyle(fontWeight: FontWeight.w500, textSize: 18.0),
              ),
              const SizedBox(height: 15.0),
              BaseAddressWidget(
                locationFormKey: addAddressFormKey,
                clientAddressData: widget.cardAddressModel,
                onAddressChanged: (AddressReturnModel addressReturnModel) {
                  this.addressReturnModel = addressReturnModel;
                },
              ),
              const SizedBox(height: 15.0),
              _actionButtons(context, () {
                if (this.addressReturnModel != null) {
                  List<String> address = [
                    addressReturnModel.subLocality2,
                    addressReturnModel.subLocality1,
                    addressReturnModel.locality
                  ];
                  var store = StoreProvider.of<AppState>(context);
                  store.dispatch(
                    ClientUpdateAddressAction(
                      addressCreateRequestModel: AddressCreateRequestModel(
                        addressId: widget.cardAddressModel.addressId,
                        streetNumber: this.addressReturnModel.streetNumber,
                        streetName: addressReturnModel.streetRoute,
                        line1: addressReturnModel.subLocality3,
                        line2: Utils().getSeparatedAddress(address),
                        addressType: widget.cardAddressModel.addressType,
                        city: this.addressReturnModel.city,
                        county: this.addressReturnModel.state,
                        zipCode: this.addressReturnModel.postalCode,
                        timezone: this.addressReturnModel.selectedTimeZone,
                        country: this.addressReturnModel.country,
                      ),
                    ),
                  );
                } else {
                  Toast.show(FormBuilderLocalizations.of(context).changeAddressText, context);
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons(BuildContext context, Function saveButtonEvent) {
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
              message: FormBuilderLocalizations.of(context).updateText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => saveButtonClick(() => saveButtonEvent()),
          ),
        ),
      ],
    );
  }

  /// Group of [Function] which gives the value changed, button click events.
  void saveButtonClick(Function saveButtonEvent) {
    if (addAddressFormKey.currentState.validate()) {
      saveButtonEvent();
      Navigator.of(context).pop();
    }
  }

  void cancelButtonClick() {
    addAddressFormKey.currentState.reset();
    Navigator.of(context).pop();
  }
}
