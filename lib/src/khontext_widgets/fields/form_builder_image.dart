import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// Widget used for loading the network image using the url.
class FormBuilderImage extends StatelessWidget {
  /// Height and width of the image.
  final double height;
  final double width;

  /// Bool value which says about how the image will be rendered, like rounded or square.
  final bool rounded;

  /// String image url from where the image needs to be loaded.
  final String imageUrl;

  /// The image loading type, by default [BoxFit.cover] will be used.
  final BoxFit fit;

  /// The asset path for the placeholder of an image.
  final String placeHolderPath;

  /// When the user edits and picks image, at that time the local image file path will be stored in this.
  /// It the [localImagePath] is null by default but if it is not null, the image will be showed instead of the
  /// network image.
  final String localImagePath;

  /// When the image is already available and is in the [Base64] format, at that time the base 64 is converted to
  /// [Uint8List] and sent.
  final Uint8List imageBytes;

  const FormBuilderImage(
      {Key key,
      this.height: 50,
      this.width: 50,
      this.rounded: false,
      this.imageUrl: '',
      this.fit: BoxFit.cover,
      this.placeHolderPath: '',
      this.localImagePath,
      this.imageBytes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: ClipRRect(
        borderRadius: rounded ? BorderRadius.all(Radius.circular(width / 2)) : BorderRadius.zero,
        child: imageBytes != null
            ? Image.memory(imageBytes, height: height, width: width, fit: fit)
            : localImagePath != null
                ? Image.file(new File(localImagePath), height: height, width: width, fit: fit)
                : CachedNetworkImage(
                    height: height,
                    width: width,
                    fit: fit,
                    imageUrl: imageUrl,
                    placeholder: (context, _) => placeHolderWidget(),
                    errorWidget: (context, _, __) => placeHolderWidget(),
                  ),
      ),
    );
  }

  /// Common widget for the placeholder, if the image failed to load in any way.
  Widget placeHolderWidget() {
    return placeHolderPath?.isNotEmpty == true
        ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(placeHolderPath),
              ),
            ),
          )
        : SizedBox();
  }
}
