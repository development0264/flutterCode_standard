import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/utils/styles.dart';

class PaymentHeader extends StatelessWidget {
  final String headerTitle;
  final Widget headerWidget;

  const PaymentHeader({Key key, this.headerTitle, this.headerWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormBuilderText(
            message: headerTitle,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          headerWidget!=null ? headerWidget : SizedBox(),
        ],
      ),
    );
  }
}
