import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/session_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';

enum SessionState {
  empty,
  loading,
  loaded,
  error,
}

class SessionProvider extends ChangeNotifier {
  SessionState _state = SessionState.empty;
  SessionState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  SessionModel? sessionModel;

  changeState(SessionState s) {
    _state = s;
    notifyListeners();
  }

  Future getSession() async {
    changeState(SessionState.loading);
    try {
      sessionModel = await hospitalApi.getSession();
      notifyListeners();
      if (sessionModel?.code != 200) {
        changeState(SessionState.error);
      } else {
        if (sessionModel!.data!.isEmpty) {
          changeState(SessionState.empty);
        } else {
          changeState(SessionState.loaded);
        }
      }
    } catch (e) {
      log(e.toString());
      changeState(SessionState.error);
    }
  }
}
