import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/clientprofile/change_edit_status_action.dart';
import 'package:khontext/redux/actions/clientprofile/client_company_action.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/clientprofile/client_company_state.dart';
import 'package:khontext/redux/states/clientprofile/client_profile_local_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_image.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text_field.dart';
import 'package:khontext/src/khontext_widgets/fields/form_image_picker.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/clientprofile/client_company_image_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_image_request_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_model.dart';
import 'package:khontext/src/models/clientprofile/client_company_request_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class CompanySection extends StatefulWidget {
  @override
  _CompanySectionState createState() => _CompanySectionState();
}

class _CompanySectionState extends State<CompanySection> {
  /// Text editing controllers.
  TextEditingController _companyNameController = TextEditingController();
  TextEditingController _companyTagLineController = TextEditingController();
  TextEditingController _companyUrlController = TextEditingController();
  TextEditingController _companyDescriptionController = TextEditingController();

  /// Image picker instance and the picked file instance.
  String _selectedFilePath;

  /// [bool] which suggests that the save button is enabled or not.
  bool isSaveEnabled = false;

  /// [ClientCompanyData] and [ClientCompanyImageData] for the usage of showing the data.
  ClientCompanyData clientCompanyData;
  ClientCompanyImageData clientCompanyImageData;

  /// current edit status
  ProfilePageEditStatus currentState;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    store.dispatch(ClientCompanyFetchAction());
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ClientProfileViewModel>(
      converter: (store) =>
          ClientProfileViewModel(store, store.state.clientCompanyState, store.state.clientProfileLocalState),
      builder: (context, vm) {
        currentState = vm.clientProfileLocalState.editStatus;
        if (vm.clientCompanyState.isLoading) {
          return BaseLoadingWidget();
        } else if (!Utils.isProfileDataAdded(vm.clientCompanyState.clientCompanyResponseModel) &&
            currentState != ProfilePageEditStatus.COMPANY_EDIT_MODE) {
          return addCompanyDataButton();
        }

        return companySectionUI(vm);
      },
    );
  }

  /// Widget function which will give the UI for the company section.
  Widget companySectionUI(ClientProfileViewModel vm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => onImageTap(context, vm),
          splashColor: Colors.transparent,
          child: FormBuilderImage(
            width: Utils.screenWidth * 0.3,
            height: Utils.screenWidth * 0.3,
            rounded: true,
            imageUrl: '',
            imageBytes: getUserImage(vm),
            placeHolderPath: Constants.companyPlaceholder,
            localImagePath: _selectedFilePath,
          ),
        ),
        const SizedBox(height: 8),
        Divider(),
        const SizedBox(height: 8),
        currentState == ProfilePageEditStatus.COMPANY_EDIT_MODE ? editModeWidgets(vm) : nonEditModeWidgets(vm),
      ],
    );
  }

  /// Widget function for the add company data button UI
  Widget addCompanyDataButton() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Center(
        child: BaseButtonWidget(
          minWidth: Utils.screenWidth * 0.5,
          btnChild: FormBuilderText(
            message: FormBuilderLocalizations.of(context).addCompanyText,
            textStyle: Styles.customTextStyle(textColor: Colors.white),
          ),
          onPressed: () => addCompanyButtonClick(),
        ),
      ),
    );
  }

  /// Widget function for the case [ProfilePageEditStatus.COMPANY_EDIT_MODE], this will have the edit mode
  /// functionality along with buttons like cancel/save.
  Widget editModeWidgets(ClientProfileViewModel vm) {
    return Column(
      children: [
        FormBuilderTextField(
          name: Constants.profileCompanyName,
          controller: _companyNameController,
          textInputAction: TextInputAction.next,
          onChanged: (value) => checkValueChange(),
          decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).companyNameText),
        ),
        const SizedBox(height: 15.0),
        FormBuilderTextField(
          name: Constants.profileCompanyWebUrl,
          controller: _companyUrlController,
          textInputAction: TextInputAction.next,
          onChanged: (value) => checkValueChange(),
          decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).companyWebUrlText),
        ),
        const SizedBox(height: 15.0),
        FormBuilderTextField(
          name: Constants.profileCompanyTagLine,
          controller: _companyTagLineController,
          onChanged: (value) => checkValueChange(),
          decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).companyTagLineText),
        ),
        const SizedBox(height: 15.0),
        FormBuilderTextField(
          name: Constants.profileCompanyDescription,
          controller: _companyDescriptionController,
          textInputAction: TextInputAction.done,
          onChanged: (value) => checkValueChange(),
          decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).companyDescriptionText),
        ),
        const SizedBox(height: 15.0),
        _actionButtons(vm),
        const SizedBox(height: 15.0),
      ],
    );
  }

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
  Widget _actionButtons(ClientProfileViewModel vm) {
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
            onPressed: () => saveButtonClick(vm),
          ),
        ),
      ],
    );
  }

  /// Widget function whenever the user is in [ProfilePageEditStatus.IDLE_MODE] state, this is a informatory widget.
  Widget nonEditModeWidgets(ClientProfileViewModel vm) {
    if (errorShow(vm).isNotEmpty) {
      return ErrorTextWidget(
        error: errorShow(vm) != null ? errorShow(vm) : FormBuilderLocalizations.of(context).dataLoadText,
      );
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(
          message: clientCompanyData.name,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: clientCompanyData.website,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).companyTagLineText,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
        ),
        FormBuilderText(
          message: clientCompanyData.tagline,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
        const SizedBox(height: 15.0),
        FormBuilderText(
          message: FormBuilderLocalizations.of(context).companyDescriptionText,
          textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
        ),
        FormBuilderText(
          message: clientCompanyData.description,
          textStyle: Styles.customTextStyle(textSize: 18.0),
        ),
      ],
    );
  }

  /// Function which performs the image tap functionality. If the user is in [ProfilePageEditStatus.COMPANY_EDIT_MODE],
  /// image picker will be open to pick the image and set it in the image.
  void onImageTap(BuildContext context, ClientProfileViewModel vm) async {
    if (ProfilePageEditStatus.COMPANY_EDIT_MODE == currentState) {
      FormImagePicker.pickFile(context, pickedFile: (file) {
        final bytes = File(file.path).readAsBytesSync();
        String img64 = base64Encode(bytes);
        if (!Utils.isProfileDataAdded(vm.clientCompanyState.clientCompanyProfileImageResponseModel)) {
          vm.store.dispatch(
            ClientCompanyAddImageAction(
              clientCompanyImageRequestModel: ClientCompanyImageRequestModel(
                name: vm.clientCompanyState.clientCompanyResponseModel.data.name + '.jpg',
                base64: img64,
                captions: '',
                description: vm.clientCompanyState.clientCompanyResponseModel.data.description,
                size: File(file.path).lengthSync().toString(),
                mimeType: 'image/jpg',
                extension: 'jpg',
                width: '320',
                height: '320',
                fileType: 'Image',
                aspectRatio: '1:1',
              ),
            ),
          );
        } else {
          vm.store.dispatch(
            ClientCompanyUpdateImageAction(
              clientCompanyImageRequestModel: ClientCompanyImageRequestModel(
                name: vm.clientCompanyState.clientCompanyResponseModel.data.name + '.jpg',
                base64: img64,
                captions: '',
                description: vm.clientCompanyState.clientCompanyResponseModel.data.description,
                size: File(file.path).lengthSync().toString(),
                mimeType: 'image/jpg',
                extension: 'jpg',
                width: '320',
                height: '320',
                fileType: 'Image',
                aspectRatio: '1:1',
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
    _companyNameController.text = clientCompanyData.name;
    _companyTagLineController.text = clientCompanyData.tagline;
    _companyUrlController.text = clientCompanyData.website;
    _companyDescriptionController.text = clientCompanyData.description;
  }

  /// Will be used for maintaining the disability of the save button.
  void checkValueChange() {
    bool tempSaveValue = false;
    if (clientCompanyData == null ||
        _companyNameController.text != clientCompanyData.name ||
        _companyTagLineController.text != clientCompanyData.tagline ||
        _companyUrlController.text != clientCompanyData.website ||
        _companyDescriptionController.text != clientCompanyData.description) {
      tempSaveValue = true;
    }

    if (isSaveEnabled != tempSaveValue) {
      setState(() {
        isSaveEnabled = tempSaveValue;
      });
    }
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [String] error,
  /// it also set the [ClientCompanyData] if there is no error.
  String errorShow(ClientProfileViewModel vm) {
    if (vm.clientCompanyState != null && vm.clientCompanyState.error.isNotEmpty) {
      return vm.clientCompanyState.error;
    } else if (vm.clientCompanyState != null &&
        vm.clientCompanyState.clientCompanyResponseModel != null &&
        vm.clientCompanyState.clientCompanyResponseModel.data == null) {
      return FormBuilderLocalizations.of(context).companyDataNoText;
    }

    clientCompanyData = vm.clientCompanyState.clientCompanyResponseModel.data;
    setInitialValues();
    return '';
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [String] error,
  /// it also set the [ClientCompanyImageData] if there is no error.
  String imageErrorShow(ClientProfileViewModel vm) {
    if (vm.clientCompanyState != null && vm.clientCompanyState.error.isNotEmpty) {
      return vm.clientCompanyState.error;
    } else if (vm.clientCompanyState.clientCompanyProfileImageResponseModel != null &&
        !vm.clientCompanyState.clientCompanyProfileImageResponseModel.isSuccessful &&
        vm.clientCompanyState.clientCompanyProfileImageResponseModel.message.isNotEmpty) {
      return vm.clientCompanyState.clientCompanyProfileImageResponseModel.message;
    } else if (vm.clientCompanyState.clientCompanyProfileImageResponseModel == null) {
      return FormBuilderLocalizations.of(context).imageSetText;
    }

    clientCompanyImageData = vm.clientCompanyState.clientCompanyProfileImageResponseModel.data;
    return '';
  }

  /// Function which takes in the [ClientProfileViewModel] and provides the [Uint8List] image bytes if the
  /// condition matches.
  Uint8List getUserImage(ClientProfileViewModel vm) {
    if (imageErrorShow(vm).isEmpty && _selectedFilePath == null && clientCompanyImageData.base64 != null) {
      return Base64Decoder().convert(clientCompanyImageData.base64);
    }

    return null;
  }

  /// Function which is called when click of the buttons.
  void addCompanyButtonClick() {
    store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.COMPANY_EDIT_MODE));
  }

  void cancelButtonClick() {
    store.dispatch(ChangeEditStatusSuccessAction(editStatus: ProfilePageEditStatus.IDLE_MODE));
  }

  void saveButtonClick(ClientProfileViewModel vm) {
    if (!Utils.isProfileDataAdded(vm.clientCompanyState.clientCompanyResponseModel)) {
      store.dispatch(
        ClientCompanyAddAction(
          clientCompanyRequestModel: ClientCompanyRequestModel(
            name: _companyNameController.text,
            tagline: _companyTagLineController.text,
            website: _companyUrlController.text,
            description: _companyDescriptionController.text,
          ),
        ),
      );
    } else {
      store.dispatch(
        ClientCompanyUpdateAction(
          clientCompanyRequestModel: ClientCompanyRequestModel(
            name: _companyNameController.text,
            tagline: _companyTagLineController.text,
            website: _companyUrlController.text,
            description: _companyDescriptionController.text,
          ),
        ),
      );
    }
  }
}

class ClientProfileViewModel {
  final Store<AppState> store;
  final ClientCompanyState clientCompanyState;
  final ClientProfileLocalState clientProfileLocalState;

  ClientProfileViewModel(this.store, this.clientCompanyState, this.clientProfileLocalState);
}
