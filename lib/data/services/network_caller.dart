import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';

import '../../ui/state_manager/auth_controller.dart';
import '../models/request_model.dart';
import '../utils/urls.dart';

class NetworkCaller {
  NetworkCaller._();

  static Future<ResponseModel> getRequest({required String url}) async {
    try {
      final Response response = await get(
        Uri.parse(Urls.baseUrl + url),
        headers: {
          'Content-type': 'application/json',
          'Accept': 'application/json',
          'token' : AuthController.token.toString(),
        },
      );
      log(response.body);

      if (response.statusCode == 200) {
        return ResponseModel(
          statusCode: response.statusCode,
          isSuccess: true,
          returnData: jsonDecode(response.body),
        );
      } else {
        return ResponseModel(
          statusCode: response.statusCode,
          isSuccess: false,
          returnData: jsonDecode(response.body),
        );
      }

    } catch (e) {
      log(e.toString());
      return ResponseModel(
          statusCode: -1, isSuccess: false, returnData: e.toString());
    }
  }

}
