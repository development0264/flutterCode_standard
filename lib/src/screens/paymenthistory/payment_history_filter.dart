import 'package:flutter/material.dart';
import 'package:khontext/data.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_date_time_picker.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_dropdown.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_range_slider.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/src/khontext_widgets/localization/form_builder_localizations.dart';
import 'package:khontext/src/models/payment_history_filter_model.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class PaymentHistoryFilter extends StatefulWidget {
  final PaymentHistoryFilterModel model;
  final GlobalKey<FormBuilderState> formKey;
  final Function onCancelPress;
  final Function onSaveButtonPress;
  final Function onResetButtonPress;

  const PaymentHistoryFilter(
      {Key key, this.model, this.onCancelPress, this.onSaveButtonPress, this.onResetButtonPress, this.formKey})
      : super(key: key);

  @override
  _PaymentHistoryFilterState createState() => _PaymentHistoryFilterState();
}

class _PaymentHistoryFilterState extends State<PaymentHistoryFilter> {
  /// [bool] Flag for the save button which will give the state of the save button.
  bool isSaveEnabled = false;

  /// [String] which gives the value of different drop downs.
  String paymentStatus, amountStart, amountEnd;
  DateTime paidOnStart, paidOnEnd;

  /// Local model to redux.store and save.
  PaymentHistoryFilterModel currentModel = PaymentHistoryFilterModel();

  /// [TextEditingController] for the search of the posted jobs.
  final TextEditingController _startDateEditingController = TextEditingController();
  final TextEditingController _endDateEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setInitialValues();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        top: 15.0,
        bottom: 15.0,
        left: Utils.screenWidth * 0.05,
        right: Utils.screenWidth * 0.05,
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormBuilderDropdown<String>(
              name: Constants.paymentStatus,
              allowClear: false,
              initialValue: paymentStatus,
              onChanged: (val) => onPaymentStatusChanged(val),
              decoration: Styles.textInputDecoration(),
              hint: hintWidget(FormBuilderLocalizations.of(context).selectServiceTypeText),
              items: Data.paymentStatusData.map((option) {
                return DropdownMenuItem(
                  child: Text(option),
                  value: option,
                );
              }).toList(),
            ),
            const SizedBox(height: 15.0),
            FormBuilderDateTimePicker(
              name: Constants.paidOnStartDate,
              controller: _startDateEditingController,
              inputType: InputType.date,
              decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).paidOnStartText),
              initialTime: TimeOfDay(hour: 8, minute: 0),
              onChanged: (changed) => onStartDateChanged(changed),
            ),
            const SizedBox(height: 15.0),
            FormBuilderDateTimePicker(
              name: Constants.paidOnEndDate,
              controller: _endDateEditingController,
              inputType: InputType.date,
              decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).paidOnEndText),
              initialTime: TimeOfDay(hour: 8, minute: 0),
              onChanged: (endDate) => onEndDateChanged(endDate),
            ),
            const SizedBox(height: 15.0),
            FormBuilderRangeSlider(
              name: Constants.paymentAmountStart,
              onChanged: (_) => onAmountChanged(_),
              min: 0,
              max: 50000,
              initialValue: RangeValues(0, 5000),
              divisions: 10,
              activeColor: Palette.AppThemeColor,
              inactiveColor: Colors.white,
              decoration: InputDecoration(labelText: FormBuilderLocalizations.of(context).paymentAmountText),
            ),
            const SizedBox(height: 15.0),
            _actionButtons(),
          ],
        ),
      ),
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
            onPressed: widget.onCancelPress,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
              minWidth: Utils.screenWidth,
              backgroundColor: isSaveEnabled ? Palette.AppThemeColor : Palette.DisabledBorderColor,
              btnChild: FormBuilderText(
                message: FormBuilderLocalizations.of(context).filterText,
                textStyle: Styles.customTextStyle(textColor: Colors.white),
              ),
              onPressed: () {
                if (isSaveEnabled) {
                  widget.onSaveButtonPress(currentModel);
                }
              }),
        ),
      ],
    );
  }

  /// Simple text widget used for the hint used in the dropdowns
  Widget hintWidget(String hintText) {
    return FormBuilderText(message: hintText, textStyle: Styles.customTextStyle(textSize: 16.0));
  }

  /// Group of functions which are used for the changes.
  void onPaymentStatusChanged(String state) {
    setState(() {
      paymentStatus = state;
      currentModel.paymentStatus = state;
    });
    checkValueChange();
  }

  void onStartDateChanged(DateTime startDateChanged) {
    setState(() {
      paidOnStart = startDateChanged;
      currentModel.paidOnStart = startDateChanged;
    });
    checkValueChange();
  }

  void onEndDateChanged(DateTime endDateChanged) {
    setState(() {
      paidOnEnd = endDateChanged;
      currentModel.paidOnEnd = endDateChanged;
    });
    checkValueChange();
  }

  void onAmountChanged(RangeValues changedValues) {
    setState(() {
      amountStart = changedValues.start.toStringAsFixed(1);
      amountEnd = changedValues.end.toStringAsFixed(1);
      currentModel.amountStart = changedValues.start.toStringAsFixed(1);
      currentModel.amountEnd = changedValues.end.toStringAsFixed(1);
    });
    checkValueChange();
  }

  /// Function which is used to set the initial values of the controllers, also useful for resetting the values when
  /// user clicks cancel button.
  void setInitialValues() {
    if (widget.model == null) return;
    setState(() {
      paymentStatus = widget.model.paymentStatus;
      paidOnStart = widget.model.paidOnStart;
      paidOnEnd = widget.model.paidOnEnd;
      amountStart = widget.model.amountStart;
      amountEnd = widget.model.amountEnd;
    });
  }

  /// Function which will check if any of the value in [FormBuilderTextField] have been changed.
  /// Will be used for maintaining the disability of the save button.
  void checkValueChange() {
    bool tempSaveValue = false;
    if (paymentStatus != widget.model.paymentStatus ||
        paidOnStart != widget.model.paidOnStart ||
        paidOnEnd != widget.model.paidOnEnd ||
        amountStart != widget.model.amountStart ||
        amountEnd != widget.model.amountEnd) {
      tempSaveValue = true;
    }
    setState(() {
      isSaveEnabled = tempSaveValue;
    });
  }

  @override
  void dispose() {
    _startDateEditingController.dispose();
    _endDateEditingController.dispose();
    super.dispose();
  }
}
