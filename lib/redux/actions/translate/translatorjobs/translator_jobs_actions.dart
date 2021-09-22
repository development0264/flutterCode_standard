import 'package:khontext/src/models/translator/translatorjobs/add_fav_job_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_request.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_response.dart';
import 'package:khontext/src/screens/translate/translate_page.dart';

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [TranslateJobsFetchAction] which takes in the queries and gives out the response as
/// either [TranslateJobsSuccessAction] or [TranslateJobsErrorAction].
class TranslateJobsFetchAction {
  final TranslatorJobsRequest translatorJobsRequest;

  TranslateJobsFetchAction({this.translatorJobsRequest});
}

class TranslateJobsErrorAction {
  final String error;

  TranslateJobsErrorAction({this.error});
}

class TranslateJobsSuccessAction {
  TranslatorJobsResponse translatorJobsResponse;

  TranslateJobsSuccessAction({this.translatorJobsResponse});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [FavoriteJobsFetchAction] which takes in the queries and gives out the response as
/// either [FavoriteJobsSuccessAction] or [FavoriteJobsErrorAction].
class FavoriteJobsFetchAction {
  final TranslatorFavJobsRequest translatorFavJobsRequest;

  FavoriteJobsFetchAction({this.translatorFavJobsRequest});
}

class FavoriteJobsErrorAction {
  final String error;

  FavoriteJobsErrorAction({this.error});
}

class FavoriteJobsSuccessAction {
  TranslatorFavJobsResponse translatorFavJobsResponse;

  FavoriteJobsSuccessAction({this.translatorFavJobsResponse});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [AddFavoriteJobsAction] which takes in [AddFavJobRequest] as request.
/// And calls the api for adding a favorite job.
class AddFavoriteJobsAction {
  final AddFavJobRequest addFavJobRequest;

  AddFavoriteJobsAction({this.addFavJobRequest});
}

/// Group of functions which gives the actions for the [TranslatePage].
/// This group contains [RemoveFavoriteJobsAction] which takes in [String] job id as request.
/// And calls the api for adding a favorite job.
class RemoveFavoriteJobsAction {
  final String jobId;

  RemoveFavoriteJobsAction({this.jobId});
}
