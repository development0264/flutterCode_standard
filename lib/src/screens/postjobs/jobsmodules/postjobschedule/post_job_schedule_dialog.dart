import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_date_time_picker.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/models/postjobs/jobschedule/job_schedule_response_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';
import 'package:toast/toast.dart';

// ignore: must_be_immutable
class PostJobScheduleDialog extends StatefulWidget {
  final Function currentSaved;
  final ScheduleDateTime editModel;

  PostJobScheduleDialog({Key key, this.currentSaved, this.editModel}) : super(key: key);

  @override
  _PostJobScheduleDialogState createState() => _PostJobScheduleDialogState();
}

class _PostJobScheduleDialogState extends State<PostJobScheduleDialog> {
  /// Global key used for maintaining the schedule form.
  final GlobalKey<FormState> scheduleFormKey = GlobalKey<FormState>();

  /// [DateTime] variables which will give the flexibility to get and set the date time.
  DateTime selectedStartDate;
  DateTime selectedEndDate;

  @override
  void initState() {
    super.initState();
    if (widget.editModel != null) {
      selectedStartDate = widget.editModel.fromDateTime;
      selectedEndDate = widget.editModel.toDateTime;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 3.0,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: SingleChildScrollView(
        child: Column(
          children: [
            scheduleForm(context),
          ],
        ),
      ),
    );
  }

  /// Widget function which gives the UI for the entire schedule page form.
  Widget scheduleForm(BuildContext context) {
    return FormBuilder(
      key: scheduleFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 15.0),
            Center(child: commonTextTitle(FormBuilderLocalizations.of(context).addScheduleText, textSize: 21)),
            const SizedBox(height: 15.0),
            commonTextTitle(FormBuilderLocalizations.of(context).startDateTimeText),
            const SizedBox(height: 8.0),
            FormBuilderDateTimePicker(
              name: Constants.startDatePicker,
              initialValue: selectedStartDate,
              inputType: InputType.both,
              onChanged: (newDateTime) => onStartDateChanged(newDateTime),
              decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).startDateTimeText),
              initialTime: selectedStartDate != null
                  ? TimeOfDay(hour: selectedStartDate.hour, minute: selectedStartDate.minute)
                  : null,
            ),
            const SizedBox(height: 15.0),
            commonTextTitle(FormBuilderLocalizations.of(context).endDateTimeText),
            const SizedBox(height: 8.0),
            FormBuilderDateTimePicker(
              name: Constants.endDatePicker,
              initialValue: selectedEndDate,
              inputType: InputType.both,
              onChanged: (newDateTime) => onEndDateChanged(newDateTime),
              decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).endDateTimeText),
              initialTime: selectedEndDate != null
                  ? TimeOfDay(hour: selectedEndDate.hour, minute: selectedEndDate.minute)
                  : null,
            ),
            const SizedBox(height: 15.0),
            _actionButtons(context),
          ],
        ),
      ),
    );
  }

  /// Widget function for the buttons of cancel/save when the user is in the edit mode.
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
            onPressed: () => cancelButtonClick(),
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
              message: widget.editModel != null
                  ? FormBuilderLocalizations.of(context).updateText
                  : FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () => saveButtonClick(),
          ),
        ),
      ],
    );
  }

  /// Widget function which gives the common text for the title.
  Widget commonTextTitle(String title, {double textSize: 16.0}) {
    return FormBuilderText(
      message: title,
      textStyle: Styles.customTextStyle(textSize: textSize),
    );
  }

  void onStartDateChanged(DateTime changedStartDate) {
    selectedStartDate = changedStartDate;
  }

  void onEndDateChanged(DateTime changedEndDate) {
    selectedEndDate = changedEndDate;
  }

  void cancelButtonClick() {
    scheduleFormKey?.currentState?.reset();
    Navigator.of(context).pop();
  }

  void saveButtonClick() {
    if (selectedStartDate.isAfter(DateTime.now()) && selectedEndDate.isAfter(selectedStartDate)) {
      widget.currentSaved(ScheduleDateTime(fromDateTime: selectedStartDate, toDateTime: selectedEndDate));
      scheduleFormKey?.currentState?.reset();
      Navigator.of(context).pop();
    } else {
      Toast.show(FormBuilderLocalizations.of(context).properDateText, context);
    }
  }
}
