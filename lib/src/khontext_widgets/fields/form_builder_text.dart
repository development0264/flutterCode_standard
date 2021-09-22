import 'package:flutter/material.dart';

class FormBuilderText extends StatelessWidget {
  /// The primary content of the [Text].
  ///
  /// Normally a empty string by default.
  final String message;

  /// The primary textStyle of the [Text]
  final TextStyle textStyle;

  /// The maximum number of line used for the [Text]
  ///
  /// By default, set to 3
  final int maxLines;

  /// Text alignment for the [Text]
  ///
  /// By default, set to [TextAlign.start]
  final TextAlign textAlign;

  const FormBuilderText(
      {Key key,
      this.message : '',
      this.textStyle,
      this.maxLines: 3,
      this.textAlign: TextAlign.start})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      message ?? '',
      style: textStyle,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
