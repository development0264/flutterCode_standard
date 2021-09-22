import 'package:flutter/material.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:toast/toast.dart';

/// [Class] [MultipleImagePicker] lets users pick multiple images, maximum 10 at a time.
/// Takes in the already selected images list and gives out the updated list.
class MultipleImagePicker {
  static Future<List<Asset>> pickMultiImages(
      List<Asset> selectedImages, BuildContext context) async {
    try {
      return await MultiImagePicker.pickImages(
        maxImages: 10,
        enableCamera: true,
        selectedAssets: selectedImages,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#40C4FF",
          actionBarTitle: FormBuilderLocalizations.of(context).pickImageText,
          allViewTitle: FormBuilderLocalizations.of(context).allPhotosText,
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
          lightStatusBar: true,
          startInAllView: true,
          statusBarColor: "#0F40C4FF",
        ),
      );
    } on Exception catch (e) {
      print("Error :=> ${e.toString()}");
      Toast.show('${e.toString()}', context);
      return [];
    }
  }
}
