import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';

class AddModuleWidget extends StatelessWidget {
  final String moduleText;
  final Function onAddClick;

  const AddModuleWidget({Key key, @required this.moduleText, @required this.onAddClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onAddClick(),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Palette.AppThemeColor, width: 1)),
            child: Icon(Icons.add, color: Palette.AppThemeColor, size: 15.0),
          ),
          const SizedBox(width: 5.0),
          FormBuilderText(
            message: moduleText,
            textStyle: Styles.customTextStyle(textSize: 16.0, textColor: Palette.AppThemeColor),
          )
        ],
      ),
    );
  }
}
