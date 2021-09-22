import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:khontext/utils/enums.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/widgets/done_popup_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class Utils {
  /// Screen size used for giving the size of a widget, this will be dynamic on the base of a device
  static double screenHeight = 0.0, screenWidth = 0.0;

  /// [SharedPreferences] object for using the preferences in the entire app.
  static SharedPreferences _prefs;

  static void initiatePreferences() async {
    _prefs = await SharedPreferences.getInstance();
  }

  /// [moveToHomePage] changes the screen and navigates to home screen
  static void moveToHomePage(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(RoutesConstants.homePage, (Route<dynamic> route) => false);
    });
  }

  /// Show toast is used to show the custom toast
  static void showToast({
    String message: '',
    @required BuildContext context,
  }) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Toast.show(
        message,
        context,
        textColor: Colors.white,
        backgroundColor: Colors.black,
        gravity: 0,
      );
    });
  }

  /// Function which takes the root context and set the screenHeight and screenWidth to use it in entire application
  /// This will be use for the re-usability
  static void setScreenSizes(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }

  /// Function which takes in the [dynamic] response and gives out the [bool] value which says if the user's
  /// profile data have been added or not on the base of the response.
  static bool isProfileDataAdded(dynamic response) {
    if (response == null ||
        !response.isSuccessful ||
        response.data == null ||
        response.message == 'NotFound') {
      return false;
    }
    return true;
  }

  /// Group of functions which handles the saving of the data to the [SharedPreferences].
  /// [setStringToPrefs] saves the [String] to preferences
  static void setStringToPrefs(String key, String value) async {
    await _prefs.setString(key, value);
  }

  /// [setIntToPrefs] saves the [int] to preferences
  static void setIntToPrefs(String key, int value) async {
    await _prefs.setInt(key, value);
  }

  /// [setBoolToPrefs] saves the [bool] to preferences
  static void setBoolToPrefs(String key, bool value) async {
    await _prefs.setBool(key, value);
  }

  /// Group of functions which handles the getting of the data from the [SharedPreferences].
  /// [getStringFromPrefs] get the [String] to preferences
  static String getStringFromPrefs(String key) {
    return _prefs.getString(key) ?? '';
  }

  /// [getIntFromPrefs] get the [int] to preferences
  static int getIntFromPrefs(String key) {
    return _prefs.getInt(key) ?? -1;
  }

  /// [getBoolFromPrefs] get the [bool] to preferences
  static bool getBoolFromPrefs(String key) {
    return _prefs.getBool(key) ?? false;
  }

  /// [removeKeyFromPrefs] will remove the single key from the preference
  static void removeKeyFromPrefs(String key) async {
    await _prefs.remove(key);
  }

  /// [clearPrefs] will remove all the data from the preference
  static void clearPrefs(String key) async {
    await _prefs.clear();
  }

  static Future<bool> checkPermissionAndRequest(Permission permission) async {
    var status = await permission.status;
    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {
      permission.request();
      return false;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    return false;
  }

  /// Function which will join the address fields and remove the empty address components out.
  String getSeparatedAddress(List<String> list) {
    List<String> tempAd = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i] != null && list[i].isNotEmpty) {
        tempAd.add(list[i]);
      }
    }
    return tempAd.join(', ');
  }

  /// Function which will take in the [DateTime] and return the formatted birthDay [String]
  static String getBirthDayString(DateTime dateOfBirth) {
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dateOfBirth);
    return formatted;
  }

  /// Widget function which gives the extra spacing for the entire application.
  /// This will take space from the ui and return [Widget].
  /// By default, [SPACE_TYPE.SMALL] size is returned.
  static Widget getVerticalSpacing(SPACE_TYPE spaceType) {
    switch (spaceType) {
      case SPACE_TYPE.SMALL:
        return SizedBox(height: Palette.smallSpace);
        break;
      case SPACE_TYPE.MEDIUM:
        return SizedBox(height: Palette.mediumSpace);
        break;
      case SPACE_TYPE.LARGE:
        return SizedBox(height: Palette.largeSpace);
        break;
      case SPACE_TYPE.EXTRA_LARGE:
        return SizedBox(height: Palette.extraLargeSpace);
        break;
      default:
        return SizedBox(height: Palette.smallSpace);
        break;
    }
  }

  /// [durationToString] will take in the [Duration] and give out [String] without the decimals.
  static String durationToString(Duration duration) {
    return duration.toString().split('.').first.padLeft(8, "0");
  }

  /// [openSuccessPopup] will open a common popup which will take in string.
  ///
  /// Acts like a informatory popup.
  static void openSuccessPopup(BuildContext context, String messageText) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return DonePopupWidget(context: dialogContext, messageText: messageText);
      },
    );
  }

  /// Group of functions which will help for the different type of navigation
  static void navigateTo(BuildContext context, String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamed(routeName);
    });
  }

  static void navigationWithArguments(BuildContext context, String routeName, Object arguments) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamed(routeName, arguments: arguments);
    });
  }

  static void navigateReplacement(BuildContext context, String routeName) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      try {
        Navigator.of(context).pushReplacementNamed(routeName);
      } catch (e) {
        print("Exception --> $e");
      }
    });
  }

  static void navigationReplacementWithArguments(
      BuildContext context, String routeName, Object arguments) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushReplacementNamed(routeName, arguments: arguments);
    });
  }

  static void navigationPushNamedAndRemoveUntil(
      BuildContext context, String routeName, String removeUntil) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.pushNamedAndRemoveUntil(context, routeName, ModalRoute.withName(removeUntil));
    });
  }

  /// Function which takes in the file length and gives the [String] size of the file in mb.
  static String getFileSize(File file) {
    try {
      int length = file.lengthSync();
      return ((length / 1024) / 1024).toStringAsFixed(2);
    } catch (e) {
      return '0';
    }
  }
}
