import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class PostJobBottomNavigation extends StatelessWidget {
  final Function moveAhead;
  final Function moveBackward;
  final bool backEnabled;
  final bool forwardEnabled;

  const PostJobBottomNavigation(
      {Key key, this.moveAhead, this.moveBackward, this.backEnabled: true, this.forwardEnabled: true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _commonButtonWidget(FormBuilderLocalizations.of(context).backText, moveBackward, backEnabled),
        _commonButtonWidget(FormBuilderLocalizations.of(context).continueText, moveAhead, forwardEnabled),
      ],
    );
  }

  Widget _commonButtonWidget(String buttonText, Function onTap, bool isEnabled) {
    return BaseButtonWidget(
      height: Utils.screenWidth * 0.1,
      backgroundColor: isEnabled ? Palette.AppThemeColor : Palette.DisabledBorderColor,
      onPressed: () => isEnabled ? onTap() : null,
      btnChild: FormBuilderText(
        message: buttonText,
        textStyle: Styles.customTextStyle(textColor: Colors.white),
      ),
    );
  }
}
