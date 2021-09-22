import 'package:flutter/material.dart';

class FormBuilderScrollView extends StatelessWidget {
  /// The [bool] value which gives the notification glow disallow.
  ///
  /// Normally a [false] by default.
  final bool disallowGlow;

  /// The [Widget] which gives the child to be used in the scrollview
  final Widget child;

  const FormBuilderScrollView({Key key, this.disallowGlow: false, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (OverscrollIndicatorNotification overscroll) {
        overscroll.disallowGlow();
        return;
      },
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}
