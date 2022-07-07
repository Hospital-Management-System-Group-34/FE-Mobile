import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/authentication_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthApi {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://18.141.205.74:9000/';
  AuthModel? dataApi;

  Future login(String id, String password) async {
    dataApi = null;
    try {
      final response = await _dio.post("${_baseUrl}login", data: {
        "id": id,
        "password": password,
      });
      dataApi = AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataApi = AuthModel.fromJson(e.response?.data);
      } else {
        log(e.message);
      }
    }
    log('${dataApi?.code}');
    return dataApi;
  }

  Future logout() async {
    dataApi = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.post("${_baseUrl}logout",
          options: Options(headers: {
            'Authorization': 'Bearer ${sp.getString('accessToken')}'
          }),
          data: {
            "refreshToken": sp.getString('refreshToken'),
          });
      dataApi = AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataApi = AuthModel.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataApi?.code}');
    return dataApi;
  }
}
