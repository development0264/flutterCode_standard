import 'package:flutter/foundation.dart';
import 'package:khontext/src/models/translator_details_model.dart';
import 'package:khontext/src/models/voicecall/call_token_response_model.dart';
import 'package:meta/meta.dart';

@immutable
class VoiceCallState {
  final bool isLoading;
  final String error;
  final CallTokenResponseModel callToken;
  final TranslatorDetailsModel translatorDetailsModel;

  VoiceCallState({
    @required this.isLoading,
    @required this.error,
    @required this.callToken,
    @required this.translatorDetailsModel,
  });

  factory VoiceCallState.initial() {
    return VoiceCallState(isLoading: false, error: '', callToken: CallTokenResponseModel.initial(), translatorDetailsModel: null);
  }

  VoiceCallState copyWith({
    bool isLoading,
    String error,
    CallTokenResponseModel callStatus,
    TranslatorDetailsModel translatorDetailsModel,
  }) {
    return VoiceCallState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      callToken: callStatus ?? this.callToken,
      translatorDetailsModel: translatorDetailsModel ?? this.translatorDetailsModel,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VoiceCallState &&
          runtimeType == other.runtimeType &&
          isLoading == other.isLoading &&
          error == other.error &&
          callToken == other.callToken &&
          translatorDetailsModel == other.translatorDetailsModel;

  @override
  int get hashCode => isLoading.hashCode ^ error.hashCode ^ callToken.hashCode;
}
