import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/doctor_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';

enum DoctorState { loaded, error, empty }

class DoctorProvider extends ChangeNotifier {
  DoctorState _state = DoctorState.empty;
  DoctorState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  DoctorModel? doctorModel;

  changeState(DoctorState s) {
    _state = s;
    notifyListeners();
  }

  Future getDoctor(String userId) async {
    changeState(DoctorState.empty);
    try {
      doctorModel = await hospitalApi.getDoctor(userId);
      notifyListeners();
      if (doctorModel?.code != 200) {
        changeState(DoctorState.error);
      } else {
        changeState(DoctorState.loaded);
      }
    } catch (e) {
      log(e.toString());
      changeState(DoctorState.error);
    }
  }
}
