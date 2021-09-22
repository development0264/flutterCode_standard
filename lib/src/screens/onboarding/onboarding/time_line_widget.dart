import 'package:flutter/material.dart';
import 'package:khontext/utils/palette.dart';

class TimeLineWidget extends StatelessWidget {
  final int ticks;

  TimeLineWidget({Key key, @required this.ticks}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        this.ticks == 0 ? tick(true) : tick(false),
        lineWidget(),
        this.ticks == 1 ? tick(true) : tick(false),
        lineWidget(),
        this.ticks == 2 ? tick(true) : tick(false),
        lineWidget(),
        this.ticks == 3 ? tick(true) : tick(false),
        lineWidget(),
        this.ticks == 4 ? tick(true) : tick(false),
      ],
    );
  }

  /// Widget function which gives the ui
  Widget tick(bool isChecked) {
    return isChecked
        ? Card(
            elevation: 10,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 10,
              height: 10,
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(shape: BoxShape.circle, color: Palette.TextColor),
            ),
          )
        : Card(
            elevation: 0,
            margin: EdgeInsets.all(0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Container(
              width: 15,
              height: 15,
              decoration: BoxDecoration(
                border: Border.all(color: Palette.LightGrayColor, width: 2),
                shape: BoxShape.circle,
              ),
            ),
          );
  }

  /// Widget function which gives the ui for the connecting lines
  Widget lineWidget() {
    return Expanded(child: Container(color: Palette.LightGrayColor, height: 2.0));
  }
}
