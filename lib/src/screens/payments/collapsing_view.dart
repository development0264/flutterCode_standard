import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';

class CollapsingView extends StatefulWidget {
  final String titleMessage;
  final Widget child;
  final bool isEdit;
  final Function update;
  final Function delete;

  const CollapsingView(
      {Key key, @required this.titleMessage, @required this.child, this.isEdit, this.update, this.delete})
      : super(key: key);

  @override
  _CollapsingViewState createState() => _CollapsingViewState();
}

class _CollapsingViewState extends State<CollapsingView> {
  /// [bool] which is use to set the state of the collapse.
  bool isCollapsed = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(border: Border.all(width: 1, color: Palette.AppThemeColor)),
      child: Column(
        children: [
          headerWidget(),
          collapsedChild(),
        ],
      ),
    );
  }

  /// Widget function which gives the header of the collapsing view
  Widget headerWidget() {
    return InkWell(
      onTap: () => toggleCollapseState(),
      splashColor: Colors.transparent,
      child: Container(
        color: Palette.HeaderBgColor,
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          children: [
            Expanded(
              child: FormBuilderText(
                message: widget.titleMessage,
                textStyle: Styles.customTextStyle(textSize: 16.0),
              ),
            ),
            Icon(Icons.keyboard_arrow_down, color: Palette.AppThemeColor, size: 21.0),
            editWidget(),
          ],
        ),
      ),
    );
  }

  /// Widget which gives the functionality to edit the current item.
  Widget editWidget() {
    return widget.isEdit
        ? Column(
            children: [
              const SizedBox(width: 8.0),
              PopupMenuButton(
                  onSelected: (selectedValue) {
                    if (selectedValue == PaymentEditMenu.EDIT) {
                      widget.update();
                    } else if (selectedValue == PaymentEditMenu.DELETE) {
                      widget.delete();
                    }
                  },
                  itemBuilder: (context) => [
                        PopupMenuItem(
                          value: PaymentEditMenu.EDIT,
                          child: FormBuilderText(message: FormBuilderLocalizations.of(context).editText),
                        ),
                        PopupMenuItem(
                          value: PaymentEditMenu.DELETE,
                          child: FormBuilderText(message: FormBuilderLocalizations.of(context).deleteText),
                        ),
                      ]),
            ],
          )
        : SizedBox();
  }

  /// Widget function which gives the collapsed child of the collapsing view
  Widget collapsedChild() {
    return isCollapsed
        ? SizedBox()
        : Column(
            children: [
              const SizedBox(height: 15.0),
              widget.child,
            ],
          );
  }

  /// Function used to change the collapse state.
  void toggleCollapseState() {
    setState(() {
      isCollapsed = !isCollapsed;
    });
  }
}
