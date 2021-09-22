import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatoridentification/translator_identification_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/signin/sign_in_state.dart';
import 'package:khontext/redux/states/translate/translate_identification_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_multi_image_picker.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/translator/translatoridentification/add_translator_identify_request_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:redux/redux.dart';

class TranslatorIdentificationPage extends StatefulWidget {
  const TranslatorIdentificationPage({Key key}) : super(key: key);

  @override
  _TranslatorIdentificationPageState createState() => _TranslatorIdentificationPageState();
}

class _TranslatorIdentificationPageState extends State<TranslatorIdentificationPage> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormBuilderState> identificationForm = GlobalKey<FormBuilderState>();

  /// List of images selected for the proof.
  List<dynamic> imagesList = [];
  List<FileOrDocumentInformationRequest> fileDocsList = [];

  /// String for the disclosures text
  String disclosureText = '';
  String hideDisclosureText = '';

  /// Toggling [bool]
  bool isDisclosureHidden = false;
  bool isAgreeChecked = false;

  /// [DateTime] for the birthday
  DateTime birthDate;

  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _ssnNumberController = TextEditingController();
  final TextEditingController _zipController = TextEditingController();

  /// Store instance to use further
  Store<AppState> store;

  /// [SignInState] for getting the user details.
  SignInState signInState;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    signInState = store.state.signInState;
  }

  @override
  Widget build(BuildContext context) {
    disclosureText = FormBuilderLocalizations.of(context).additionalDisclosures;
    hideDisclosureText = FormBuilderLocalizations.of(context).hideDisclosures;
    return StoreConnector<AppState, TranslatorIdentificationViewModel>(
      converter: (store) =>
          TranslatorIdentificationViewModel(store.state.translateIdentificationState),
      onInit: (store) => store.dispatch(TranslateIdentificationFetchAction()),
      builder: (context, vm) {
        if (vm.translateIdentificationState.isLoading) {
          return BaseLoadingWidget();
        }
        vm.translateIdentificationState?.addIdentificationResponseModel?.data
            ?.fileOrDocumentInformations
            ?.map((e) {
          if (!imagesList.contains(e)) {
            imagesList.add(e);
            fileDocsList.add(FileOrDocumentInformationRequest(
                name: e.name, base64: e.base64, fileType: 'Image'));
          }
        })?.toList();
        return _identificationLayout(vm);
      },
    );
  }

  Widget _identificationLayout(TranslatorIdentificationViewModel vm) {
    bool isEditable = vm?.translateIdentificationState?.addIdentificationResponseModel?.data
        ?.checkrCandidateId?.isNotEmpty;
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
          horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isEditable ? SizedBox() : _identificationForm(),
          const SizedBox(height: 15.0),
          multiImagePickerLayout(context, isEditable),
          const SizedBox(height: 8.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).requiredText,
            textStyle: Styles.customTextStyle(textColor: Colors.red, textSize: 14.0),
          ),
          const SizedBox(height: 15.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).authText,
            textStyle: Styles.customTextStyle(
                textColor: Colors.black, textSize: 16.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8.0),
          FormBuilderText(
            message:
                'I acknowledge and agree that I have read and understand the Background Check Disclosure and further acknowledge that I have read, understand and agree with the statements contained in the additional disclosures. By my electronic signature, I hereby authorize Khontext to obtain consumer reports about me from any CRA at any time after receipt of this authorization and throughout my independent contractor relationship. I agree that I am providing my electronic signature and that my electronic signature is binding just like a signature in ink.',
            textStyle: Styles.customTextStyle(textColor: Colors.black, textSize: 16.0),
            maxLines: 20,
          ),
          const SizedBox(height: 15.0),
          InkWell(
            splashColor: Colors.transparent,
            onTap: () => disclosureClick(),
            child: FormBuilderText(
              message: isDisclosureHidden ? hideDisclosureText : disclosureText,
              textStyle: Styles.customTextStyle(
                  textColor: Palette.AppThemeColor, textSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8.0),
          if (isDisclosureHidden) ...[
            FormBuilderText(
              message:
                  'Khontext LLC, Inc. and its subsidiaries that contract with individuals who provide services requested are committed to safety. As part of that commitment, an Khontext Entity may obtain "consumer reports" (background checks) about you from a consumer reporting agency ("CRA") in connection with your ability to enter into or maintain an independent contractor relationship with that Khontext Entity. These reports may contain information regarding your criminal history. motor vehicle driving records (which may contain information about your physical, mental, or behavioral health maintained by a state government agency that has restricted your ability to drive legally), or other background checks.',
              textStyle: Styles.customTextStyle(textColor: Colors.black, textSize: 16.0),
              maxLines: 20,
            ),
            const SizedBox(height: 15.0),
          ],
          FormBuilderCheckbox(
            name: Constants.agreeAndContinue,
            decoration:
                Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
            initialValue: isAgreeChecked,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            contentPadding: EdgeInsets.zero,
            onChanged: (value) {
              if (mounted) {
                setState(() {
                  isAgreeChecked = value;
                });
              }
            },
            title: FormBuilderText(
              message: FormBuilderLocalizations.of(context).agreeText,
              textStyle: Styles.customTextStyle(textSize: 15.0, textColor: Colors.black),
            ),
          ),
          const SizedBox(height: 15.0),
          !isEditable
              ? BaseButtonWidget(
                  minWidth: Utils.screenWidth,
                  btnChild: FormBuilderText(
                      message: FormBuilderLocalizations.of(context).uploadText,
                      textStyle: Styles.customTextStyle(textColor: Colors.white)),
                  onPressed: () => addIdentification(vm),
                )
              : SizedBox(),
        ],
      ),
    );
  }

  /// Widget function which will give the identification form.
  Widget _identificationForm() {
    return FormBuilder(
      key: identificationForm,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonTextTitle(FormBuilderLocalizations.of(context).ssNumberText),
          FormBuilderTextField(
            name: Constants.ssnNumberText,
            controller: _ssnNumberController,
            textInputAction: TextInputAction.next,
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).ssNNumber),
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
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).dateOfBirthReqText),
          ),
          const SizedBox(height: 15),
          commonTextTitle(FormBuilderLocalizations.of(context).postalZipText),
          FormBuilderTextField(
            name: Constants.profileZip,
            controller: _zipController,
            textInputAction: TextInputAction.next,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).postalZipText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).postalZipErrorText),
          ),
        ],
      ),
    );
  }

  /// Widget function which will let user pick the multiple images.
  /// It calls [pickMultiImageTap] on tap of the text and opens the multi image picker.
  Widget multiImagePickerLayout(BuildContext context, bool isEditable) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormBuilderText(
              message: FormBuilderLocalizations.of(context).uploadTwoText,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
            !isEditable
                ? InkWell(
                    splashColor: Colors.transparent,
                    onTap: () => pickMultiImageTap(context),
                    child: FormBuilderText(
                      message: FormBuilderLocalizations.of(context).chooseText,
                      textStyle:
                          Styles.customTextStyle(textSize: 16.0, textColor: Palette.AppThemeColor),
                    ),
                  )
                : SizedBox(),
          ],
        ),
        const SizedBox(height: 15.0),
        Container(
          width: Utils.screenWidth,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 5.0),
          decoration: BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
          child: imagesList.isEmpty
              ? FormBuilderText(
                  message: FormBuilderLocalizations.of(context).noImageSelectedText,
                  textStyle: Styles.customTextStyle(textSize: 16.0),
                )
              : imagesGridWidget(),
        ),
      ],
    );
  }

  /// Widget function which gives the UI for the grid of the images when user picks the images.
  Widget imagesGridWidget() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: imagesList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.0,
        crossAxisCount: 5,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
      ),
      itemBuilder: (context, index) {
        if (imagesList[index].runtimeType == FileOrDocumentInformationResponse) {
          return Image.memory(
            base64Decode((imagesList[index] as FileOrDocumentInformationResponse).base64),
            width: 150,
            height: 150,
          );
        }
        return AssetThumb(
          asset: imagesList[index],
          width: 150,
          height: 150,
        );
      },
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [pickMultiImageTap], [disclosureClick]
  void pickMultiImageTap(BuildContext context) async {
    List<Asset> baseList = [];
    imagesList.map((e) {
      if (e.runtimeType == Asset) baseList.add(e);
    }).toList();
    List<Asset> list = await MultipleImagePicker.pickMultiImages(baseList, context);
    list.map(
      (e) async {
        ByteData byteData = await e.getByteData();
        return fileDocsList.add(
          FileOrDocumentInformationRequest(
            name: e.name,
            base64: base64Encode(
                byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
            fileType: 'Document',
            captions:
                '${signInState.completeProfileResponseModel.data.firstName} identity-document',
            mimeType: e.name.substring(e.name.lastIndexOf('.') + 1),
          ),
        );
      },
    ).toList();
    setState(() {
      imagesList.addAll(list);
    });
  }

  /// Widget function which gives the common text for the title.
  Widget commonTextTitle(String title) {
    return FormBuilderText(
      message: title,
      textStyle: Styles.customTextStyle(textSize: 16.0),
    );
  }

  void disclosureClick() {
    setState(() {
      isDisclosureHidden = !isDisclosureHidden;
    });
  }

  /// Function which will call the add identification event.
  void addIdentification(TranslatorIdentificationViewModel vm) {
    String userId = Utils.getStringFromPrefs(Constants.userToken);
    if (identificationForm.currentState.validate() &&
        isAgreeChecked &&
        fileDocsList?.isNotEmpty == true) {
      store.dispatch(
        AddTranslateIdentificationAction(
          addIdentificationRequestModel: AddIdentificationRequestModel(
            userId: userId,
            ssnNumber: _ssnNumberController.text,
            dateOfBirth: Utils.getBirthDayString(birthDate),
            zipCode: _zipController.text,
            fileOrDocumentInformation: fileDocsList,
          ),
        ),
      );
    }
  }
}

class TranslatorIdentificationViewModel {
  final TranslateIdentificationState translateIdentificationState;

  TranslatorIdentificationViewModel(this.translateIdentificationState);
}
