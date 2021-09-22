import 'package:khontext/src/models/translator/translatorearnings/bank_account_source_request.dart';
import 'package:khontext/utils/enums.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [BankAccountSourceFetchAction] which will call the api for
/// fetching bank source.
class BankAccountSourceFetchAction {
  final USERTYPE usertype;
  final BankAccountSourceRequest bankAccountSourceRequest;

  BankAccountSourceFetchAction({this.bankAccountSourceRequest, this.usertype});
}
