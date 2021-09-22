import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_bottomsheet.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_image.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/countries.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

class CountryCodePickerForm extends StatefulWidget {
  /// [Function] which will revert back with the selected country each time, user selects a country
  final Function selectedCountry;

  /// [bool] which will give the radius is entirely supported or partially supported
  ///
  /// By default, false is passed
  final bool isRadius;

  const CountryCodePickerForm({
    Key key,
    this.selectedCountry,
    this.isRadius: false,
  }) : super(key: key);

  @override
  _CountryCodePickerFormState createState() => _CountryCodePickerFormState();
}

class _CountryCodePickerFormState extends State<CountryCodePickerForm> {
  Map<String, String> selectedCountry = CountryCallingCode.countryCodes[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Utils.screenWidth * 0.12,
      padding: EdgeInsets.only(left: Palette.smallSpace),
      decoration: BoxDecoration(
        border: Border.all(color: Palette.EnabledBorderColor),
        borderRadius: widget.isRadius
            ? BorderRadius.circular(8.0)
            : BorderRadius.only(bottomLeft: Radius.circular(8.0), topLeft: Radius.circular(8.0)),
        color: Palette.WhiteColor,
      ),
      child: _countryRootView(),
    );
  }

  /// Widget function which will give the UI for the selected country.
  Widget _countryRootView() {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => _onCountryPickClick(),
      child: Row(
        children: [
          FormBuilderImage(
            imageUrl: selectedCountry['flag_uri'],
            width: Palette.largeSpace,
            height: Palette.largeSpace,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 8.0),
          FormBuilderText(
            message: selectedCountry['dial_code'],
            textStyle: Styles.customTextStyle(
              textSize: Palette.smallFontSize,
              textColor: Palette.TextColor,
            ),
          ),
          Icon(Icons.arrow_drop_down, color: Palette.EnabledBorderColor),
        ],
      ),
    );
  }

  /// Widget function which gives the root Ui along with the list for the bottom sheet
  ///
  /// It is helpful in showing the list in the bottom sheet.
  Widget _countryListBottomSheet() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).selectCountryText,
          textStyle: Styles.customTextStyle(
            textSize: Palette.largeFontSize,
            textColor: Palette.DarkTextColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
        Expanded(
          child: ListView.builder(
            itemCount: CountryCallingCode.countryCodes.length,
            itemBuilder: (context, index) {
              return _singleCountryItem(CountryCallingCode.countryCodes[index]);
            },
          ),
        ),
      ],
    );
  }

  /// Widget function which gives the UI for the single country item.
  Widget _singleCountryItem(Map<String, String> singleCountry) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () => _onSingleCountryClick(singleCountry),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FormBuilderImage(
              imageUrl: singleCountry['flag_uri'],
              height: Palette.largeSpace,
              width: Palette.largeSpace,
              fit: BoxFit.cover,
            ),
            SizedBox(width: Palette.smallSpace),
            Expanded(
              child: FormBuilderText(
                message: ' ${singleCountry['name']}',
                textStyle: Styles.customTextStyle(
                  textSize: Palette.mediumFontSize,
                  textColor: Palette.DarkTextColor,
                ),
              ),
            ),
            SizedBox(width: Palette.smallSpace),
            FormBuilderText(
              message: '(${singleCountry['dial_code']}) ',
              textStyle: Styles.customTextStyle(
                textSize: Palette.mediumFontSize,
                textColor: Palette.DarkTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Group of functions which will give the functionalities like state change and click events
  void _onCountryPickClick() {
    FormBuilderBottomSheet.openBottomSheet(context: context, child: _countryListBottomSheet());
  }

  void _onSingleCountryClick(Map<String, String> singleCountry) {
    Navigator.of(context).pop();
    widget.selectedCountry(singleCountry);
    setState(() {
      selectedCountry = singleCountry;
    });
  }
}
