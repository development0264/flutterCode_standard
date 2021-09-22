import 'package:flutter/material.dart';
import 'package:flutter_chips_input/flutter_chips_input.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_visibility_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_visibility_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/posted_jobs_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/joblanguages/specializations_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_request_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/job_visibility_response_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_proficiency_model.dart';
import 'package:khontext/src/models/postjobs/jobvisibility/post_job_states_model.dart';
import 'package:khontext/src/screens/postjobs/bottom_navigations_buttons_widget.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PostJobVisibility extends StatefulWidget {
  final String jobId;
  final Function moveBackward;

  const PostJobVisibility({Key key, this.moveBackward, this.jobId}) : super(key: key);

  @override
  _PostJobVisibilityState createState() => _PostJobVisibilityState();
}

class _PostJobVisibilityState extends State<PostJobVisibility> {
  /// Global key for maintaining the state of the form.
  final _jobVisibilityFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _experienceController = TextEditingController();
  final TextEditingController _ratingsController = TextEditingController();
  final TextEditingController _reviewsController = TextEditingController();

  /// Strings which provides the selected values.
  List<PostJobStatesData> selectedBoundary = [];
  List<SpecializationsData> selectedLanguageSpeciality = [];
  String selectedProficiency;

  /// Current [PostedJobsLocality] which stores the current state at the time of saving.
  PostedJobsVisibility addedPostJobVisibility = PostedJobsVisibility();

  /// Store instance to use further
  Store<AppState> store;

  /// Data model for the visibility
  VisibilityData visibilityData;
  JobDescriptionData jobDescriptionData;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    visibilityData = store.state.postJobVisibilityState.jobVisibilityResponseModel.data;
    jobDescriptionData = store.state.postJobDescriptionState.postJobDescriptionResponseModel.data;

    if (visibilityData?.jobId?.isNotEmpty == true) {
      _experienceController.text = visibilityData.minimumExperience.toString();
      fetchInitialData(visibilityData);
      selectedProficiency = visibilityData.proficiencyLevel.proficiencyLevelId;
      _ratingsController.text = visibilityData.minimumRatings.toString();
      _reviewsController.text = visibilityData.minimumReviews.toString();
    } else {
      store.dispatch(JobVisibilityEssentialsAction(jobId: widget.jobId));
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, JobVisibilityViewModel>(
      converter: (store) => JobVisibilityViewModel(store, store.state.postJobVisibilityState),
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
                    jobVisibilityForm(context, vm),
                    const SizedBox(height: 12.0),
                    postJobButtonsNavigation(),
                  ],
                ),
              ),
            ),
            if (vm.postJobVisibilityState.isLoading &&
                (vm.postJobVisibilityState.currentAction == JobVisibilityEssentialsAction ||
                    vm.postJobVisibilityState.currentAction == AddJobVisibilityAction)) ...[
              BaseLoadingWidget(),
            ],
          ],
        );
      },
    );
  }

  Widget jobVisibilityForm(BuildContext context, JobVisibilityViewModel vm) {
    setData(vm.postJobVisibilityState);
    return FormBuilder(
      key: _jobVisibilityFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FormBuilderChipsInput<PostJobStatesData>(
            decoration: InputDecoration(labelText: FormBuilderLocalizations.of(context).countryText),
            name: Constants.profileCountry,
            maxChips: 5,
            focusNode: new FocusNode(),
            initialValue: selectedBoundary,
            onChanged: (chips) => onBoundaryChanged(chips),
            findSuggestions: (String query) =>
                chipSuggestions(query, vm?.postJobVisibilityState?.jobStatesResponseModel?.data)
                    as List<PostJobStatesData>,
            chipBuilder: (context, state, specialization) =>
                chipBuilder(context, state, specialization, specialization.name),
            suggestionBuilder: (context, state, data) => suggestionsBuilder(state, data, data.name),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectSpecializationsErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderChipsInput<SpecializationsData>(
            decoration: InputDecoration(labelText: FormBuilderLocalizations.of(context).specializationText),
            name: Constants.specializationsText,
            maxChips: 5,
            focusNode: new FocusNode(),
            initialValue: selectedLanguageSpeciality,
            onChanged: (chips) => onLanguageSpecialityChange(chips),
            findSuggestions: (String query) =>
                chipSuggestions(query, vm?.postJobVisibilityState?.specializationsResponseModel?.data)
                    as List<SpecializationsData>,
            chipBuilder: (context, state, specialization) =>
                chipBuilder(context, state, specialization, specialization.name),
            suggestionBuilder: (context, state, data) => suggestionsBuilder(state, data, data.name),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectSpecializationsErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderDropdown<String>(
            name: Constants.proficiencyText,
            allowClear: false,
            initialValue: selectedProficiency,
            hint: FormBuilderText(
                message: FormBuilderLocalizations.of(context).proficiencyText,
                textStyle: Styles.customTextStyle(textSize: 16.0)),
            onChanged: (val) => onProficiencyChange(val),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectProficiencyErrorText),
            decoration: Styles.textInputDecoration(),
            items: vm?.postJobVisibilityState?.jobProficiencyResponseModel?.data
                ?.map((proficiency) =>
                    _commonDropDownItem(value: proficiency.proficiencyLevelId, message: proficiency.name))
                ?.toList(),
          ),
          const SizedBox(height: 15.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).experienceText,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          FormBuilderTextField(
            name: Constants.experienceText,
            controller: _experienceController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).experienceText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectExperienceErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).ratingsText,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          FormBuilderTextField(
            name: Constants.ratingsText,
            controller: _ratingsController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.number,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).ratingsText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectRatingsErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).reviewsText,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          const SizedBox(height: 8.0),
          FormBuilderTextField(
            name: Constants.reviewsText,
            controller: _reviewsController,
            textInputAction: TextInputAction.done,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).reviewsText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).selectReviewsErrorText),
          ),
        ],
      ),
    );
  }

  /// Function which takes in the chip query and gives the response as the list of dynamic data.
  List<dynamic> chipSuggestions(String query, dynamic data) {
    if (query.isNotEmpty && data?.isNotEmpty == true) {
      var lowercaseQuery = query.toLowerCase();
      return data.where((singleData) {
        return singleData.name.toLowerCase().contains(query.toLowerCase()) ||
            singleData.name.toLowerCase().contains(query.toLowerCase());
      }).toList(growable: false)
        ..sort((a, b) => a.name
            .toLowerCase()
            .indexOf(lowercaseQuery)
            .compareTo(b.name.toLowerCase().indexOf(lowercaseQuery)) as int);
    } else {
      return data;
    }
  }

  /// Widget function which gives the ui for the single input chip.
  Widget chipBuilder(BuildContext context, ChipsInputState<dynamic> state, dynamic data, String name) {
    return InputChip(
      key: ObjectKey(data),
      label: Text(name),
      onDeleted: () => state.deleteChip(data),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    );
  }

  /// Widget function which gives the ui for the chip suggestions list.
  Widget suggestionsBuilder(ChipsInputState<dynamic> state, dynamic data, String name) {
    return ListTile(
      key: ObjectKey(data),
      title: Text(name),
      onTap: () => state.selectSuggestion(data),
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

  /// Widget function which gives the bottom button navigation widget.
  /// This have two buttons, [BACK] and [NEXT].
  Widget postJobButtonsNavigation() {
    return PostJobBottomNavigation(
      moveAhead: () => moveAheadTap(),
      moveBackward: () => moveBackTap(),
      backEnabled: true,
      forwardEnabled: true,
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [onBoundaryChanged], [onLanguageSpecialityChange], [onProficiencyChange],
  /// [moveBackTap], [moveAheadTap] and [checkAllValidations].
  void onBoundaryChanged(List<PostJobStatesData> boundary) {
    selectedBoundary = boundary;
  }

  void onLanguageSpecialityChange(List<SpecializationsData> specialization) {
    selectedLanguageSpeciality = specialization;
  }

  void onProficiencyChange(String value) {
    selectedProficiency = value;
  }

  void moveAheadTap() {
    if (checkAllValidations()) {
      if (visibilityData == null || visibilityData.visibilityId.isEmpty == true) {
        store.dispatch(
          AddJobVisibilityAction(
            jobVisibilityRequestModel: JobVisibilityRequestModel(
              jobId: widget.jobId != null
                  ? widget.jobId
                  : jobDescriptionData?.jobId?.isNotEmpty == true
                      ? jobDescriptionData.jobId
                      : null,
              geographicalBoundaryIds: selectedBoundary.map((e) => e.stateId).toList(),
              countryId: selectedBoundary?.isNotEmpty == true ? selectedBoundary[0].countryId : null,
              languageSpecialtyIds: selectedLanguageSpeciality.map((e) => e.specializationId).toList(),
              proficiencyLevelId: selectedProficiency,
              minimumExperience: int.parse(_experienceController.text),
              minimumRatings: int.parse(_ratingsController.text),
              minimumReviews: _reviewsController.text,
            ),
          ),
        );
      } else {
        store.dispatch(
          AddJobVisibilityAction(
            jobVisibilityRequestModel: JobVisibilityRequestModel(
              visibilityId: visibilityData.visibilityId,
              jobId: widget.jobId != null
                  ? widget.jobId
                  : jobDescriptionData?.jobId?.isNotEmpty == true
                      ? jobDescriptionData.jobId
                      : null,
              geographicalBoundaryIds: selectedBoundary.map((e) => e.stateId).toList(),
              countryId: selectedBoundary?.isNotEmpty == true ? selectedBoundary[0].countryId : null,
              languageSpecialtyIds: selectedLanguageSpeciality.map((e) => e.specializationId).toList(),
              proficiencyLevelId: selectedProficiency,
              minimumExperience: int.parse(_experienceController.text),
              minimumRatings: int.parse(_ratingsController.text),
              minimumReviews: _reviewsController.text,
            ),
          ),
        );
      }
    }
  }

  void moveBackTap() {
    addedPostJobVisibility.jobBoundary = selectedBoundary;
    addedPostJobVisibility.jobLanguageSpeciality = selectedLanguageSpeciality;
    addedPostJobVisibility.jobProficiency = selectedProficiency;
    addedPostJobVisibility.jobExperiences = _experienceController.text;
    addedPostJobVisibility.jobRatings = _ratingsController.text;
    addedPostJobVisibility.jobReviews = _reviewsController.text;
    widget.moveBackward(addedPostJobVisibility);
  }

  bool checkAllValidations() {
    return _jobVisibilityFormKey.currentState.validate();
  }

  /// Group of functions which are used for the code optimizations
  /// This includes the [setData], [fetchInitialData]
  void setData(PostJobVisibilityState postJobVisibilityState) {
    if (postJobVisibilityState?.jobVisibilityResponseModel?.data != null) {
      _experienceController.text =
          postJobVisibilityState?.jobVisibilityResponseModel?.data?.minimumExperience.toString();
      selectedProficiency =
          postJobVisibilityState?.jobVisibilityResponseModel?.data?.proficiencyLevel?.proficiencyLevelId;
      _ratingsController.text = postJobVisibilityState?.jobVisibilityResponseModel?.data?.minimumRatings.toString();
      _reviewsController.text = postJobVisibilityState?.jobVisibilityResponseModel?.data?.minimumReviews.toString();
      fetchInitialData(postJobVisibilityState?.jobVisibilityResponseModel?.data);
      if (_jobVisibilityFormKey?.currentState != null) {
        _jobVisibilityFormKey.currentState.fields[Constants.profileCountry].didChange(selectedBoundary);
        _jobVisibilityFormKey.currentState.fields[Constants.specializationsText].didChange(selectedLanguageSpeciality);
        _jobVisibilityFormKey.currentState.fields[Constants.proficiencyText].didChange(selectedProficiency);
      }
    }
  }

  void fetchInitialData(VisibilityData visibilityData) {
    List<SpecializationsData> tempSpecializationList = [];
    List<PostJobStatesData> tempStatesList = [];
    List<ProficiencyData> specializationIds = visibilityData.languageSpecialties;
    List<GeographicalBoundary> statesIds = visibilityData.geographicalBoundary;
    for (int i = 0; i < specializationIds.length; i++) {
      tempSpecializationList.add(store.state.postJobVisibilityState.specializationsResponseModel.data
          .firstWhere((element) => element.specializationId == specializationIds[i].specializationId));
    }
    for (int i = 0; i < statesIds.length; i++) {
      tempStatesList.add(store.state.postJobVisibilityState.jobStatesResponseModel.data
          .firstWhere((element) => element.stateId == statesIds[i].stateId));
    }
    selectedBoundary = tempStatesList;
    selectedLanguageSpeciality = tempSpecializationList;
  }
}

class JobVisibilityViewModel {
  final Store<AppState> store;
  final PostJobVisibilityState postJobVisibilityState;

  JobVisibilityViewModel(this.store, this.postJobVisibilityState);
}
