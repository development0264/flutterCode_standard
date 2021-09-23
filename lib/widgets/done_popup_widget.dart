import 'package:flutter/material.dart';
import 'package:demo/src/demo_widgets/fields/form_builder_text.dart';
import 'package:demo/utils/enums.dart';
import 'package:demo/utils/palette.dart';
import 'package:demo/utils/styles.dart';
import 'package:demo/utils/utils.dart';
import 'package:demo/widgets/button_widget.dart';

class DonePopupWidget extends StatelessWidget {
  final BuildContext context;
  final String messageText;

  const DonePopupWidget({Key key, this.context, this.messageText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: Utils.screenWidth * 0.9,
        padding: EdgeInsets.all(Palette.largeSpace),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Palette.WhiteColor),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            doneAvatarUi(),
            Utils.getVerticalSpacing(SPACE_TYPE.EXTRA_LARGE),
            FormBuilderText(
              message: messageText,
              textStyle: Styles.customTextStyle(
                textSize: Palette.largeFontSize,
                textColor: Palette.DarkTextColor,
              ),
            ),
            Utils.getVerticalSpacing(SPACE_TYPE.EXTRA_LARGE),
            okButtonUi(),
          ],
        ),
      ),
    );
  }

  /// Widget function which gives the ui for the done avatar
  Widget doneAvatarUi() {
    return CircleAvatar(
      radius: 50.0,
      child: Center(
        child: Icon(
          Icons.done,
          color: Palette.WhiteColor,
          size: 55.0,
        ),
      ),
      backgroundColor: Palette.AppThemeColor,
    );
  }

  /// Widget function which gives Ui for the button which texts ok.
  Widget okButtonUi() {
    return BaseButtonWidget(
      minWidth: Utils.screenWidth * 0.3,
      btnChild: FormBuilderText(
        message: 'OK',
        textStyle: Styles.customTextStyle(
          textColor: Colors.white,
        ),
      ),
      onPressed: () => onOkButtonClick(),
    );
  }

  /// Function which gives the functionalities like click events.
  void onOkButtonClick() {
    Navigator.of(context).popUntil((route) => route.isFirst);
  }
}
