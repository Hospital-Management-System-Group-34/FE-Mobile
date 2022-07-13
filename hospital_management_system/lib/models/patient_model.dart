class PatientModel {
  int? code;
  String? status;
  List<Data>? data;

  PatientModel({this.code, this.status, this.data});

  PatientModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? nik;
  String? name;
  String? phone;
  String? gender;
  String? medicalRecord;
  String? createdAt;
  String? updatedAt;
  List<Sessions>? sessions;
  List<MedicalRecords>? medicalRecords;

  Data(
      {this.id,
      this.nik,
      this.name,
      this.phone,
      this.gender,
      this.medicalRecord,
      this.createdAt,
      this.updatedAt,
      this.sessions,
      this.medicalRecords});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nik = json['nik'];
    name = json['name'];
    phone = json['phone'];
    gender = json['gender'];
    medicalRecord = json['medicalRecord'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['sessions'] != null) {
      sessions = <Sessions>[];
      json['sessions'].forEach((v) {
        sessions!.add(Sessions.fromJson(v));
      });
    }
    if (json['medicalRecords'] != null) {
      medicalRecords = <MedicalRecords>[];
      json['medicalRecords'].forEach((v) {
        medicalRecords!.add(MedicalRecords.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nik'] = nik;
    data['name'] = name;
    data['phone'] = phone;
    data['gender'] = gender;
    data['medicalRecord'] = medicalRecord;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    if (sessions != null) {
      data['sessions'] = sessions!.map((v) => v.toJson()).toList();
    }
    if (medicalRecords != null) {
      data['medicalRecords'] = medicalRecords!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Sessions {
  String? id;
  String? patientID;
  String? clinicID;
  String? doctorID;
  String? scheduleID;
  String? complaint;
  int? queue;
  String? queueCode;
  String? status;
  String? date;
  String? createdAt;
  String? updatedAt;

  Sessions(
      {this.id,
      this.patientID,
      this.clinicID,
      this.doctorID,
      this.scheduleID,
      this.complaint,
      this.queue,
      this.queueCode,
      this.status,
      this.date,
      this.createdAt,
      this.updatedAt});

  Sessions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    patientID = json['patientID'];
    clinicID = json['clinicID'];
    doctorID = json['doctorID'];
    scheduleID = json['scheduleID'];
    complaint = json['complaint'];
    queue = json['queue'];
    queueCode = json['queueCode'];
    status = json['status'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['patientID'] = patientID;
    data['clinicID'] = clinicID;
    data['doctorID'] = doctorID;
    data['scheduleID'] = scheduleID;
    data['complaint'] = complaint;
    data['queue'] = queue;
    data['queueCode'] = queueCode;
    data['status'] = status;
    data['date'] = date;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}

class MedicalRecords {
  String? id;
  String? sessionID;
  String? patientMedicalRecord;
  String? type;
  String? history;
  String? diagnosis;
  String? height;
  String? weight;
  String? systole;
  String? diastole;
  String? temperature;
  String? status;
  String? createdAt;
  String? updatedAt;

  MedicalRecords(
      {this.id,
      this.sessionID,
      this.patientMedicalRecord,
      this.type,
      this.history,
      this.diagnosis,
      this.height,
      this.weight,
      this.systole,
      this.diastole,
      this.temperature,
      this.status,
      this.createdAt,
      this.updatedAt});

  MedicalRecords.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    sessionID = json['sessionID'];
    patientMedicalRecord = json['patientMedicalRecord'];
    type = json['type'];
    history = json['history'];
    diagnosis = json['diagnosis'];
    height = json['height'];
    weight = json['weight'];
    systole = json['systole'];
    diastole = json['diastole'];
    temperature = json['temperature'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['sessionID'] = sessionID;
    data['patientMedicalRecord'] = patientMedicalRecord;
    data['type'] = type;
    data['history'] = history;
    data['diagnosis'] = diagnosis;
    data['height'] = height;
    data['weight'] = weight;
    data['systole'] = systole;
    data['diastole'] = diastole;
    data['temperature'] = temperature;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
