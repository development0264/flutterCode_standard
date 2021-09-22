import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/address/address_return_model.dart';
import 'package:khontext/src/models/clientprofile/client_address_model.dart';
import 'package:khontext/src/models/location_by_place_model.dart';
import 'package:khontext/src/models/postjobs/joblocality/post_job_location_model.dart';
import 'package:khontext/src/screens/postjobs/apiprovider/post_job_location_api.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

class BaseAddressWidget extends StatefulWidget {
  final ClientAddressData clientAddressData;
  final Function onAddressChanged;
  final GlobalKey<FormBuilderState> locationFormKey;

  const BaseAddressWidget(
      {Key key, this.clientAddressData, this.onAddressChanged, @required this.locationFormKey})
      : super(key: key);

  @override
  BaseAddressWidgetState createState() => BaseAddressWidgetState();
}

class BaseAddressWidgetState extends State<BaseAddressWidget> {
  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _streetAddController = TextEditingController();
  final TextEditingController _address2Controller = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  /// [FocusNode] for the entire sign in form.
  /// These [FocusNode] will give the current focus of a text field.
  final FocusNode _streetAddFocus = FocusNode();
  final FocusNode _address2Focus = FocusNode();
  final FocusNode _cityFocus = FocusNode();
  final FocusNode _stateFocus = FocusNode();
  final FocusNode _zipFocus = FocusNode();
  final FocusNode _countryFocus = FocusNode();

  /// [Key] element for each widgets in the page.
  /// Helpful for maintaining the testcases.
  Key suggestionsItemKey = Key(Constants.suggestionsItemKey);
  Key _streetAddKey = Key(Constants.streetAddKey);
  Key _address2Key = Key(Constants.address2Key);
  Key _cityKey = Key(Constants.cityKey);
  Key _stateKey = Key(Constants.stateKey);
  Key _zipKey = Key(Constants.zipKey);
  Key _countryKey = Key(Constants.countryKey);

  /// [StateSetter] variable to set the state for the particular password field.
  /// This field will be used only to refresh the password input field.
  StateSetter _streetAddState, _address2State, _cityState, _stateState, _zipState, _countryState;

  /// Variables for the location.
  String streetNumber,
      streetRoute,
      subLocality3,
      subLocality2,
      subLocality1,
      locality,
      city,
      state,
      country,
      postalCode,
      selectedTimeZone;

  /// Address array
  String addr = '';

  AddressReturnModel addressReturnModel = AddressReturnModel();

  @override
  void initState() {
    super.initState();
    _setListeners();
  }

  @override
  void didUpdateWidget(covariant BaseAddressWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.clientAddressData != null &&
        oldWidget.clientAddressData != widget.clientAddressData) {
      print("Init state changed ---> ${widget?.clientAddressData?.line1}");
      setInitialValues(widget.clientAddressData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return locationForm(context);
  }

  /// Widget function which gives the UI for the entire location page form.
  Widget locationForm(BuildContext context) {
    return FormBuilder(
      key: widget.locationFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StatefulBuilder(builder: (context, state) {
            this._streetAddState = state;
            return FormBuilderTypeAhead<PostJobLocationPrediction>(
              key: _streetAddKey,
              name: Constants.streetAddressText,
              focusNode: _streetAddFocus,
              selectionToTextTransformer: (prediction) => prediction.description,
              itemBuilder: (context, item) => singleSuggestionsItem(item),
              onTextChanged: (String value) => onStreetChanged(value),
              controller: _streetAddController,
              hideSuggestionsOnKeyboardHide: false,
              decoration: Styles.textInputDecoration(
                  hint: FormBuilderLocalizations.of(context).streetAddressText,
                  focusNode: _streetAddFocus),
              onSuggestionSelected: (suggestions) => onSuggestionsClicked(suggestions),
              suggestionsCallback: (query) => onSuggestionsCallback(query),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._address2State = state;
            return FormBuilderTextField(
              key: _address2Key,
              name: Constants.addressLine2,
              controller: _address2Controller,
              focusNode: _address2Focus,
              onChanged: (String value) => onAddress2Changed(value),
              textInputAction: TextInputAction.next,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).addressLine2Text,
                focusNode: _address2Focus,
              ),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._cityState = state;
            return FormBuilderTextField(
              key: _cityKey,
              name: Constants.profileCity,
              controller: _cityController,
              focusNode: _cityFocus,
              onChanged: (String value) => onCityChanged(value),
              textInputAction: TextInputAction.next,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).cityText,
                focusNode: _cityFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).emptyCityErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._stateState = state;
            return FormBuilderTextField(
              key: _stateKey,
              name: Constants.profileState,
              controller: _stateController,
              focusNode: _stateFocus,
              onChanged: (String value) => onStateChanged(value),
              textInputAction: TextInputAction.next,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).stateProvinceRegionText,
                focusNode: _stateFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).stateProvinceRegionErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._zipState = state;
            return FormBuilderTextField(
              key: _zipKey,
              name: Constants.profileZip,
              controller: _zipController,
              focusNode: _zipFocus,
              onChanged: (String value) => onZipChanged(value),
              textInputAction: TextInputAction.next,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).postalZipText,
                focusNode: _zipFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).postalZipErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          StatefulBuilder(builder: (context, state) {
            this._countryState = state;
            return FormBuilderTextField(
              key: _countryKey,
              name: Constants.profileCountry,
              focusNode: _countryFocus,
              controller: _countryController,
              onChanged: (String value) => onCountryChanged(value),
              textInputAction: TextInputAction.done,
              decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).countryText,
                focusNode: _countryFocus,
              ),
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).emptyCountryErrorText),
            );
          }),
          Utils.getVerticalSpacing(SPACE_TYPE.MEDIUM),
          // FormBuilderDropdown<String>(
          //   name: Constants.profileTimeZone,
          //   allowClear: false,
          //   initialValue: selectedTimeZone,
          //   hint: FormBuilderText(message: FormBuilderLocalizations.of(context).timeZoneText),
          //   onChanged: (val) => onTimezoneChanged(val),
          //   validator: FormBuilderValidators.required(context,
          //       errorText: FormBuilderLocalizations.of(context).timezoneErrorText),
          //   decoration: Styles.textInputDecoration(),
          //   items: allTimeZone
          //       .map((timeZone) =>
          //           _commonDropDownItem(value: timeZone['name'], message: timeZone['name']))
          //       .toList(),
          // ),
          // const SizedBox(height: 15.0),
        ],
      ),
    );
  }

  /// Widget function which gives the single suggestions item.
  Widget singleSuggestionsItem(PostJobLocationPrediction predictionItem) {
    return Padding(
      key: suggestionsItemKey,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.location_on_outlined, color: Palette.DisabledBorderColor, size: 21.0),
          const SizedBox(width: 8.0),
          Expanded(
            child: FormBuilderText(
              message: predictionItem.description,
              maxLines: 1,
            ),
          ),
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

  Future<List<PostJobLocationPrediction>> onSuggestionsCallback(String query) async {
    final PostJobLocationModel model = await PostJobLocationApiCalls.getLocations(query);
    if (model.status == Constants.okText) {
      return model.predictions;
    } else {
      return [];
    }
  }

  void onSuggestionsClicked(PostJobLocationPrediction suggestions) async {
    final LocationByPlaceModel model =
        await PostJobLocationApiCalls.getLocationByPlace(suggestions.placeId);
    setValueInLocations(model.result.addressComponents);
  }

  void setValueInLocations(List<AddressComponent> addressComponent) {
    streetNumber = getEntityFromComponent(Constants.streetNumber, addressComponent);
    streetRoute = getEntityFromComponent(Constants.streetRoute, addressComponent);
    subLocality3 = getEntityFromComponent(Constants.subLocality3, addressComponent);
    subLocality2 = getEntityFromComponent(Constants.subLocality2, addressComponent);
    subLocality1 = getEntityFromComponent(Constants.subLocality1, addressComponent);
    locality = getEntityFromComponent(Constants.locality, addressComponent);
    city = getEntityFromComponent(Constants.city, addressComponent);
    state = getEntityFromComponent(Constants.state, addressComponent);
    country = getEntityFromComponent(Constants.country, addressComponent);
    postalCode = getEntityFromComponent(Constants.postalCode, addressComponent);

    sendData();

    createAddress();

    _streetAddController.text =
        Utils().getSeparatedAddress([streetNumber, streetRoute, subLocality3]);
    _address2Controller.text = Utils().getSeparatedAddress([subLocality2, subLocality1, locality]);
    _cityController.text = city;
    _stateController.text = state;
    _countryController.text = country;
    _zipController.text = postalCode;

    refreshWidget();
  }

  /// This is the function which is used only for the purpose of the optimizations.
  String getEntityFromComponent(String entity, List<AddressComponent> component) {
    return component
            .firstWhere((element) => element.types.contains(entity), orElse: () => null)
            ?.longName ??
        '';
  }

  /// Function which is used to set the initial values of the controllers, also useful for resetting the values when
  void setInitialValues(ClientAddressData addressData) {
    _streetAddController.text = Utils()
        .getSeparatedAddress([addressData.streetNumber, addressData.streetName, addressData.line1]);
    _address2Controller.text = addressData.line2;
    _cityController.text = addressData.city;
    _stateController.text = addressData.county;
    _zipController.text = addressData.zipCode;
    _countryController.text = addressData.country;

    streetNumber = addressData.streetNumber;
    streetRoute = addressData.streetName;
    subLocality3 = addressData.line1;
    subLocality2 = addressData.line2;
    subLocality1 = '';
    locality = '';
    city = addressData.city;
    state = addressData.county;
    country = addressData.country;
    postalCode = addressData.zipCode;
    selectedTimeZone = addressData.timezone;
    // if (widget.locationFormKey?.currentState != null) {
    //   widget.locationFormKey.currentState.fields[Constants.profileTimeZone]
    //       .didChange(selectedTimeZone);
    // }
    createAddress();
    refreshWidget();
  }

  /// Function which will merge the separate address components into a singular address.
  void createAddress() {
    List<String> address = [
      streetNumber,
      streetRoute,
      subLocality3,
      subLocality2,
      subLocality1,
      locality,
      city,
      state,
      country,
      postalCode,
    ];

    addr = Utils().getSeparatedAddress(address);
  }

  /// Function which will save the timezone value when changed.
  void onTimezoneChanged(String timeZone) {
    selectedTimeZone = timeZone;
    sendData();
  }

  /// Function which will refresh the widget
  void refreshWidget() {
    setState(() {
      // Refresh
    });
  }

  /// Function which sends the current data ahead.
  void sendData() {
    addressReturnModel = AddressReturnModel(
      streetNumber: streetNumber,
      streetRoute: streetRoute,
      subLocality3: subLocality3,
      subLocality2: subLocality2,
      subLocality1: subLocality1,
      locality: locality,
      city: city,
      state: state,
      country: country,
      postalCode: postalCode,
      selectedTimeZone: selectedTimeZone,
    );

    try {
      widget.onAddressChanged(addressReturnModel);
    } catch (e) {
      print("Error in getting widget --> $e");
    }
  }

  /// Function which set the listeners for the focus nodes to show the background color
  /// when the text field is in focus.
  void _setListeners() {
    _streetAddFocus.addListener(() {
      this._streetAddState(() {});
    });
    _address2Focus.addListener(() {
      this._address2State(() {});
    });
    _cityFocus.addListener(() {
      this._cityState(() {});
    });
    _stateFocus.addListener(() {
      this._stateState(() {});
    });
    _zipFocus.addListener(() {
      this._zipState(() {});
    });
    _countryFocus.addListener(() {
      this._countryState(() {});
    });
  }

  void onStreetChanged(String street) {
    addressReturnModel.streetRoute = street;
    widget.onAddressChanged(addressReturnModel);
  }

  void onAddress2Changed(String address2) {
    addressReturnModel.subLocality3 = address2;
    widget.onAddressChanged(addressReturnModel);
  }

  void onCityChanged(String city) {
    addressReturnModel.city = city;
    widget.onAddressChanged(addressReturnModel);
  }

  void onStateChanged(String state) {
    addressReturnModel.state = state;
    widget.onAddressChanged(addressReturnModel);
  }

  void onCountryChanged(String country) {
    addressReturnModel.country = country;
    widget.onAddressChanged(addressReturnModel);
  }

  void onZipChanged(String zip) {
    addressReturnModel.postalCode = zip;
    widget.onAddressChanged(addressReturnModel);
  }

  @override
  void dispose() {
    _streetAddController.dispose();
    _address2Controller.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _countryController.dispose();
    _streetAddFocus.dispose();
    _address2Focus.dispose();
    _cityFocus.dispose();
    _stateFocus.dispose();
    _zipFocus.dispose();
    _countryFocus.dispose();
    super.dispose();
  }
}
