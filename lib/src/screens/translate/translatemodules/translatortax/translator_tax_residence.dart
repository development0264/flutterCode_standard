import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatortax/translator_tax_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_tax_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_checkbox.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/translator/translatortax/user_add_response_model.dart';
import 'package:khontext/src/screens/clientprofile/profile_header.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/address_widget.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class TranslatorTaxResidence extends StatefulWidget {
  @override
  _TranslatorTaxResidenceState createState() => _TranslatorTaxResidenceState();
}

class _TranslatorTaxResidenceState extends State<TranslatorTaxResidence> {
  /// Global key for maintaining the state of the form.
  final _taxResidenceFormKey = GlobalKey<FormBuilderState>();

  /// Model
  ClientAddressData taxResidenceModel;
  AddressReturnModel addressReturnModel;

  @override
  void initState() {
    super.initState();
    var store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaxResidenceViewModel>(
      converter: (store) => TaxResidenceViewModel(store, store.state.translateTaxState),
      onInit: (store) => store.dispatch(ExistingUserAddressFetchAction()),
      builder: (context, vm) {
        if (vm?.translateTaxState?.translatorTaxModel?.data != null) {
          getCurrentAddress(vm.translateTaxState.translatorTaxModel.data);
        }
        return _commonCardWidget(
          onCardTap: () {},
          children: [
            ProfileHeader(
              headerTitle: FormBuilderLocalizations.of(context).taxResidenceText,
              onEditTap: () {},
              showIcon: false,
            ),
            const SizedBox(height: 10.0),
            FormBuilderText(
                message: FormBuilderLocalizations.of(context).displayInvoicesText,
                textStyle: Styles.customTextStyle()),
            FormBuilderCheckbox(
              name: Constants.useExistingAddress,
              decoration:
                  Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
              initialValue: false,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              contentPadding: EdgeInsets.zero,
              onChanged: (value) {
                // vm.store.dispatch(SaveTaxResidenceAction(taxResidenceModel: taxResidenceModel));
              },
              title: FormBuilderText(
                message: FormBuilderLocalizations.of(context).useLocationText,
                textStyle: Styles.customTextStyle(textSize: 15.0, textColor: Colors.black),
              ),
            ),
            const SizedBox(height: 10.0),
            taxResidenceForm(context),
          ],
        );
      },
    );
  }

  /// Widget function which gives the UI for the entire Tax residence page form.
  Widget taxResidenceForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseAddressWidget(
          locationFormKey: _taxResidenceFormKey,
          clientAddressData: taxResidenceModel,
          onAddressChanged: (AddressReturnModel addressReturnModel) =>
              this.addressReturnModel = addressReturnModel,
        ),
        const SizedBox(height: 15.0),
        _actionButtons(context),
      ],
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
        onCardTap: () => onCardTap(),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children));
  }

  /// Widget function for the buttons of cancel/save/update when the user is in the edit mode.
  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
                message: FormBuilderLocalizations.of(context).cancelText,
                textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  /// Function which converts the api data into the address model.
  void getCurrentAddress(UserResidenceData userResidenceData) {
    taxResidenceModel = ClientAddressData(
        addressId: '',
        streetNumber: '',
        streetName: userResidenceData.streetAddress,
        line1: userResidenceData.addressLine,
        line2: '',
        addressType: Constants.billingType,
        city: userResidenceData.city,
        county: userResidenceData.stateProvinceRegion,
        zipCode: userResidenceData.postalCode.toString(),
        timezone: '',
        country: userResidenceData.country);
  }
}

class TaxResidenceViewModel {
  final Store<AppState> store;
  final TranslateTaxState translateTaxState;

  TaxResidenceViewModel(this.store, this.translateTaxState);
}
