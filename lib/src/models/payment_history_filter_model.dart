class PaymentHistoryFilterModel {
  DateTime paidOnStart;
  DateTime paidOnEnd;
  String amountStart;
  String amountEnd;
  String paymentStatus;
  String paymentSearch;

  PaymentHistoryFilterModel(
      {this.paidOnStart, this.paidOnEnd, this.amountStart, this.amountEnd, this.paymentStatus, this.paymentSearch});
}
