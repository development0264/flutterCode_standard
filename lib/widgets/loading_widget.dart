import 'package:flutter/material.dart';
import 'package:khontext/utils/palette.dart';

/// This is the custom reusable widget for showing the loader on the screen.
class BaseLoadingWidget extends StatefulWidget {
  @override
  _BaseLoadingWidgetState createState() => _BaseLoadingWidgetState();
}

class _BaseLoadingWidgetState extends State<BaseLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Palette.AppThemeColor),
      ),
    );
  }
}
