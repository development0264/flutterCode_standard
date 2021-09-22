import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:khontext/utils/enums.dart';

class FlavorValues {
  final String baseUrl;

  FlavorValues({@required this.baseUrl});
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final Color color;
  final FlavorValues flavorValues;

  static FlavorConfig _instance;

  factory FlavorConfig({@required Flavor flavor, @required Color color, @required FlavorValues values}) {
    _instance ??= FlavorConfig._internal(flavor, describeEnum(flavor.toString()), color, values);
    return _instance;
  }

  FlavorConfig._internal(this.flavor, this.name, this.color, this.flavorValues);

  static FlavorConfig get instance {
    return _instance;
  }
}
