import 'dart:async';

import 'package:scaper_mobile/network/api/api_provider.dart';
import 'package:scaper_mobile/network/models/request/auth_request.dart';
import 'package:scaper_mobile/network/models/response/auth_response.dart';
import 'package:scaper_mobile/network/models/response/no_content_response.dart';

class ScaperRepository {
  ApiProvider appApiProvider;

  ScaperRepository({required this.appApiProvider});

  Future<NoContentResponse> register(AuthRequest body) async =>
      appApiProvider.callRegisterApi(body);

  Future<AuthResponse> login(AuthRequest body) async =>
      appApiProvider.callLoginApi(body);
}
