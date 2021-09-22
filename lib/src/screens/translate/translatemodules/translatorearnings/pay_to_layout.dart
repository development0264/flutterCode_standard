import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class PayToLayout extends StatefulWidget {
  @override
  _PayToLayoutState createState() => _PayToLayoutState();
}

class _PayToLayoutState extends State<PayToLayout> {
  /// Global key for maintaining the state of the form.
  final _payToFormKey = GlobalKey<FormBuilderState>();

  /// [TextEditingController] for the entire billing method details form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _payToController = TextEditingController();
  final TextEditingController _contactNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _payToFormKey,
      child: _commonCardWidget(
        children: [
          FormBuilderTextField(
            name: Constants.payTo,
            controller: _payToController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).payToText),
            validator:
                FormBuilderValidators.required(context, errorText: FormBuilderLocalizations.of(context).payToErrorText),
          ),
          const SizedBox(height: 15.0),
          FormBuilderTextField(
            name: Constants.signUpEmail,
            controller: _contactNumberController,
            textInputAction: TextInputAction.next,
            keyboardType: TextInputType.text,
            decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).emailHintText),
            validator:
                FormBuilderValidators.required(context, errorText: FormBuilderLocalizations.of(context).emailErrorText),
          ),
          const SizedBox(height: 15.0),
          _actionButtons(context),
        ],
        onCardTap: () {},
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
            onPressed: () {},
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: BaseButtonWidget(
            minWidth: Utils.screenWidth,
            btnChild: FormBuilderText(
              message: FormBuilderLocalizations.of(context).saveText,
              textStyle: Styles.customTextStyle(textColor: Colors.white),
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  /// Widget function which will give the common card layout for each of the section
  Widget _commonCardWidget({List<Widget> children, Function onCardTap}) {
    return FormBuilderCard(
      onCardTap: () => onCardTap(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
