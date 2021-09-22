import 'dart:io';

import 'package:flutter/material.dart';
import 'form_image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';
import 'package:khontext/widgets/button_widget.dart';

class FormImagePicker {
  static void pickFile(BuildContext context, {Function pickedFile}) {
    showModalBottomSheet(
      context: context,
      elevation: 10.0,
      isDismissible: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(Utils.screenWidth * 0.1),
          topRight: Radius.circular(Utils.screenWidth * 0.1),
        ),
      ),
      builder: (currentContext) {
        return bottomSheetData(
            onFileSelected: (PickedFile file) {
              pickedFile(file);
            },
            context: currentContext);
      },
      backgroundColor: Colors.grey[350],
    );
  }

  /// [static] Widget function which returns the bottom sheet to the user along with the options of the selection from
  /// [ImageSource.camera] and [ImageSource.gallery].
  static Widget bottomSheetData({Function onFileSelected, BuildContext context}) {
    ImagePicker _imagePicker = ImagePicker();
    return SizedBox(
      width: Utils.screenWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15.0),
          FormBuilderText(
            message: FormBuilderLocalizations.of(context).selectTypeText,
            textStyle: Styles.customTextStyle(textSize: 18.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 15.0),
          pickButton(ImagePickTypes.CAMERA, FormBuilderLocalizations.of(context).cameraText, onTap: () async {
            Navigator.of(context).pop();
            PickedFile file = await _imagePicker.getImage(source: ImageSource.camera, imageQuality: 100);
            File croppedFile = await ImageCropperFile.imageCrop(context,file: file);
            if (croppedFile != null) {
              onFileSelected(file);
            }
          }),
          const SizedBox(height: 15.0),
          pickButton(ImagePickTypes.GALLERY, FormBuilderLocalizations.of(context).galleryText, onTap: () async {
            Navigator.of(context).pop();
            PickedFile file = await _imagePicker.getImage(source: ImageSource.gallery, imageQuality: 100);
            File croppedFile = await ImageCropperFile.imageCrop(context,file: file);
            if (croppedFile != null) {
              onFileSelected(file);
            }
            // onFileSelected(file);
          }),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }

  /// [static] Widget function which will give the common button for the two types.
  /// [ImagePickTypes] will be passed and onTap event will be as a callback function.
  static Widget pickButton(ImagePickTypes type, String title, {Function onTap}) {
    return BaseButtonWidget(
      minWidth: Utils.screenWidth * 0.7,
      backgroundColor: type == ImagePickTypes.CAMERA ? Colors.white : Palette.AppThemeColor,
      onPressed: () => onTap(),
      btnChild: FormBuilderText(
        message: title,
        textStyle: Styles.customTextStyle(
          textSize: 16.0,
          textColor: type == ImagePickTypes.CAMERA ? Colors.black : Colors.white,
        ),
      ),
    );
  }
}
