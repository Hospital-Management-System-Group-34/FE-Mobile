import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/patient_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';

enum PatientState { loading, loaded, error, empty }

class PatientProvider extends ChangeNotifier {
  PatientState _state = PatientState.empty;
  PatientState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  PatientModel? patientModel;
  PatientModel? patientModelById;

  changeState(PatientState s) {
    _state = s;
    notifyListeners();
  }

  Future getPatient() async {
    changeState(PatientState.loading);
    try {
      patientModel = await hospitalApi.getPatient();
      notifyListeners();
      if (patientModel?.code != 200) {
        changeState(PatientState.error);
      } else {
        if (patientModel!.data!.isEmpty) {
          changeState(PatientState.empty);
        } else {
          changeState(PatientState.loaded);
        }
      }
    } catch (e) {
      log(e.toString());
      changeState(PatientState.error);
    }
  }
}
