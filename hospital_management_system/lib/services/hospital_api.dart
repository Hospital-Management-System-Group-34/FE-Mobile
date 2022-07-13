import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/authentication_model.dart';
import 'package:hospital_management_system/models/clinic_model.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/models/patient_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HospitalApi {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://18.143.63.202:9000/';
  AuthModel? dataAuth;
  PatientModel? dataPatient;
  PatientModelById? dataPatientById;
  ClinicModel? dataClinic;

  Future login(String id, String password) async {
    dataAuth = null;
    try {
      final response = await _dio.post(
        "${_baseUrl}login",
        data: {
          "id": id,
          "password": password,
        },
      );
      dataAuth = AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataAuth = AuthModel.fromJson(e.response?.data);
      } else {
        log(e.message);
      }
    }
    log('${dataAuth?.code}');
    return dataAuth;
  }

  Future logout() async {
    dataAuth = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.post(
        "${_baseUrl}logout",
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
        data: {
          "refreshToken": sp.getString('refreshToken'),
        },
      );
      dataAuth = AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataAuth = AuthModel.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataAuth?.code}');
    return dataAuth;
  }

  Future refreshAccessToken() async {
    dataAuth = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.put(
        "${_baseUrl}authentications",
        data: {
          "refreshToken": sp.getString('refreshToken'),
        },
      );
      dataAuth = AuthModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataAuth = AuthModel.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataAuth?.code}');
    return dataAuth;
  }

  Future getPatient() async {
    dataPatient = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.get(
        '${_baseUrl}patients',
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
      );
      dataPatient = PatientModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataPatient = PatientModel.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataPatient?.code}');
    return dataPatient;
  }

  Future getPatientById(String id) async {
    dataPatientById = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.get(
        '${_baseUrl}patients/$id',
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
      );
      dataPatientById = PatientModelById.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataPatientById = PatientModelById.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataPatientById?.code}');
    return dataPatientById;
  }

  Future getClinic() async {
    dataClinic = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.get(
        '${_baseUrl}clinics',
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
      );
      dataClinic = ClinicModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataClinic = ClinicModel.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataClinic?.code}');
    return dataClinic;
  }
}
