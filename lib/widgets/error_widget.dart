import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';

class ErrorTextWidget extends StatelessWidget {
  final String error;

  const ErrorTextWidget({Key key, @required this.error}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormBuilderText(
        message: error,
      ),
    );
  }
}
