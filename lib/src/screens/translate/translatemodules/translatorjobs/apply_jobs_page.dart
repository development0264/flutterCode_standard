import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorjobs/apply_job_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_multi_image_picker.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text_field.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/form_builder.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/translator/translatorjobs/add_update_apply_job_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_response.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:redux/redux.dart';

class ApplyJobsPage extends StatefulWidget {
  final JobRecord jobRecord;

  const ApplyJobsPage({Key key, this.jobRecord}) : super(key: key);

  @override
  _ApplyJobsPageState createState() => _ApplyJobsPageState();
}

class _ApplyJobsPageState extends State<ApplyJobsPage> {
  /// Global key for maintaining the state of the form.
  final _applyJobFormKey = GlobalKey<FormBuilderState>();

  final TextEditingController _jobDescriptionController = TextEditingController();

  /// Lists for various options
  List<dynamic> imagesList = [];
  List<FileOrDocumentInformationRequest> fileDocsList = [];

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarTitle(),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.screenWidth * 0.05,
          vertical: Utils.screenHeight * 0.02,
        ),
        child: Stack(
          children: [
            applyJobUi(),
          ],
        ),
      ),
    );
  }

  /// Widget function which gives the ui for the app bar, have the text favorites.
  Widget _appBarTitle() {
    return AppBar(
      centerTitle: true,
      title: FormBuilderText(message: 'Apply Job'),
      backgroundColor: Palette.AppThemeColor,
    );
  }

  Widget applyJobUi() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _jobDetailsLayout(),
          const SizedBox(height: 8.0),
          applyJobForm(),
        ],
      ),
    );
  }

  Widget _jobDetailsLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormBuilderText(
          message: widget.jobRecord.title,
          textStyle: Styles.customTextStyle(fontWeight: FontWeight.bold, textSize: 18.0),
        ),
        FormBuilderText(message: widget.jobRecord.description),
      ],
    );
  }

  /// Widget which gives the form for the apply job.
  Widget applyJobForm() {
    return FormBuilder(
      key: _applyJobFormKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: Constants.descriptionText,
            controller: _jobDescriptionController,
            textInputAction: TextInputAction.next,
            minLines: 5,
            maxLines: 6,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).descriptionText),
          ),
          const SizedBox(height: 15.0),
          multiImagePickerLayout(context),
          const SizedBox(height: 15.0),
          BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
                message: "Apply", textStyle: Styles.customTextStyle(textColor: Colors.white)),
            onPressed: () => applyForJob(),
          ),
        ],
      ),
    );
  }

  /// Widget function which will let user pick the multiple images.
  /// It calls [pickMultiImageTap] on tap of the text and opens the multi image picker.
  Widget multiImagePickerLayout(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormBuilderText(
              message: FormBuilderLocalizations.of(context).imagesText,
              textStyle: Styles.customTextStyle(textSize: 16.0),
            ),
            InkWell(
              splashColor: Colors.transparent,
              onTap: () => pickMultiImageTap(context),
              child: FormBuilderText(
                message: FormBuilderLocalizations.of(context).pickImageText,
                textStyle: Styles.customTextStyle(textSize: 16.0, textColor: Palette.AppThemeColor),
              ),
            ),
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
  /// This includes  [pickMultiImageTap], [moveAheadTap] and [checkAllValidations].
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
            fileType: 'Image',
          ),
        );
      },
    ).toList();
    setState(() {
      imagesList.addAll(list);
    });
  }

  /// Function which submits the apply job.
  void applyForJob() {
    if (_applyJobFormKey.currentState.validate()) {
      String userId = Utils.getStringFromPrefs(Constants.userToken);
      store.dispatch(
        AddUpdateApplyJobsAction(
          addUpdateApplyJobsRequest: AddUpdateApplyJobsRequest(
            jobId: widget.jobRecord.id,
            userId: userId,
            description: _jobDescriptionController.text,
            fileOrDocumentIds: [],
          ),
          imageList: fileDocsList,
        ),
      );
    }
  }
}
