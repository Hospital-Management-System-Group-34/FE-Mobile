class SessionModel {
  int? code;
  String? status;
  List<Data>? data;

  SessionModel({this.code, this.status, this.data});

  SessionModel.fromJson(Map<String, dynamic> json) {
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
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
