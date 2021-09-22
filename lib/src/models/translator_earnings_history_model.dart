import 'package:khontext/src/models/translator_contracts_model.dart';

class TranslatorEarningsHistoryModel {
  final String title;
  final String description;
  final String paymentBy;
  final String amount;
  final String commission;
  final String amountPaid;
  final TranslatorContractsModel contractsModel;
  final DateTime transactionDate;
  final DateTime paidOutDate;

  TranslatorEarningsHistoryModel(
      {this.title,
      this.description,
      this.amount,
      this.commission,
      this.contractsModel,
      this.transactionDate,
      this.paidOutDate,
      this.paymentBy,
      this.amountPaid});

  factory TranslatorEarningsHistoryModel.initial() {
    return TranslatorEarningsHistoryModel(
      description: '',
      amount: '',
      commission: '',
      contractsModel: TranslatorContractsModel.initial(),
      paidOutDate: DateTime.now(),
      transactionDate: DateTime.now(),
      amountPaid: '',
      paymentBy: '',
      title: '',
    );
  }
}
