import 'package:khontext/src/models/translator/translatorjobs/translator_fav_jobs_response.dart';
import 'package:khontext/src/models/translator/translatorjobs/translator_jobs_response.dart';
import 'package:meta/meta.dart';

@immutable
class TranslateJobsState {
  final bool isLoading;
  final String error;
  final List<JobRecord> translateJobsList;
  final List<FavoriteJobsResponse> favoriteResponse;

  TranslateJobsState({
    @required this.isLoading,
    @required this.error,
    @required this.translateJobsList,
    @required this.favoriteResponse,
  });

  factory TranslateJobsState.initial() {
    return TranslateJobsState(
      isLoading: false,
      translateJobsList: [],
      favoriteResponse: [],
      error: '',
    );
  }

  TranslateJobsState copyWith({
    bool isLoading,
    List<JobRecord> translateJobsList,
    List<FavoriteJobsResponse> favoriteResponse,
    String error,
  }) {
    return TranslateJobsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      translateJobsList: translateJobsList ?? this.translateJobsList,
      favoriteResponse: favoriteResponse ?? this.favoriteResponse,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TranslateJobsState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          translateJobsList == other.translateJobsList &&
          favoriteResponse == other.favoriteResponse &&
          error == other.error;

  @override
  int get hashCode =>
      isLoading.hashCode ^ error.hashCode ^ translateJobsList.hashCode ^ favoriteResponse.hashCode;
}
