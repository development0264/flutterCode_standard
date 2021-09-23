import 'package:flutter/material.dart';
import 'package:demo/utils/palette.dart';

/// This is the custom reusable widget for the [MaterialButton]
/// It takes a widget child to show within it and gives the recall function for the on press.
class BaseButtonWidget extends StatefulWidget {
  final Function onPressed;
  final Widget btnChild;
  final double minWidth;
  final double height;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;
  final double padding;

  const BaseButtonWidget(
      {Key key,
      this.onPressed,
      this.btnChild,
      this.minWidth,
      this.backgroundColor: Palette.AppThemeColor,
      this.borderColor: Palette.AppThemeColor,
      this.height,
      this.borderRadius: 5.0,
      this.padding: 15.0})
      : super(key: key);

  @override
  _BaseButtonWidgetState createState() => _BaseButtonWidgetState();
}

class _BaseButtonWidgetState extends State<BaseButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: widget.onPressed,
      child: widget.btnChild,
      elevation: 0,
      height: widget.height,
      minWidth: widget.minWidth,
      padding: EdgeInsets.all(widget.padding),
      color: widget.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        side: BorderSide(color: widget.borderColor),
      ),
    );
  }
}
