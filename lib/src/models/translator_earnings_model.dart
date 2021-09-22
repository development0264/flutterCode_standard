import 'package:khontext/src/models/translator_contracts_model.dart';

class TranslatorEarningsModel {
  final String description;
  final String amount;
  final String commission;
  final TranslatorContractsModel contractsModel;
  final DateTime paidOutDate;

  TranslatorEarningsModel({this.description, this.amount, this.commission, this.contractsModel, this.paidOutDate});

  factory TranslatorEarningsModel.initial() {
    return TranslatorEarningsModel(
      description: '',
      amount: '',
      commission: '',
      contractsModel: TranslatorContractsModel.initial(),
      paidOutDate: DateTime.now(),
    );
  }
}
