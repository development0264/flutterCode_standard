import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

class ProfileHeader extends StatelessWidget {
  final String headerTitle;
  final bool showIcon;
  final Function onEditTap;

  const ProfileHeader({Key key, @required this.headerTitle, @required this.onEditTap, @required this.showIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FormBuilderText(
            message: headerTitle,
            textStyle: Styles.customTextStyle(textSize: 16.0),
          ),
          Visibility(
            visible: showIcon,
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () => onEditTap(),
              child: Image.asset(Constants.editIcon, height: Utils.screenWidth * 0.05, width: Utils.screenWidth * 0.05),
            ),
          )
        ],
      ),
    );
  }
}
