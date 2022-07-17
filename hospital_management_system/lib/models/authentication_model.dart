class AuthModel {
  int? code;
  String? status;
  Data? data;

  AuthModel({this.code, this.status, this.data});

  AuthModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? accessToken;
  String? refreshToken;
  String? userName;

  Data({this.accessToken, this.refreshToken, this.userName});

  Data.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    data['userName'] = userName;
    return data;
  }
}
