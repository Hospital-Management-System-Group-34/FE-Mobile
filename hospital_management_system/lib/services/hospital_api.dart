import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:hospital_management_system/models/authentication_model.dart';
import 'package:hospital_management_system/models/clinic_model.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/models/patient_model.dart';
import 'package:hospital_management_system/models/session_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HospitalApi {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://shaggy-badger-99.a276.dcdg.xyz/';
  AuthModel? dataAuth;
  PatientModel? dataPatient;
  PatientModelById? dataPatientById;
  ClinicModel? dataClinic;
  SessionModel? dataSession;

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
        if (e.response!.statusCode == 503 || e.response!.statusCode == 500) {
          log(e.response.toString());
        } else {
          dataPatientById = PatientModelById.fromJson(e.response?.data);
          log(e.response?.data['message']);
        }
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
        if (e.response!.statusCode == 503 || e.response!.statusCode == 500) {
          log(e.response.toString());
        } else {
          dataClinic = ClinicModel.fromJson(e.response?.data);
          log(e.response?.data['message']);
        }
      } else {
        log(e.message);
      }
    }
    log('${dataClinic?.code}');
    return dataClinic;
  }

  Future getSession() async {
    dataSession = null;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.get(
        '${_baseUrl}sessions',
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
      );
      dataSession = SessionModel.fromJson(response.data);
    } on DioError catch (e) {
      if (e.response != null) {
        dataSession = SessionModel.fromJson(e.response?.data);
        log(e.response?.data['message']);
      } else {
        log(e.message);
      }
    }
    log('${dataSession?.code}');
    return dataSession;
  }

  Future<Response> activateSession(String sessionId) async {
    dynamic status;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.post(
        "${_baseUrl}sessions/$sessionId/activate",
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
      );
      status = response;
    } on DioError catch (e) {
      if (e.response != null) {
        status = e.response;
      } else {
        log(e.message);
      }
    }
    log('$status');
    return status;
  }

  Future<Response> completeSession(
      String sessionId,
      String anamnesa,
      String diagnosis,
      String alergiObat,
      String terapiObat,
      String tinggi,
      String berat,
      String sistol,
      String diastol,
      String suhu,
      String statusPulang) async {
    dynamic status;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.post(
        "${_baseUrl}sessions/$sessionId/complete",
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
        data: {
          "type": "Rawat Jalan",
          "history": anamnesa,
          "diagnosis": diagnosis,
          "drugAllergyHistory": alergiObat,
          "drugTherapy": terapiObat,
          "height": tinggi,
          "weight": berat,
          "systole": sistol,
          "diastole": diastol,
          "temperature": suhu,
          "status": statusPulang,
        },
      );
      status = response;
    } on DioError catch (e) {
      if (e.response != null) {
        status = e.response;
      } else {
        log(e.message);
      }
    }
    log('$status');
    return status;
  }

  Future<Response> cancelSession(String sessionId) async {
    dynamic status;
    try {
      var sp = await SharedPreferences.getInstance();
      final response = await _dio.post(
        "${_baseUrl}sessions/$sessionId/cancel",
        options: Options(
          headers: {'Authorization': 'Bearer ${sp.getString('accessToken')}'},
        ),
      );
      status = response;
    } on DioError catch (e) {
      if (e.response != null) {
        status = e.response;
      } else {
        log(e.message);
      }
    }
    log('$status');
    return status;
  }
}
