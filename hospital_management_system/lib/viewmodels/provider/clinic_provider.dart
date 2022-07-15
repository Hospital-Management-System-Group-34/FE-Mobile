import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/clinic_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';

enum ClinicState { loading, loaded, error, empty }

class ClinicProvider extends ChangeNotifier {
  ClinicState _state = ClinicState.empty;
  ClinicState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  ClinicModel? clinicModel;

  changeState(ClinicState s) {
    _state = s;
    notifyListeners();
  }

  Future getClinic() async {
    changeState(ClinicState.loading);
    try {
      clinicModel = await hospitalApi.getClinic();
      notifyListeners();
      if (clinicModel?.code != 200) {
        changeState(ClinicState.error);
      } else {
        if (clinicModel!.data!.isEmpty) {
          changeState(ClinicState.empty);
        } else {
          changeState(ClinicState.loaded);
        }
      }
    } catch (e) {
      log(e.toString());
      changeState(ClinicState.error);
    }
  }
}
