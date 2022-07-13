import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/clinic_model.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';
import 'package:hospital_management_system/widgets/dialog_pasien.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget pasienCard(
    {required String nama,
    required String noRekamMedis,
    required String id,
    required BuildContext context}) {
  late PatientModelById patientModelById;
  late ClinicModel clinicModel;
  String poli = '-';
  final HospitalApi hospitalApi = HospitalApi();

  return Container(
    height: 153,
    width: 156,
    decoration: BoxDecoration(
      color: MyColors.white(),
      borderRadius: BorderRadius.circular(5.0),
      border: Border.all(color: MyColors.blue(), width: 1.3),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 15,
          left: 20,
          right: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              PoppinsText.grey2Medium('Nama Pasien', 12),
              PoppinsText.blueSemiBold(nama, 14),
              const SizedBox(
                height: 10,
              ),
              PoppinsText.grey2Medium('No. Rekam Medis', 12),
              PoppinsText.blueSemiBold(noRekamMedis, 14),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: ElevatedButton(
            onPressed: () async {
              patientModelById = await hospitalApi.getPatientById(id);
              clinicModel = await hospitalApi.getClinic();

              clinicModel.data?.forEach((element) {
                if (patientModelById.data!.sessions!.isNotEmpty) {
                  if (element.id ==
                      patientModelById.data?.sessions?.last.clinicID) {
                    poli = element.name.toString();
                  }
                }
              });

              if (patientModelById.code != 200) {
                showDialog(
                  context: context,
                  builder: (context) => const AlertDialog(
                    content: Center(
                      child: Text('Error'),
                    ),
                  ),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (context) => dialogPasien(
                      context: context,
                      nik: patientModelById.data!.nik.toString(),
                      noRekamMedis: noRekamMedis,
                      poli: poli,
                      nama: nama,
                      jenisKelamin: patientModelById.data!.gender.toString(),
                      handphone: patientModelById.data!.phone.toString(),
                      keluhan: patientModelById.data!.sessions!.isNotEmpty
                          ? patientModelById.data!.sessions!.last.complaint
                              .toString()
                          : '-'),
                );
              }
            },
            child: PoppinsText.whiteMedium('Lihat Detail Pasien', 10),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: MyColors.blue(),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ),
      ],
    ),
  );
}
