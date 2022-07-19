class DoctorModel {
  int? code;
  String? status;
  Data? data;

  DoctorModel({this.code, this.status, this.data});

  DoctorModel.fromJson(Map<String, dynamic> json) {
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
  User? user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  String? id;
  String? name;
  String? speciality;
  String? phone;
  String? role;
  String? license;
  String? address;
  String? birthPlace;
  String? birthDate;
  String? religion;
  String? avatar;
  String? clinicID;
  String? createdAt;
  String? updatedAt;
  Clinic? clinic;
  List<Schedules>? schedules;

  User(
      {this.id,
      this.name,
      this.speciality,
      this.phone,
      this.role,
      this.license,
      this.address,
      this.birthPlace,
      this.birthDate,
      this.religion,
      this.avatar,
      this.clinicID,
      this.createdAt,
      this.updatedAt,
      this.clinic,
      this.schedules});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    speciality = json['speciality'];
    phone = json['phone'];
    role = json['role'];
    license = json['license'];
    address = json['address'];
    birthPlace = json['birthPlace'];
    birthDate = json['birthDate'];
    religion = json['religion'];
    avatar = json['avatar'];
    clinicID = json['clinicID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
    if (json['schedules'] != null) {
      schedules = <Schedules>[];
      json['schedules'].forEach((v) {
        schedules!.add(Schedules.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['speciality'] = speciality;
    data['phone'] = phone;
    data['role'] = role;
    data['license'] = license;
    data['address'] = address;
    data['birthPlace'] = birthPlace;
    data['birthDate'] = birthDate;
    data['religion'] = religion;
    data['avatar'] = avatar;
    data['clinicID'] = clinicID;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    if (schedules != null) {
      data['schedules'] = schedules!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clinic {
  String? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  String? doctors;

  Clinic({this.id, this.name, this.createdAt, this.updatedAt, this.doctors});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    doctors = json['doctors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['doctors'] = doctors;
    return data;
  }
}

class Schedules {
  String? id;
  String? dayID;
  String? userID;
  String? createdAt;
  String? updatedAt;
  Day? day;
  Time? time;

  Schedules(
      {this.id,
      this.dayID,
      this.userID,
      this.createdAt,
      this.updatedAt,
      this.day,
      this.time});

  Schedules.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dayID = json['dayID'];
    userID = json['userID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    time = json['time'] != null ? Time.fromJson(json['time']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dayID'] = dayID;
    data['userID'] = userID;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (day != null) {
      data['day'] = day!.toJson();
    }
    if (time != null) {
      data['time'] = time!.toJson();
    }
    return data;
  }
}

class Day {
  String? id;
  String? name;
  int? order;
  String? createdAt;
  String? updatedAt;

  Day({this.id, this.name, this.order, this.createdAt, this.updatedAt});

  Day.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    order = json['order'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['order'] = order;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class Time {
  String? iD;
  String? start;
  String? end;
  String? scheduleID;
  String? createdAt;
  String? updatedAt;

  Time(
      {this.iD,
      this.start,
      this.end,
      this.scheduleID,
      this.createdAt,
      this.updatedAt});

  Time.fromJson(Map<String, dynamic> json) {
    iD = json['ID'];
    start = json['start'];
    end = json['end'];
    scheduleID = json['scheduleID'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ID'] = iD;
    data['start'] = start;
    data['end'] = end;
    data['scheduleID'] = scheduleID;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
