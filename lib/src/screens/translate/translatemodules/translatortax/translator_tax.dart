import 'package:flutter/material.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatortax/translator_tax_form.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatortax/translator_tax_residence.dart';
import 'package:khontext/src/screens/translate/translatemodules/translatortax/translator_w9_form.dart';

class TranslatorTaxPage extends StatefulWidget {
  const TranslatorTaxPage({Key key}) : super(key: key);

  @override
  _TranslatorTaxPageState createState() => _TranslatorTaxPageState();
}

class _TranslatorTaxPageState extends State<TranslatorTaxPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 15.0),
          TranslatorTaxResidence(),
          const SizedBox(height: 15.0),
          TranslatorW9Form(),
          const SizedBox(height: 15.0),
          TaxForm(),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
