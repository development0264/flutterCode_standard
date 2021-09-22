import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/data.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/translate/translate_tax_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/screens/clientprofile/profile_header.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class TranslatorW9Form extends StatefulWidget {
  @override
  _TranslatorW9FormState createState() => _TranslatorW9FormState();
}

class _TranslatorW9FormState extends State<TranslatorW9Form> {
  /// Global key for maintaining the state of the form.
  final _taxW9FormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _legalNameController = TextEditingController();
  final TextEditingController _ssnNumberController = TextEditingController();
  String taxClassification, payerIdentification;

  /// [bool] for the checkbox
  bool iCertify = false;

  @override
  void initState() {
    super.initState();
    var store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaxW9ViewModel>(
      converter: (store) => TaxW9ViewModel(store, store.state.translateTaxState),
      builder: (context, vm) {
        return _commonCardWidget(
          onCardTap: () {},
          children: [
            ProfileHeader(headerTitle: FormBuilderLocalizations.of(context).w9Text, onEditTap: () {}, showIcon: false),
            const SizedBox(height: 10.0),
            FormBuilderText(
              message: FormBuilderLocalizations.of(context).w9DisplayText,
              textStyle: Styles.customTextStyle(),
            ),
            const SizedBox(height: 10.0),
            w9Form(),
          ],
        );
      },
    );
  }

  Widget w9Form() {
    return FormBuilder(
      key: _taxW9FormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextTitle(FormBuilderLocalizations.of(context).legalNameText),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.legalName,
            controller: _legalNameController,
            textInputAction: TextInputAction.next,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).legalNameText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).legalNameErrorText),
          ),
          const SizedBox(height: 5.0),
          commonTextTitle(FormBuilderLocalizations.of(context).legalNameDisplayText),
          const SizedBox(height: 15.0),
          FormBuilderDropdown<String>(
            name: Constants.taxClassification,
            allowClear: false,
            initialValue: taxClassification,
            hint: FormBuilderText(
              message: FormBuilderLocalizations.of(context).taxClassificationText,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
            onChanged: (val) => null,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).taxClassificationErrorText),
            decoration: Styles.textInputDecoration(),
            items: Data.taxClassification
                .map((classification) => _commonDropDownItem(value: classification, message: classification))
                .toList(),
          ),
          const SizedBox(height: 15.0),
          FormBuilderDropdown<String>(
            name: Constants.payerIdentification,
            allowClear: false,
            initialValue: payerIdentification,
            hint: FormBuilderText(
              message: FormBuilderLocalizations.of(context).payerIdentificationText,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
            onChanged: (val) => null,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).payerIdentificationErrorText),
            decoration: Styles.textInputDecoration(),
            items: Data.taxPayer.map((payer) => _commonDropDownItem(value: payer, message: payer)).toList(),
          ),
          const SizedBox(height: 15.0),
          commonTextTitle(FormBuilderLocalizations.of(context).ssnText),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.ssn,
            controller: _ssnNumberController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).ssnText),
            validator:
                FormBuilderValidators.required(context, errorText: FormBuilderLocalizations.of(context).ssnErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderCheckbox(
            name: Constants.iCertify,
            decoration: Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
            initialValue: iCertify,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              setState(() {
                iCertify = value;
              });
            },
            title: FormBuilderText(
              message: FormBuilderLocalizations.of(context).iCertifyText,
              textStyle: Styles.customTextStyle(textSize: 15.0, textColor: Colors.black),
            ),
          ),
          const SizedBox(height: 15.0),
          _actionButtons(context),
        ],
      ),
    );
  }

  /// Widget function for the common drop down item.
  DropdownMenuItem<String> _commonDropDownItem({String value, String message}) {
    return DropdownMenuItem<String>(
      value: value,
      child: FormBuilderText(
        message: message,
        textStyle: Styles.customTextStyle(textSize: 18.0),
      ),
    );
  }

  /// Widget function which gives the common text for the title.
  Widget commonTextTitle(String title) {
    return FormBuilderText(
      message: title,
      textStyle: Styles.customTextStyle(textSize: 16.0),
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
        onCardTap: () => onCardTap(), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children));
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
}

class TaxW9ViewModel {
  final Store<AppState> store;
  final TranslateTaxState translateTaxState;

  TaxW9ViewModel(this.store, this.translateTaxState);
}
