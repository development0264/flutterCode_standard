import 'package:khontext/src/models/payment_history_model.dart';
import 'package:khontext/src/screens/paymenthistory/payment_history.dart';
import 'package:meta/meta.dart';

/// Group of functions which gives the actions for the [PaymentHistory].
/// This group contains [PaymentHistoryFetchAction] which takes in the queries and gives out the response as
/// either [PaymentHistorySuccessAction] or [PaymentHistoryErrorAction].
class PaymentHistoryFetchAction {
  final int limit;
  final String startingAfter;

  PaymentHistoryFetchAction({@required this.limit, @required this.startingAfter});
}

class PaymentHistoryErrorAction {
  final PaymentHistoryError error;

  PaymentHistoryErrorAction({@required this.error});
}

class PaymentHistorySuccessAction {
  final PaymentHistoryModel paymentHistoryModel;

  PaymentHistorySuccessAction({@required this.paymentHistoryModel});
}
