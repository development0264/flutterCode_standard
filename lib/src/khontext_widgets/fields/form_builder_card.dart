import 'package:flutter/material.dart';
import 'package:demo/utils/utils.dart';

/// [FormBuilderCard] will provide a base card view with the pre-added margins and padding.
/// Developer needs to pass the child widget and the tap function.
class FormBuilderCard extends StatefulWidget {
  final Widget child;
  final Function onCardTap;
  final Color shadowColor;
  final double horizontalPadding;
  final double verticalPadding;
  final double marginLeft;
  final double marginRight;

  const FormBuilderCard({
    Key key,
    this.onCardTap,
    this.child,
    this.shadowColor: Colors.black,
    this.horizontalPadding: 12.0,
    this.verticalPadding: 15.0,
    this.marginLeft,
    this.marginRight,
  }) : super(key: key);

  @override
  _FormBuilderCardState createState() => _FormBuilderCardState();
}

class _FormBuilderCardState extends State<FormBuilderCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onCardTap(),
      splashColor: Colors.transparent,
      child: Container(
        width: Utils.screenWidth,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0)),
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          shadowColor: widget.shadowColor,
          margin: cardMargin(),
          child: Padding(
            padding: cardPadding(),
            child: widget.child,
          ),
        ),
      ),
    );
  }

  /// Function which will give the common card margin used for each of the three main section cards.
  EdgeInsets cardMargin() {
    return EdgeInsets.only(
      left: widget.marginLeft ?? Utils.screenWidth * 0.05,
      right: widget.marginRight ?? Utils.screenWidth * 0.05,
      top: 5,
      bottom: 5,
    );
  }

  /// Function which will give the common card padding used for each of the three main section cards.
  EdgeInsets cardPadding() {
    return EdgeInsets.symmetric(
      horizontal: widget.horizontalPadding,
      vertical: widget.verticalPadding,
    );
  }
}
