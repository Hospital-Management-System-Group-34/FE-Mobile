import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';

enum PatientByIdState { loading, loaded, error }

class PatientByIdProvider extends ChangeNotifier {
  PatientByIdState _state = PatientByIdState.loading;
  PatientByIdState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  PatientModelById? patientModelById;

  changeState(PatientByIdState s) {
    _state = s;
    notifyListeners();
  }

  Future getPatientById(String id) async {
    changeState(PatientByIdState.loading);
    patientModelById = null;
    try {
      patientModelById = await hospitalApi.getPatientById(id);
      notifyListeners();
      if (patientModelById?.code != 200) {
        changeState(PatientByIdState.error);
      } else {
        changeState(PatientByIdState.loaded);
      }
    } catch (e) {
      log(e.toString());
      changeState(PatientByIdState.error);
    }
  }
}
