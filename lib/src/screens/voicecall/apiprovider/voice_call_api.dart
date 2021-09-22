import 'package:khontext/api/api_endpoints.dart';
import 'package:khontext/api/base_api_provider.dart';
import 'package:khontext/src/models/voicecall/call_token_response_model.dart';

class VoiceCallApiCalls {
  const VoiceCallApiCalls();

  /// [getVoiceCallToken] will take in the [userId] and will return the [CallTokenResponseModel].
  static Future<CallTokenResponseModel> getVoiceCallToken(String userId) async {
    var response = await ApiProvider.getAsync(ApiEndpoints.voiceCall + userId);
    CallTokenResponseModel responseModel;
    if (response != null) {
      responseModel = callTokenResponseModelFromJson(response.body.toString());
    }

    return responseModel;
  }
}
