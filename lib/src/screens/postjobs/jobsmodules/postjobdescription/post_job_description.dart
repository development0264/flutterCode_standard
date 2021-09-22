import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_description_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_description_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_multi_image_picker.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_request_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingeducation/document_upload_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:khontext/src/screens/postjobs/bottom_navigations_buttons_widget.dart';
import 'package:khontext/src/screens/postjobs/jobsmodules/postjobdescription/post_job_services_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:redux/redux.dart';

class PostJobDescription extends StatefulWidget {
  final String jobId;

  const PostJobDescription({Key key, this.jobId}) : super(key: key);

  @override
  _PostJobDescriptionState createState() => _PostJobDescriptionState();
}

class _PostJobDescriptionState extends State<PostJobDescription> {
  /// Global key for maintaining the state of the form.
  final _jobDescriptionFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  /// Strings which provides the selected values.
  String selectedService = '';

  /// Selected interpretation
  List<dynamic> selectedInterpretation = [];

  /// Lists for various options
  List<JobServicesData> serviceList = [];
  List<dynamic> imagesList = [];
  List<FileOrDocumentInformationRequest> fileDocsList = [];

  /// Store instance to use further
  Store<AppState> store;

  JobDescriptionData jobDescriptionData;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    jobDescriptionData = store.state.postJobDescriptionState?.postJobDescriptionResponseModel?.data;
    if (jobDescriptionData == null || jobDescriptionData.jobId?.isEmpty == true) {
      store.dispatch(JobServicesFetchAction(jobId: widget.jobId));
    } else {
      _titleController.text = jobDescriptionData.title;
      _descriptionController.text = jobDescriptionData.description;
      selectedService = jobDescriptionData.serviceType.serviceTypeId;
      selectedInterpretation = jobDescriptionData.serviceType.services;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, JobDescriptionViewModel>(
      converter: (store) => JobDescriptionViewModel(store, store.state.postJobDescriptionState),
      builder: (context, vm) {
        return Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    descriptionForm(context, vm),
                    const SizedBox(height: 12.0),
                    postJobButtonsNavigation(),
                  ],
                ),
              ),
            ),
            if (vm.postJobDescriptionState.isLoading &&
                vm.postJobDescriptionState.currentAction == JobDescriptionAddUpdateAction) ...[
              BaseLoadingWidget(),
            ],
          ],
        );
      },
    );
  }

  /// Widget function which gives the UI for the entire description page form.
  Widget descriptionForm(BuildContext context, JobDescriptionViewModel vm) {
    if (!vm.postJobDescriptionState.isLoading) {
      setData(vm.postJobDescriptionState);
    }
    return FormBuilder(
      key: _jobDescriptionFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).titleText,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.titleText,
            controller: _titleController,
            textInputAction: TextInputAction.next,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).titleText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).titleEmptyErrorText),
          ),
          const SizedBox(height: 15.0),
          PostJobServicesWidget(
            selectedData: (String serviceType, List<dynamic> serviceList) {
              selectedService = serviceType;
              selectedInterpretation = serviceList;
            },
          ),
          const SizedBox(height: 8.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).descriptionText,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.descriptionText,
            controller: _descriptionController,
            textInputAction: TextInputAction.next,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).descriptionText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).descEmptyErrorText),
            maxLines: 3,
          ),
          const SizedBox(height: 25.0),
          multiImagePickerLayout(context),
          const SizedBox(height: 15.0),
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

  /// Widget function which gives the bottom button navigation widget.
  /// This have two buttons, [BACK] and [NEXT].
  Widget postJobButtonsNavigation() {
    return PostJobBottomNavigation(
      moveAhead: () => moveAheadTap(),
      moveBackward: null,
      backEnabled: false,
      forwardEnabled: true,
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
            base64: base64Encode(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes)),
            fileType: 'Image',
          ),
        );
      },
    ).toList();
    setState(() {
      imagesList.addAll(list);
    });
  }

  void moveAheadTap() {
    String userId = Utils.getStringFromPrefs(Constants.userToken);
    if (checkAllValidations() && userId?.isNotEmpty == true) {
      store.dispatch(
        JobDescriptionAddUpdateAction(
          jobDescriptionRequestModel: JobDescriptionRequestModel(
            jobId: widget.jobId != null
                ? widget.jobId
                : jobDescriptionData?.jobId?.isNotEmpty == true
                    ? jobDescriptionData.jobId
                    : null,
            userId: userId,
            title: _titleController.text,
            serviceTypeId: selectedService,
            serviceIds: (selectedInterpretation is List<String>)
                ? selectedInterpretation
                : selectedInterpretation.map((e) => e.serviceId).toList(),
            description: _descriptionController.text,
            fileDocumentIds: [],
          ),
          imagesList: fileDocsList,
        ),
      );
    }
  }

  bool checkAllValidations() {
    return _jobDescriptionFormKey.currentState.validate();
  }

  void setData(PostJobDescriptionState postJobDescriptionState) {
    if (postJobDescriptionState?.postJobDescriptionResponseModel?.data != null) {
      _titleController.text = postJobDescriptionState?.postJobDescriptionResponseModel?.data?.title;
      _descriptionController.text = postJobDescriptionState?.postJobDescriptionResponseModel?.data?.description;
      selectedService = postJobDescriptionState?.postJobDescriptionResponseModel?.data?.serviceType?.serviceTypeId;
      selectedInterpretation = postJobDescriptionState?.postJobDescriptionResponseModel?.data?.serviceType?.services;
      postJobDescriptionState?.postJobDescriptionResponseModel?.data?.fileDocuments?.map((e) {
        if (!imagesList.contains(e)) {
          imagesList.add(e);
          fileDocsList.add(FileOrDocumentInformationRequest(name: e.name, base64: e.base64, fileType: 'Image'));
        }
      })?.toList();
    }
  }
}

class JobDescriptionViewModel {
  final Store<AppState> store;
  final PostJobDescriptionState postJobDescriptionState;

  JobDescriptionViewModel(this.store, this.postJobDescriptionState);
}
