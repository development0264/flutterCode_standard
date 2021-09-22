import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/payment_history_model.dart';

/// Class which will help calling the apis for the [PaymentHistory].
class PaymentHistoryApiCalls {
  const PaymentHistoryApiCalls();

  /// [getPaymentHistory] will take in the [limit] and [startingAfter]. If the [startingAfter] is empty or null
  /// then the api is called likewise and will return the [PaymentHistoryModel].
  Future<PaymentHistoryModel> getPaymentHistory(int limit, String startingAfter) async {
    var response;
    if (startingAfter == null || startingAfter.isEmpty) {
      response = await ApiProvider.getAsync("https://api.stripe.com/v1/balance_transactions?limit=$limit",
          headersNew: {'Authorization': 'Bearer sk_test_4eC39HqLyjWDarjtT1zdp7dc'});
    } else {
      response = await ApiProvider.getAsync(
          "https://api.stripe.com/v1/balance_transactions?limit=$limit&starting_after=$startingAfter",
          headersNew: {'Authorization': 'Bearer sk_test_4eC39HqLyjWDarjtT1zdp7dc'});
    }

    PaymentHistoryModel model = paymentHistoryModelFromJson(response.body.toString());
    return model;
  }
}
