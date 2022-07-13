import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:hospital_management_system/models/authentication_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';

enum LoginState {
  standby,
  processing,
  error,
  success,
}

enum LogoutState {
  standby,
  processing,
  error,
  success,
}

class LoginProvider extends ChangeNotifier {
  LoginState _state = LoginState.standby;
  LoginState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  AuthModel? loginModel;

  changeState(LoginState s) {
    _state = s;
    notifyListeners();
  }

  Future login(String id, String password) async {
    changeState(LoginState.processing);
    try {
      loginModel = await hospitalApi.login(id, password);
      notifyListeners();
      if (loginModel?.code != 200) {
        changeState(LoginState.error);
      } else {
        changeState(LoginState.success);
      }
    } catch (e) {
      log(e.toString());
      changeState(LoginState.error);
    }
  }
}

class LogoutProvider extends ChangeNotifier {
  LogoutState _state = LogoutState.standby;
  LogoutState get state => _state;
  final HospitalApi hospitalApi = HospitalApi();
  AuthModel? logoutModel;

  changeState(LogoutState s) {
    _state = s;
    notifyListeners();
  }

  Future logout() async {
    changeState(LogoutState.processing);
    try {
      logoutModel = await hospitalApi.logout();
      notifyListeners();
      if (logoutModel?.code != 200) {
        changeState(LogoutState.error);
      } else {
        changeState(LogoutState.success);
      }
    } catch (e) {
      log(e.toString());
      changeState(LogoutState.error);
    }
  }
}
