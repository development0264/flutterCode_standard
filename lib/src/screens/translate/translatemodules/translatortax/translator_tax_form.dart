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

class TaxForm extends StatefulWidget {
  @override
  _TaxFormState createState() => _TaxFormState();
}

class _TaxFormState extends State<TaxForm> {
  /// Global key for maintaining the state of the form.
  final _taxFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _verificationCodeController = TextEditingController();
  String year, selectedType;

  @override
  void initState() {
    super.initState();
    var store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, TaxFormViewModel>(
      converter: (store) => TaxFormViewModel(store, store.state.translateTaxState),
      builder: (context, vm) {
        return _commonCardWidget(
          onCardTap: () {},
          children: [
            ProfileHeader(
                headerTitle: FormBuilderLocalizations.of(context).taxFormText, onEditTap: () {}, showIcon: false),
            const SizedBox(height: 10.0),
            taxForm(),
          ],
        );
      },
    );
  }

  Widget taxForm() {
    return FormBuilder(
      key: _taxFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderRadioGroup(
            name: Constants.type,
            validator: FormBuilderValidators.compose([FormBuilderValidators.required(context)]),
            onChanged: (option) => 'Email',
            decoration: const InputDecoration(border: InputBorder.none),
            options: ['Email', 'Phone'].map((address) {
              return FormBuilderFieldOption(
                value: address,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: FormBuilderText(
                    message: address,
                    textStyle: Styles.customTextStyle(textSize: 16.0),
                  ),
                ),
              );
            }).toList(growable: false),
          ),
          commonTextTitle(FormBuilderLocalizations.of(context).emailHintText),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.signUpEmail,
            controller: _emailController,
            textInputAction: TextInputAction.next,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).emailHintText),
            validator:
                FormBuilderValidators.required(context, errorText: FormBuilderLocalizations.of(context).emailErrorText),
          ),
          const SizedBox(height: 15.0),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: FormBuilderDropdown<String>(
                  name: Constants.year,
                  allowClear: false,
                  initialValue: year,
                  hint: FormBuilderText(
                    message: FormBuilderLocalizations.of(context).yearText,
                    textStyle: Styles.customTextStyle(textSize: 16.0),
                  ),
                  onChanged: (val) => null,
                  validator: FormBuilderValidators.required(context,
                      errorText: FormBuilderLocalizations.of(context).yearErrorText),
                  decoration: Styles.textInputDecoration(),
                  items: Data.yearList.map((year) => _commonDropDownItem(value: year, message: year)).toList(),
                ),
              ),
              const SizedBox(width: 8.0),
              BaseButtonWidget(
                backgroundColor: Palette.AppThemeColor,
                btnChild: FormBuilderText(
                  message: FormBuilderLocalizations.of(context).getCodeText,
                  textStyle: Styles.customTextStyle(textColor: Colors.white),
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.verificationCode,
            controller: _verificationCodeController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).verificationCodeText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).verificationCodeErrorText),
          ),
          const SizedBox(height: 15.0),
          BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Palette.AppThemeColor,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).downloadText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }

  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
        onCardTap: () => onCardTap(), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: children));
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
}

class TaxFormViewModel {
  final Store<AppState> store;
  final TranslateTaxState translateTaxState;

  TaxFormViewModel(this.store, this.translateTaxState);
}
