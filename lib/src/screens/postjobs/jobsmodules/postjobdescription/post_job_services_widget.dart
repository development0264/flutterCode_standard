import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/postjobs/post_job_description_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/redux/states/postjobs/post_job_description_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_radio_group.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_description_response_model.dart';
import 'package:khontext/src/models/postjobs/jobdescription/job_services_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/widgets/error_widget.dart';
import 'package:khontext/widgets/loading_widget.dart';
import 'package:redux/redux.dart';

class PostJobServicesWidget extends StatefulWidget {
  final Function selectedData;

  const PostJobServicesWidget({Key key, this.selectedData}) : super(key: key);

  @override
  _PostJobServicesWidgetState createState() => _PostJobServicesWidgetState();
}

class _PostJobServicesWidgetState extends State<PostJobServicesWidget> {
  /// Variables used for the selected data types.
  String serviceTypeId;
  List<dynamic> servicesId;

  /// [FocusNode] used for the radiobuttons and the checkbox
  FocusNode radioNode = FocusNode();
  FocusNode checkBoxNode = FocusNode();

  List<JobServicesData> servicesTypeList = [];

  JobServicesData selectedServiceType;
  JobDescriptionData jobDescriptionData;

  /// Store instance to use further
  Store<AppState> store;

  @override
  void initState() {
    super.initState();
    store = StoreProvider.of<AppState>(context, listen: false);
    JobDescriptionData jobDescriptionData = store.state.postJobDescriptionState?.postJobDescriptionResponseModel?.data;
    if (jobDescriptionData?.serviceType?.serviceTypeId?.isNotEmpty == true) {
      serviceTypeId = jobDescriptionData.serviceType.serviceTypeId;
      servicesId = jobDescriptionData.serviceType.services;
    }
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, JobDescriptionViewModel>(
      converter: (store) => JobDescriptionViewModel(store, store.state.postJobDescriptionState),
      builder: (context, vm) {
        if (showLoader(vm)) {
          return BaseLoadingWidget();
        } else if (errorShow(vm).isNotEmpty) {
          return ErrorTextWidget(
              error: errorShow(vm) != null ? errorShow(vm) : FormBuilderLocalizations.of(context).dataLoadText);
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderText(
                message: FormBuilderLocalizations.of(context).serviceText,
                textStyle: Styles.customTextStyle(textSize: 16.0)),
            serviceWidget(),
            const SizedBox(height: 15.0),
            if (selectedServiceType?.services?.isNotEmpty ?? false) ...[
              FormBuilderText(message: selectedServiceType.name, textStyle: Styles.customTextStyle(textSize: 16.0)),
              interpretationWidget(),
            ],
          ],
        );
      },
    );
  }

  /// Widget function which provides the service radio group.
  Widget serviceWidget() {
    JobServicesData servicesData = servicesTypeList.firstWhere(
        (element) => element.serviceTypeId == jobDescriptionData?.serviceType?.serviceTypeId,
        orElse: () => null);
    String name = servicesData != null ? servicesData.name : null;
    return FormBuilderRadioGroup(
      name: Constants.serviceRadioText,
      decoration: Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
      initialValue: name,
      focusNode: radioNode,
      onChanged: (types) => serviceChanged(types),
      validator: FormBuilderValidators.required(context,
          errorText: FormBuilderLocalizations.of(context).selectServiceErrorText),
      options: servicesTypeList.map((e) => commonFormFieldOption(value: e)).toList(),
    );
  }

  /// Widget function which provides the interpretation checkbox group.
  Widget interpretationWidget() {
    List<String> initialValue = [];
    List<JobServicesData> job = [];
    if (jobDescriptionData?.serviceType?.services?.isNotEmpty == true) {
      for (int i = 0; i < jobDescriptionData.serviceType.services.length; i++) {
        job.add(selectedServiceType.services
            .firstWhere((element) => jobDescriptionData.serviceType.services[i].serviceId == element.serviceId));
      }
    }
    job.map((e) => initialValue.add(e.name)).toList();
    return FormBuilderCheckboxGroup(
      name: Constants.interpretationsText,
      focusNode: checkBoxNode,
      decoration: Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
      initialValue: initialValue,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      options: selectedServiceType.services.map((e) => commonFormFieldOption(value: e)).toList(),
      onChanged: (selectedInterValue) => interpretationSet(selectedInterValue),
    );
  }

  /// [FormBuilderFieldOption] which creates the common function for this field.
  FormBuilderFieldOption commonFormFieldOption({JobServicesData value}) {
    return FormBuilderFieldOption(
      value: value.name,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: FormBuilderText(
          message: value.code,
          textStyle: Styles.customTextStyle(textSize: 16.0),
        ),
      ),
    );
  }

  /// Group of functions which takes place when the state changes happens.
  /// This includes [serviceChanged], [interpretationSet]
  void serviceChanged(String types) {
    JobServicesData servicesData = servicesTypeList.firstWhere((element) => element.name == types);
    setState(() {
      selectedServiceType = servicesData;
      widget.selectedData(selectedServiceType.serviceTypeId, []);
    });
  }

  void interpretationSet(List<dynamic> interValues) {
    List<dynamic> selectedServiceList = [];
    selectedServiceType.services.map((e) {
      if (interValues.contains(e.name)) {
        selectedServiceList.add(e);
      }
    }).toList();
    widget.selectedData(selectedServiceType.serviceTypeId, selectedServiceList);
  }

  /// Function which takes in the [JobDescriptionViewModel] and provides the [String] error
  String errorShow(JobDescriptionViewModel vm) {
    if (vm.postJobDescriptionState != null && vm.postJobDescriptionState.error.isNotEmpty) {
      return vm.postJobDescriptionState.error;
    } else if (vm.postJobDescriptionState != null &&
        vm.postJobDescriptionState.jobServicesResponseModel != null &&
        vm.postJobDescriptionState.jobServicesResponseModel.data == null) {
      return FormBuilderLocalizations.of(context).serviceFetchErrorText;
    }

    servicesTypeList = vm.postJobDescriptionState.jobServicesResponseModel.data;
    jobDescriptionData = vm.postJobDescriptionState.postJobDescriptionResponseModel.data;
    if (selectedServiceType == null) {
      selectedServiceType = servicesTypeList.firstWhere(
          (element) => element.serviceTypeId == jobDescriptionData?.serviceType?.serviceTypeId,
          orElse: () => selectedServiceType);
    }

    return '';
  }

  /// Function which takes in the [JobDescriptionViewModel] and provides the [bool] which will show if the loader is
  /// active or not.
  bool showLoader(JobDescriptionViewModel vm) {
    if (vm.postJobDescriptionState.isLoading &&
        (vm.postJobDescriptionState.currentAction == JobServicesFetchAction ||
            vm.postJobDescriptionState.currentAction == JobDescriptionFetchAction)) {
      return true;
    }
    return false;
  }
}

class JobDescriptionViewModel {
  final Store<AppState> store;
  final PostJobDescriptionState postJobDescriptionState;

  JobDescriptionViewModel(this.store, this.postJobDescriptionState);
}
