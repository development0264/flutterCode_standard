import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:khontext/redux/actions/translate/translatoreducation/translator_education_actions.dart';
import 'package:khontext/redux/app_state.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/translator/translatoreducation/add_update_edu_request_model.dart';
import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';
import 'package:khontext/src/models/translator_education_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class EducationDialog extends StatefulWidget {
  final bool isUpdate;
  final EducationData eduModel;
  final int index;

  const EducationDialog({Key key, this.isUpdate, this.eduModel, this.index}) : super(key: key);

  @override
  _EducationDialogState createState() => _EducationDialogState();
}

class _EducationDialogState extends State<EducationDialog> {
  /// Global key used for maintaining the card form.
  final GlobalKey<FormBuilderState> educationFormDialog = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire add address form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _schoolController = TextEditingController();
  final TextEditingController _degreeController = TextEditingController();
  final TextEditingController _fieldOfStudyController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();
  final TextEditingController _activitiesController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  DateTime fromDate, toDate;

  /// Current model for the [TranslatorEducationModel] to store the local data and then save the data at the end.
  EducationData currentModel = EducationData.initial();

  @override
  void initState() {
    super.initState();
    if (widget.eduModel != null) {
      _schoolController.text = widget.eduModel.schoolName;
      _degreeController.text = widget.eduModel.degree;
      _fieldOfStudyController.text = widget.eduModel.fieldOfStudy;
      _gradeController.text = widget.eduModel.grade;
      _activitiesController.text = widget.eduModel.activitiesAndSocieties;
      _descriptionController.text = widget.eduModel.description;
      fromDate = widget.eduModel.startMonthAndYearDate;
      toDate = widget.eduModel.endMonthAndYearDate;
      currentModel = widget.eduModel;
    }
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
                  ? FormBuilderLocalizations.of(context).updateEducationText
                  : FormBuilderLocalizations.of(context).addEducationText,
              textStyle: Styles.customTextStyle(fontWeight: FontWeight.w500, textSize: 18.0),
            ),
            const SizedBox(height: 15.0),
            educationForm(),
          ],
        ),
      ),
    );
  }

  /// Widget function which provides the education form. The data of the form will be pre-filled on the base of the
  /// update event.
  Widget educationForm() {
    return FormBuilder(
      key: educationFormDialog,
      child: Column(
        children: [
          FormBuilderTextField(
            name: Constants.school,
            controller: _schoolController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.schoolName = text,
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).schoolText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).schoolErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.degree,
            controller: _degreeController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.degree = text,
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).degreeText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).degreeErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.fieldOfStudy,
            controller: _fieldOfStudyController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.fieldOfStudy = text,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).fieldOfStudyText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).fieldOfStudyErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderDateTimePicker(
            name: Constants.from,
            initialValue: fromDate,
            inputType: InputType.date,
            onChanged: (newDateTime) => currentModel.startMonthAndYearDate = newDateTime,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).fromErrorText),
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).fromText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderDateTimePicker(
            name: Constants.to,
            initialValue: toDate,
            inputType: InputType.date,
            onChanged: (newDateTime) => currentModel.endMonthAndYearDate = newDateTime,
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).toErrorText),
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).toText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.grade,
            controller: _gradeController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.grade = text,
            decoration:
                Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).gradeText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).gradeErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.activities,
            controller: _activitiesController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.activitiesAndSocieties = text,
            decoration: Styles.textInputDecoration(
                hint: FormBuilderLocalizations.of(context).activitiesText),
            validator: FormBuilderValidators.required(context,
                errorText: FormBuilderLocalizations.of(context).activitiesErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.descriptionText,
            controller: _descriptionController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            onChanged: (text) => currentModel.description = text,
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
              if (educationFormDialog.currentState.validate()) {
                educationEvent();
                Navigator.of(context).pop();
              }
            },
          ),
        ),
      ],
    );
  }

  /// Function which will either add or update the education model.
  void educationEvent({int index}) {
    var store = StoreProvider.of<AppState>(context, listen: false);
    String userId = Utils.getStringFromPrefs(Constants.userToken);
    store.dispatch(
      AddUpdateEducationAction(
        model: AddUpdateEducationRequestModel(
          educationId: widget.eduModel != null ? widget.eduModel.educationId : '',
          userId: userId,
          schoolName: currentModel.schoolName,
          degree: currentModel.degree,
          fieldOfStudy: currentModel.fieldOfStudy,
          startMonthAndYearDate: currentModel.startMonthAndYearDate,
          endMonthAndYearDate: currentModel.endMonthAndYearDate,
          grade: currentModel.grade,
          activitiesAndSocieties: currentModel.activitiesAndSocieties,
          description: currentModel.description,
        ),
      ),
    );
  }
}
