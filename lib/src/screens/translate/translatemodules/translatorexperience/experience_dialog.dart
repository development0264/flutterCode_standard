import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatorexperience/translator_experience_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator/translatorexperience/add_update_exp_request_model.dart';
import 'package:khontext/src/models/onboarding/onboardingexperience/employment_type_response.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:redux/redux.dart';

class ExperienceDialog extends StatefulWidget {
  final bool isUpdate;
  final ExperienceData expModel;
  final int index;

  const ExperienceDialog({Key key, this.isUpdate, this.expModel, this.index}) : super(key: key);

  @override
  _ExperienceDialogState createState() => _ExperienceDialogState();
}

class _ExperienceDialogState extends State<ExperienceDialog> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormBuilderState> experienceFormDialog = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire add address form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  /// Variables to store the data for the dropdown, dates, currentWorking.
  String selectedEmploymentType;
  DateTime fromDate, toDate;
  bool isCurrentlyWorking = false;

  /// Current model for the [TranslatorExperienceModel] to store the local data and then save the data at the end.
  ExperienceData currentModel = ExperienceData.initial();

  /// Store instance to use further
  Store<AppState> store;

  List<EmploymentTypeData> employmentList = [];

  @override
  void initState() {
    super.initState();
    if (widget.expModel != null) {
      _companyController.text = widget.expModel.company;
      _locationController.text = widget.expModel.location;
      _descriptionController.text = widget.expModel.description;
      selectedEmploymentType = widget.expModel.employmentTypeId;
      isCurrentlyWorking = widget.expModel.isCurrentWorkingHere;
      fromDate = widget.expModel.fromDate;
      toDate = widget.expModel.toDate;
      currentModel = widget.expModel;
    }
    store = StoreProvider.of<AppState>(context, listen: false);
    employmentList = store.state?.translateExperienceState?.employmentTypeResponseModel?.data;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: SingleChildScrollView(
        padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0),
        child: Column(
          children: [
            FormBuilderText(
              message: widget.isUpdate
                  ? FormBuilderLocalizations.of(context).updateExperienceText
                  : FormBuilderLocalizations.of(context).addExperienceText,
              textStyle: Styles.customTextStyle(fontWeight: FontWeight.w500, textSize: 18.0),
            ),
            const SizedBox(height: 15.0),
            experienceForm(),
          ],
        ),
      ),
    );
  }

  /// Widget function which provides the experience form. The data of the form will be prefilled on the base of the
  /// update event.
  Widget experienceForm() {
    return FormBuilder(
      key: experienceFormDialog,
      child: Column(
        children: [
          FormBuilderDropdown<String>(
            name: Constants.employmentType,
            allowClear: false,
            initialValue: selectedEmploymentType,
            hint: FormBuilderText(
              message: FormBuilderLocalizations.of(context).employmentTypeText,
              textStyle:
                  Styles.customTextStyle(textSize: 15.0, textColor: Palette.DisabledBorderColor),
            ),
            onChanged: (val) => currentModel.employmentTypeId = val,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).employmentTypeErrorText),
            decoration: Styles.textInputDecoration(),
            items: employmentList
                .map((state) =>
                    _commonDropDownItem(value: state.employmentTypeId, message: state.name))
                .toList(),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.company,
            controller: _companyController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.company = text,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).companyTitleText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).companyNameErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.location,
            controller: _locationController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.location = text,
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).locationText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).locationErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderDateTimePicker(
            name: Constants.from,
            initialValue: fromDate,
            inputType: InputType.date,
            onChanged: (newDateTime) => currentModel.fromDate = newDateTime,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).fromErrorText),
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).fromText),
          ),
          FormBuilderCheckbox(
            name: Constants.currentlyWorking,
            decoration:
                Styles.textInputDecoration(isBorder: false, contentPadding: EdgeInsets.zero),
            initialValue: isCurrentlyWorking,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            contentPadding: EdgeInsets.zero,
            onChanged: (isWorking) {
              currentModel.isCurrentWorkingHere = isWorking;
              setState(() {
                isCurrentlyWorking = isWorking;
              });
            },
            title: FormBuilderText(
              message: FormBuilderLocalizations.of(context).currentlyWorkingText,
              textStyle:
                  Styles.customTextStyle(textSize: 15.0, textColor: Palette.DisabledBorderColor),
            ),
          ),
          if (!isCurrentlyWorking) ...[
            FormBuilderDateTimePicker(
              name: Constants.to,
              initialValue: toDate,
              inputType: InputType.date,
              onChanged: (newDateTime) => currentModel.toDate = newDateTime,
              validator: FormBuilderValidators.required(context,
                  errorText: FormBuilderLocalizations.of(context).toErrorText),
              decoration:
                  Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).toText),
            ),
          ],
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.descriptionText,
            controller: _descriptionController,
            textInputAction: TextInputAction.done,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.description = text,
            maxLines: 3,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).descriptionText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).descEmptyErrorText),
          ),
          const SizedBox(height: 15.0),
          _actionButtons(context),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }

  /// Widget function for the buttons of cancel/save/update when the user is in the edit mode.
  Widget _actionButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            backgroundColor: Colors.white,
            btnChild: FormBuilderText(
                message: FormBuilderLocalizations.of(context).cancelText,
                textStyle: Styles.customTextStyle(textColor: Palette.AppThemeColor)),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
              message: widget.isUpdate
                  ? FormBuilderLocalizations.of(context).updateText
                  : FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () {
              if (experienceFormDialog.currentState.validate()) {
                experienceEvent();
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
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

  /// Function which will either add or update the experience model.
  void experienceEvent({int index}) {
    var store = StoreProvider.of<AppState>(context, listen: false);
    String userId = Utils.getStringFromPrefs(Constants.userToken);
    store.dispatch(
      AddUpdateExperienceAction(
        model: AddUpdateExperienceRequestModel(
          experienceId: widget.expModel != null ? widget.expModel.experienceId : '',
          company: currentModel.company,
          location: currentModel.location,
          fromDate: currentModel.fromDate,
          toDate: currentModel.toDate,
          isCurrentWorkingHere: currentModel.isCurrentWorkingHere,
          description: currentModel.description,
          employmentTypeId: currentModel.employmentTypeId,
          userId: userId,
        ),
      ),
    );
  }
}
