import 'dart:async';
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scaper_mobile/network/models/request/auth_request.dart';
import 'package:scaper_mobile/network/models/response/auth_response.dart';
import 'package:scaper_mobile/network/models/response/no_content_response.dart';

import 'base_provider.dart';
import 'endpoints.dart';

class ApiProvider extends BaseProviderWithRefreshTokenManagement {
  final String _baseApiPath = dotenv.env['BASE_URL']!;
  GetStorage box = GetStorage();

  Future<NoContentResponse> callRegisterApi(AuthRequest body) async {
    dynamic endpoint = '$_baseApiPath${Endpoints.register}';
    dynamic requestBody = json.encode(body);
    final responseData =
        await makePostCall(Uri.parse(endpoint), requestBody, false);
    return NoContentResponse(responseData);
  }

  Future<AuthResponse> callLoginApi(AuthRequest body) async {
    dynamic endpoint = '$_baseApiPath${Endpoints.login}';
    dynamic requestBody = json.encode(body);
    final responseData =
        await makePostCall(Uri.parse(endpoint), requestBody, false);
    return AuthResponse(responseData);
  }
}
