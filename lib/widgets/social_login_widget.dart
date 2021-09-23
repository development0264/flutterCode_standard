import 'package:flutter/material.dart';
import 'package:demo/src/demo_widgets/flutter_form_builder.dart';
import 'package:demo/utils/assets.dart';
import 'package:demo/utils/enums.dart';
import 'package:demo/utils/palette.dart';
import 'package:demo/utils/styles.dart';
import 'package:demo/utils/utils.dart';

class SocialLoginWidget extends StatelessWidget {
  final BuildContext context;

  const SocialLoginWidget({Key key, this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(visible: false, child: _connectUsingLayout());
  }

  /// Widget function which gives the ui for the root connection layout
  Widget _connectUsingLayout() {
    return Column(
      children: [
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _connectSeparator(),
        Utils.getVerticalSpacing(SPACE_TYPE.LARGE),
        _connectAccountsUI(),
        Utils.getVerticalSpacing(SPACE_TYPE.SMALL),
      ],
    );
  }

  /// Widget function which gives the UI layout for the separator portion for the connect.
  Widget _connectSeparator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: Palette.smallSpace),
            height: 1,
            color: Palette.AppThemeColor,
          ),
        ),
        Text(
          FormBuilderLocalizations.of(context).orConnectUsingText,
          style: Styles.customTextStyle(textSize: Palette.smallFontSize),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: Palette.smallSpace),
            height: 1,
            color: Palette.AppThemeColor,
          ),
        ),
      ],
    );
  }

  /// Widget function which gives ui for the
  Widget _connectAccountsUI() {
    return Row(
      children: [
        Expanded(child: _singleConnectUsingButton(Assets.fbIcon, () => _fbButtonClick())),
        Expanded(child: _singleConnectUsingButton(Assets.twIcon, () => _twButtonClick())),
        Expanded(child: _singleConnectUsingButton(Assets.gPlusIcon, () => _gPlusButtonClick())),
        Expanded(child: _singleConnectUsingButton(Assets.lnIcon, () => _lnButtonClick())),
      ],
    );
  }

  /// Widget function which gives the ui for the single connector icon
  ///
  /// It takes in the [String] icon and gives out the click function [onItemClick].
  Widget _singleConnectUsingButton(String icon, Function onItemClick) {
    return InkWell(
      onTap: onItemClick,
      splashColor: Colors.transparent,
      child: Container(
        height: Palette.extraLargeSpace,
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: Colors.grey, width: 1.0),
        ),
        child: Image.asset(icon, scale: 3.5),
      ),
    );
  }

  /// Group of functions which gives the click events for particular buttons.
  void _fbButtonClick() {
    print("FB Clicked");
  }

  void _gPlusButtonClick() {
    print("Google Clicked");
  }

  void _lnButtonClick() {
    print("Linked in Clicked");
  }

  void _twButtonClick() {
    print("Twitter Clicked");
  }
}
