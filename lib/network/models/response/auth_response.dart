import 'package:scaper_mobile/network/models/platform_user/platform_user.dart';

import 'base_response.dart';

class AuthResponse extends CustomBaseResponse {
  AuthResponse(super.responseData);

  late String token;
  late PlatformUser user;

  @override
  parseResponseData() {
    try {
      token = getResponseBody()?['token'] ?? '';
      user = PlatformUser.fromJson(getResponseBody()?['user'] ?? {});
    } catch (e) {
      handleParsingError(e);
    }
  }
}
