import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

class ResendTimerWidget extends StatefulWidget {
  final Function resendClicked;

  const ResendTimerWidget({Key key, this.resendClicked}) : super(key: key);

  @override
  _ResendTimerWidgetState createState() => _ResendTimerWidgetState();
}

class _ResendTimerWidgetState extends State<ResendTimerWidget> {
  /// Variable used for showing the timer left for resending the code.
  int timerLeft = 60;

  /// [GestureRecognizer] is the recognizer for the click event of the resend button.
  GestureRecognizer _resendClick;

  @override
  void initState() {
    super.initState();
    _startTimer();

    _resendClick = new TapGestureRecognizer()..onTap = _onResendCodeClicked;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: FormBuilderLocalizations.of(context).didNotReceivedCodeText,
          style: Styles.customTextStyle(
            textSize: Palette.smallFontSize,
            textColor: Palette.AppThemeColor,
          ),
          children: [
            TextSpan(
              text: '  ',
              style: Styles.customTextStyle(
                textSize: Palette.smallFontSize,
                textColor: Palette.AppThemeColor,
              ),
            ),
            TextSpan(
              text:
                  '${timerLeft < 60 ? '${FormBuilderLocalizations.of(context).resendCodeText} ${Utils.durationToString(Duration(seconds: timerLeft))}' : FormBuilderLocalizations.of(context).resendCodeText}',
              recognizer: _resendClick,
              style: Styles.customTextStyle(
                textSize: Palette.smallFontSize,
                textColor: Palette.DarkTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Function which starts the timer for the resend code
  void _startTimer() {
    setState(() {
      timerLeft -= 1;
      if (timerLeft > 0) {
        Future.delayed(Duration(seconds: 1), () {
          if (mounted) {
            _startTimer();
          }
        });
      } else {
        timerLeft = 60;
      }
    });
  }

  /// Function which gives the resend code click event
  void _onResendCodeClicked() {
    if (timerLeft == 60) {
      _startTimer();
      widget.resendClicked();
    }
  }
}
