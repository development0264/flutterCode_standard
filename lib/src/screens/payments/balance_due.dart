import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';

class BalanceDueSection extends StatefulWidget {
  final onPayNowTap;

  const BalanceDueSection({Key key, this.onPayNowTap}) : super(key: key);

  @override
  _BalanceDueSectionState createState() => _BalanceDueSectionState();
}

class _BalanceDueSectionState extends State<BalanceDueSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(),
        const SizedBox(height: 10.0),
        Row(
          children: [
            Expanded(
              child: FormBuilderText(
                message: 'Your balance due is \$5.00',
                textStyle: Styles.customTextStyle(textSize: 16.0),
              ),
            ),
            InkWell(
              onTap: () => widget.onPayNowTap(),
              splashColor: Colors.transparent,
              child: FormBuilderText(
                message: FormBuilderLocalizations.of(context).payNowText,
                textStyle: Styles.customTextStyle(textSize: 16.0, textColor: Palette.AppThemeColor),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
