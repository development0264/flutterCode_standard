import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_profile_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_image.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text_field.dart';
import 'package:khontext/src/khontext_widgets/fields/form_country_code.dart';
import 'package:khontext/src/khontext_widgets/fields/form_image_picker.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/clientprofile/client_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_image_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_model.dart';
import 'package:khontext/src/models/clientprofile/client_profile_request_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class AccountSection extends StatefulWidget {
  @override
  _AccountSectionState createState() => _AccountSectionState();
}

class _AccountSectionState extends State<AccountSection> {
  /// [ClientProfileData] and [ClientProfileImageData] for the usage of showing the data.
  ClientProfileData clientProfileData;
  ClientProfileImageData clientProfileImageData;

  /// Text editing controllers.
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _taxIDController = TextEditingController();

  /// Image picker instance and the picked file instance.
  String _selectedFilePath;

  /// [bool] which suggests that the save button is enabled or not.
  bool isSaveEnabled = false;

  /// Store instance to use further
  Store<AppState> store;

  String _countryCode;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    print("This is called.....22222");
    store.dispatch(ClientProfileFetchAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientProfileViewModel>(
      converter: (store) => ClientProfileViewModel(
          store, store.state.clientProfileState, store.state.clientProfileLocalState),
      builder: (context, vm) {
        if (vm.clientProfileState.isLoading) {
          return BaseLoadingWidget();
        }

        return accountSectionUI(vm);
      },
    );
  }

  /// Widget function which will give the UI for the account section.
  Widget accountSectionUI(ClientProfileViewModel vm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          splashColor: Colors.transparent,
          onTap: () => onImageTap(context, vm),
          child: FormBuilderImage(
            width: Utils.screenWidth * 0.3,
            height: Utils.screenWidth * 0.3,
            rounded: true,
            imageUrl: '',
            imageBytes: getUserImage(vm),
            placeHolderPath: Constants.userPlaceholder,
            localImagePath: _selectedFilePath,
          ),
        ),
        const SizedBox(height: 8),
        Divider(),
        const SizedBox(height: 8),
        vm.clientProfileLocalState.editStatus == ProfilePageEditStatus.ACCOUNT_EDIT_MODE
            ? editModeWidgets()
            : nonEditModeWidgets(vm),
      ],
    );
  }

  /// Widget function for the case [ProfilePageEditStatus.ACCOUNT_EDIT_MODE], this will have the edit mode
  /// functionality along with buttons like cancel/save.
  Widget editModeWidgets() {
    return Column(
      children: [
        FormBuilderTextField(
          name: Constants.signUpFirstName,
          controller: _firstNameController,
          textInputAction: TextInputAction.next,
          onChanged: (value) => checkValueChange(),
          decoration: Styles.textInputDecoration(
              hint: FormBuilderLocalizations.of(context).firstNameHintText),
          validator: FormBuilderValidators.required(context,
              errorText: FormBuilderLocalizations.of(context).emptyFirstNameErrorText),
        ),
        const SizedBox(height: 15.0),
        FormBuilderTextField(
          name: Constants.signUpLastName,
          controller: _lastNameController,
          textInputAction: TextInputAction.next,
          onChanged: (value) => checkValueChange(),
          decoration: Styles.textInputDecoration(
              hint: FormBuilderLocalizations.of(context).lastNameHintText),
          validator: FormBuilderValidators.required(context,
              errorText: FormBuilderLocalizations.of(context).emptyLastNameErrorText),
        ),
        const SizedBox(height: 15.0),
        FormBuilderTextField(
          name: Constants.signUpEmail,
          controller: _emailController,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) => checkValueChange(),
          decoration:
              Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).emailHintText),
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).emptyEmailErrorText),
            FormBuilderValidators.email(context,
                errorText: FormBuilderLocalizations.of(context).emailValidationErrorText),
          ]),
        ),
        const SizedBox(height: 15.0),
        _phoneNumberLayout(),
        const SizedBox(height: 15.0),
        FormBuilderTextField(
          name: Constants.profileTaxId,
          controller: _taxIDController,
          textInputAction: TextInputAction.done,
          onChanged: (value) => checkValueChange(),
          decoration:
              Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).taxIdText),
          validator: FormBuilderValidators.required(context,
              errorText: FormBuilderLocalizations.of(context).emptyTaxIdErrorText),
        ),
        const SizedBox(height: 15.0),
        _actionButtons(),
        const SizedBox(height: 15.0),
      ],
    );
  }

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons() {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).cancelText,
              textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor),
            ),
            onPressed: () => cancelButtonClick(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: isSaveEnabled ? Palette.AppThemeColor : Palette.DisabledBorderColor,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => isSaveEnabled ? saveButtonClick() : null,
          ),
        ),
      ],
    );
  }

  /// Widget function whenever the user is in [ProfilePageEditStatus.IDLE_MODE] state, this is a informatory widget.
  Widget nonEditModeWidgets(ClientProfileViewModel vm) {
    if (errorShow(vm).isNotEmpty) {
      return ErrorTextWidget(
        error: errorShow(vm) != null
            ? errorShow(vm)
            : FormBuilderLocalizations.of(context).dataLoadText,
      );
    }
    final String fullName = clientProfileData.firstName + " " + clientProfileData.lastName;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(
          message: fullName,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).emailHintText,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
        ),
        FormBuilderText(
          message: clientProfileData.email,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).phoneText,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
        ),
        FormBuilderText(
          message: clientProfileData.phone,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).taxIdText,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
        ),
        FormBuilderText(
          message: clientProfileData.taxId,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
      ],
    );
  }

  /// Widget function for the phone number layout, for the code optimizations.
  Widget _phoneNumberLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border.all(width: 1, color: Palette.DisabledBorderColor)),
          height: Utils.screenWidth * 0.14,
          child: Center(
            child: CountryCodePickerForm(
              isRadius: false,
              selectedCountry: (Map<String, String> selectedCountry) =>
                  onCountryCodeChanged(selectedCountry['dial_code']),
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: FormBuilderTextField(
            name: Constants.signUpPhoneNumber,
            controller: _phoneNumberController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.phone,
            onChanged: (value) => checkValueChange(),
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).phoneText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).emptyPhoneNumberErrorText),
          ),
        ),
      ],
    );
  }

  /// Function which performs the image tap functionality. If the user is in [ProfilePageEditStatus.ACCOUNT_EDIT_MODE],
  /// image picker will be open to pick the image and set it in the image.
  void onImageTap(BuildContext context, ClientProfileViewModel vm) async {
    if (ProfilePageEditStatus.ACCOUNT_EDIT_MODE == vm.clientProfileLocalState.editStatus) {
      FormImagePicker.pickFile(context, pickedFile: (file) {
        final bytes = File(file.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        if (!Utils.isProfileDataAdded(vm.clientProfileState.clientProfileImageResponseModel)) {
          vm.store.dispatch(
            ClientProfileImageAddAction(
              clientProfileImageRequestModel: ClientProfileImageRequestModel(
                name: vm.clientProfileState.clientProfileResponseModel.data.firstName + '.jpg',
                base64: img64,
                fileType: 'Image',
              ),
            ),
          );
        } else {
          vm.store.dispatch(
            ClientProfileImageUpdateAction(
              clientProfileImageRequestModel: ClientProfileImageRequestModel(
                name: vm.clientProfileState.clientProfileResponseModel.data.firstName + '.jpg',
                base64: img64,
                fileType: 'Image',
              ),
            ),
          );
        }
      });
    }
  }

  /// Function which is used to set the initial values of the controllers, also useful for resetting the values when
  /// user clicks cancel button.
  void setInitialValues() {
    _firstNameController.text = clientProfileData.firstName;
    _lastNameController.text = clientProfileData.lastName;
    _emailController.text = clientProfileData.email;
    _phoneNumberController.text = clientProfileData.phone;
    _taxIDController.text = clientProfileData.taxId;
    isSaveEnabled = false;
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [String] error,
  /// it also set the [ClientProfileData] if there is no error.
  String errorShow(ClientProfileViewModel vm) {
    if (vm.clientProfileState != null && vm.clientProfileState.error.isNotEmpty) {
      return vm.clientProfileState.error;
    } else if (vm.clientProfileState != null &&
        vm.clientProfileState.clientProfileResponseModel != null &&
        vm.clientProfileState.clientProfileResponseModel.data == null) {
      return FormBuilderLocalizations.of(context).noUserText;
    }

    clientProfileData = vm.clientProfileState.clientProfileResponseModel.data;
    setInitialValues();
    return '';
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [String] error,
  /// it also set the [ClientProfileImageData] if there is no error.
  String imageErrorShow(ClientProfileViewModel vm) {
    if (vm.clientProfileState != null && vm.clientProfileState.error.isNotEmpty) {
      return vm.clientProfileState.error;
    } else if (vm.clientProfileState.clientProfileImageResponseModel != null &&
        !vm.clientProfileState.clientProfileImageResponseModel.isSuccessful &&
        vm.clientProfileState.clientProfileImageResponseModel.message.isNotEmpty) {
      return vm.clientProfileState.clientProfileImageResponseModel.message;
    } else if (vm.clientProfileState.clientProfileImageResponseModel == null) {
      return FormBuilderLocalizations.of(context).imageSetText;
    }

    clientProfileImageData = vm.clientProfileState.clientProfileImageResponseModel.data;
    return '';
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [Uint8List] image bytes if the
  /// condition matches.
  Uint8List getUserImage(ClientProfileViewModel vm) {
    if (imageErrorShow(vm).isEmpty &&
        _selectedFilePath == null &&
        clientProfileImageData.base64 != null) {
      return Base64Decoder().convert(clientProfileImageData.base64);
    }

    return null;
  }

  /// Will be used for maintaining the disability of the save button.
  void checkValueChange() {
    bool tempSaveValue = false;
    if (clientProfileData == null ||
        _firstNameController.text != clientProfileData.firstName ||
        _lastNameController.text != clientProfileData.lastName ||
        _emailController.text != clientProfileData.email ||
        _phoneNumberController.text != clientProfileData.phone ||
        _countryCode != '+91' ||
        _taxIDController.text != clientProfileData.taxId) {
      tempSaveValue = true;
    }

    if (isSaveEnabled != tempSaveValue) {
      setState(() {
        isSaveEnabled = tempSaveValue;
      });
    }
  }

  /// Group of functions which saves the value for the changed dropdown.
  void onCountryCodeChanged(String countryCode) {
    _countryCode = countryCode;
    checkValueChange();
  }

  /// Function which is called when click of the buttons.
  void cancelButtonClick() {
    store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
  }

  void saveButtonClick() {
    store.dispatch(
      ClientProfileUpdateAction(
        clientProfileUpdateRequestModel: ClientProfileUpdateRequestModel(
          firstName: _firstNameController.text,
          lastName: _lastNameController.text,
          email: _emailController.text,
          phone: _phoneNumberController.text,
          taxId: _taxIDController.text,
        ),
      ),
    );
  }
}

class ClientProfileViewModel {
  final Store<AppState> store;
  final ClientProfileState clientProfileState;
  final ClientProfileLocalState clientProfileLocalState;

  ClientProfileViewModel(this.store, this.clientProfileState, this.clientProfileLocalState);
}
