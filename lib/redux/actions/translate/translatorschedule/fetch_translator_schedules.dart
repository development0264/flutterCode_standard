import 'package:khontext/src/screens/translate/translate_page.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateScheduleFetchAction] which takes in the queries and gives out the response as
/// either [TranslateScheduleSuccessAction] or [TranslateScheduleErrorAction].
class TranslateScheduleFetchAction {
  final DateTime currentDate;

  TranslateScheduleFetchAction({this.currentDate});
}

class TranslateScheduleErrorAction {
  final String error;

  TranslateScheduleErrorAction({this.error});
}

class TranslateScheduleSuccessAction {
  Map<DateTime, List<dynamic>> translateScheduleList;

  TranslateScheduleSuccessAction({this.translateScheduleList});
}
