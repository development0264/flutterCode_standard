import 'package:flutter/material.dart';
import 'package:khontext/data.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_card.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_text.dart';
import 'package:khontext/src/khontext_widgets/fields/form_builder_typeahead.dart';
import 'package:khontext/src/khontext_widgets/flutter_form_builder.dart';
import 'package:khontext/utils/constants.dart';
import 'package:khontext/utils/palette.dart';
import 'package:khontext/utils/routes_constants.dart';
import 'package:khontext/utils/styles.dart';
import 'package:khontext/utils/utils.dart';

class RequestTranslatorPage extends StatefulWidget {
  @override
  _RequestTranslatorPageState createState() => _RequestTranslatorPageState();
}

class _RequestTranslatorPageState extends State<RequestTranslatorPage> {
  /// [TextEditingController] for the entire post job description form.
  /// These [TextEditingController] will give the current state of a text field.
  final TextEditingController _sourceLanguageController = TextEditingController();
  final TextEditingController _destinationLanguageController = TextEditingController();

  List<String> searchedCountries = Data.languageList.getRange(0, 4).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Utils.screenWidth * 0.05, vertical: Utils.screenHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [_requestTranslatorHeader(), const SizedBox(height: 12.0), languageListWidget()],
          ),
        ),
      ),
    );
  }

  /// Widget function which gives the header for the translator page, it includes the source and
  /// destination search languages.
  Widget _requestTranslatorHeader() {
    _sourceLanguageController.text = Utils.getStringFromPrefs(Constants.savedSourceLanguage) ?? '';
    return Column(
      children: [
        FormBuilderTypeAhead<String>(
          name: Constants.sourceLanguageText,
          selectionToTextTransformer: (sourceLanguage) => sourceLanguage,
          itemBuilder: (context, item) => singleSuggestionsItem(item),
          controller: _sourceLanguageController,
          hideSuggestionsOnKeyboardHide: false,
          decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).sourceLanguageText),
          onSuggestionSelected: (suggestions) => onSuggestionsClicked(suggestions),
          suggestionsCallback: (query) => onSuggestionsCallback(query),
        ),
        const SizedBox(height: 12.0),
        FormBuilderTextField(
          name: Constants.destinationLanguageText,
          controller: _destinationLanguageController,
          textInputAction: TextInputAction.next,
          decoration: Styles.textInputDecoration(hint: FormBuilderLocalizations.of(context).destinationLanguageText),
          onChanged: (searchQuery) => onDestinationLanguageSearched(searchQuery),
        ),
      ],
    );
  }

  /// Language list widget.
  Widget languageListWidget() {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: searchedCountries.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _singleLanguageItem(searchedCountries[index]);
      },
    );
  }

  /// Single item for the language
  Widget _singleLanguageItem(String language) {
    return FormBuilderCard(
      shadowColor: Palette.AppThemeColor,
      horizontalPadding: 0,
      verticalPadding: 0,
      marginLeft: 5,
      marginRight: 5,
      onCardTap: () => Navigator.of(context).pushNamed(RoutesConstants.translatorListPage, arguments: {
        RoutesConstantsArguments.translatorLanguage: language,
      }),
      child: Center(
        child: FormBuilderText(
          message: language,
        ),
      ),
    );
  }

  /// Widget function which gives the single suggestions item.
  Widget singleSuggestionsItem(String suggestionsText) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Icon(Icons.language_outlined, color: Palette.DisabledBorderColor, size: 21.0),
          const SizedBox(width: 8.0),
          Expanded(
            child: FormBuilderText(
              message: suggestionsText,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }

  List<String> onSuggestionsCallback(String query) {
    if (query.isNotEmpty) {
      var lowercaseQuery = query.toLowerCase();
      return Data.languageList.where((country) {
        return country.toLowerCase().contains(lowercaseQuery);
      }).toList(growable: false)
        ..sort((a, b) => a.toLowerCase().indexOf(lowercaseQuery).compareTo(b.toLowerCase().indexOf(lowercaseQuery)));
    } else {
      return Data.languageList;
    }
  }

  void onSuggestionsClicked(String suggestions) {
    Utils.setStringToPrefs(Constants.savedSourceLanguage, suggestions);
  }

  /// Group of functions which performs text input events
  void onDestinationLanguageSearched(String destSearch) {
    searchedCountries.clear();
    if (destSearch.isEmpty) {
      searchedCountries.addAll(Data.languageList.getRange(0, 4));
    } else {
      Data.languageList.map((e) {
        if (e.toLowerCase().contains(destSearch.toLowerCase())) {
          searchedCountries.add(e);
        }
      }).toList();
    }
    setState(() {
      //refresh
    });
  }
}
