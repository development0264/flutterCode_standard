import 'package:flutter/material.dart';
import 'package:khontext/src/models/translator/translatoreducation/education_list_response_model.dart';
import 'package:khontext/src/models/translator/translatorexperience/experience_list_response_model.dart';
import 'package:khontext/src/models/translator/translatorlanguage/language_list_response.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatoreducation/education_dialog.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorexperience/experience_dialog.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorlanguage/language_dialog.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatorlanguage/translator_language_page.dart';

class TranslateDialog {
  void showTranslateExperienceDialog(BuildContext context,
      {bool isUpdate: false, ExperienceData dataModel, int index}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return ExperienceDialog(isUpdate: isUpdate, expModel: dataModel, index: index);
      },
    );
  }

  void showTranslateEducationDialog(BuildContext context,
      {bool isUpdate: false, EducationData dataModel, int index}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return EducationDialog(isUpdate: isUpdate, eduModel: dataModel, index: index);
      },
    );
  }

  void showTranslateLanguageDialog(BuildContext context,
      {bool isUpdate: false, PostJobLanguageViewModel vm, int index, LanguageListData ld}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (dialogContext) {
        return LanguageDialog(isUpdate: isUpdate, vm: vm, languageListData: ld);
      },
    );
  }
}
