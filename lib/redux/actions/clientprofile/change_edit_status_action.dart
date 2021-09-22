import 'package:khontext/utils/enums.dart';

/// Group of functions which gives the actions for the [ClientProfile].
/// This group contains [ChangeEditStatusAction] which takes in the queries and gives out the response as
/// either [ChangeEditStatusSuccessAction] or [ChangeEditStatusErrorAction].
class ChangeEditStatusAction {
  final ProfilePageEditStatus editStatus;

  ChangeEditStatusAction({this.editStatus});
}

class ChangeEditStatusErrorAction {
  final String error;

  ChangeEditStatusErrorAction({this.error});
}

class ChangeEditStatusSuccessAction {
  final ProfilePageEditStatus editStatus;

  ChangeEditStatusSuccessAction({this.editStatus});
}
