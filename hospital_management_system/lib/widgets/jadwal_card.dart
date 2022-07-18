import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/services/hospital_api.dart';
import 'package:hospital_management_system/view/screens/hasil_sesi_screen.dart';
import 'package:hospital_management_system/view/screens/proses_pasien_screen.dart';
import 'package:hospital_management_system/viewmodels/provider/clinic_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/patient_by_id_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/session_provider.dart';
import 'package:hospital_management_system/widgets/dialog_pasien.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

Widget jadwalHomeCard(
    {required String nama,
    required String noRekamMedis,
    required String noAntrian,
    required String tanggal}) {
  return Container(
    height: 125,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 18,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('Nama Pasien', 12),
              SizedBox(
                width: 180,
                child: PoppinsText.whiteSemiBold(nama, 14),
              ),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('No. Rekam Medis', 12),
              SizedBox(
                width: 82,
                child: PoppinsText.whiteSemiBold(noRekamMedis, 14),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 18,
          left: 18,
          right: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: antrian(noAntrian)),
              const SizedBox(
                width: 15,
              ),
              Flexible(flex: 2, child: jadwal(tanggal)),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget jadwalAkanDatangCard({
  required BuildContext context,
  required String patientId,
  required String sessionId,
  required String nama,
  required String noRekamMedis,
  required String antri,
  required String tanggal,
}) {
  return Container(
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Stack(
      children: [
        Positioned(
          top: 18,
          left: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('Nama Pasien', 12),
              SizedBox(
                width: 180,
                child: PoppinsText.whiteSemiBold(nama, 14),
              ),
            ],
          ),
        ),
        Positioned(
          top: 18,
          right: 18,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PoppinsText.whiteMedium('No. Rekam Medis', 12),
              SizedBox(
                width: 82,
                child: PoppinsText.whiteSemiBold(noRekamMedis, 14),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 75,
          left: 18,
          right: 18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(flex: 1, child: antrian(antri)),
              const SizedBox(
                width: 15,
              ),
              Flexible(flex: 2, child: jadwal(tanggal)),
            ],
          ),
        ),
        Positioned(
            bottom: 18,
            left: 18,
            right: 18,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      popUpBatal(context, sessionId);
                    },
                    child: PoppinsText.whiteSemiBold('Batalkan', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.blue(),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: MyColors.white(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Consumer2<PatientByIdProvider, ClinicProvider>(
                    builder: (context, providerPatient, providerClinic, child) {
                      return ElevatedButton(
                        onPressed: () async {
                          await providerPatient
                              .getPatientById(patientId)
                              .then((value) {
                            var dataSesi = providerPatient
                                .patientModelById!.data!.sessions!
                                .singleWhere(
                                    (element) => element.id == sessionId);
                            var poli = providerClinic.clinicModel!.data!
                                .singleWhere((element) =>
                                    element.id == dataSesi.clinicID);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProsesPasienScreen(
                                    sessionId: sessionId,
                                    patientModelById:
                                        providerPatient.patientModelById!,
                                    nik: providerPatient
                                        .patientModelById!.data!.nik!,
                                    noRekamMedis: noRekamMedis,
                                    poli: poli.name!,
                                    nama: nama,
                                    jenisKelamin: providerPatient
                                        .patientModelById!.data!.gender!,
                                    handphone: providerPatient
                                        .patientModelById!.data!.phone!,
                                    keluhan: dataSesi.complaint!),
                              ),
                            );
                          });
                        },
                        child: PoppinsText.blueSemiBold('Proses Pasien', 12),
                        style: ElevatedButton.styleFrom(
                          primary: MyColors.white(),
                          elevation: 0,
                        ),
                      );
                    },
                  ),
                ),
              ],
            )),
      ],
    ),
  );
}

Widget jadwalSelesaiCard({
  required BuildContext context,
  required String nama,
  required String noRekamMedis,
  required String patientId,
  required String sessionId,
}) {
  return Container(
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.blue(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('Nama Pasien', 12),
                  SizedBox(
                    width: 180,
                    child: PoppinsText.whiteSemiBold(nama, 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('No. Rekam Medis', 12),
                  SizedBox(
                    width: 82,
                    child: PoppinsText.whiteSemiBold(noRekamMedis, 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Consumer2<PatientByIdProvider, ClinicProvider>(
                builder: (context, provider, providerClinic, _) {
                  return ElevatedButton(
                    onPressed: () async {
                      await provider.getPatientById(patientId).then((value) {
                        var dataMR = provider
                            .patientModelById!.data!.medicalRecords!
                            .singleWhere(
                                (element) => element.sessionID == sessionId);
                        var dataSesi = provider
                            .patientModelById!.data!.sessions!
                            .singleWhere((element) => element.id == sessionId);
                        var poli = providerClinic.clinicModel!.data!
                            .singleWhere(
                                (element) => element.id == dataSesi.clinicID);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HasilSesiScreen(
                                  nama: nama,
                                  noRekamMedis: noRekamMedis,
                                  jenisKelamin:
                                      provider.patientModelById!.data!.gender!,
                                  handphone:
                                      provider.patientModelById!.data!.phone!,
                                  nik: provider.patientModelById!.data!.nik!,
                                  poli: poli.name!,
                                  alergi: dataMR.drugAllergyHistory!,
                                  terapiObat: dataMR.drugTherapy!,
                                  anamnesa: dataMR.history!,
                                  keluhan: dataSesi.complaint!,
                                  diagnosa: dataMR.diagnosis!,
                                  tinggi: dataMR.height!,
                                  berat: dataMR.weight!,
                                  systole: dataMR.systole!,
                                  diastole: dataMR.diastole!,
                                  suhu: dataMR.temperature!,
                                  status: dataMR.status!),
                            ));
                      });
                    },
                    child: PoppinsText.blueSemiBold('Lihat Hasil Sesi', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.white(),
                      elevation: 0,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget jadwalBatalCard({
  required String nama,
  required String noRekamMedis,
  required String id,
  required BuildContext context,
}) {
  return Container(
    height: 140,
    width: double.infinity,
    decoration: BoxDecoration(
      color: MyColors.grey(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('Nama Pasien', 12),
                  SizedBox(
                    width: 180,
                    child: PoppinsText.whiteSemiBold(nama, 14),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PoppinsText.whiteMedium('No. Rekam Medis', 12),
                  SizedBox(
                    width: 82,
                    child: PoppinsText.whiteSemiBold(noRekamMedis, 14),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Consumer<ClinicProvider>(
                builder: (context, provider, _) {
                  return ElevatedButton(
                    child: PoppinsText.greySemiBold('Lihat Detail Pasien', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.white(),
                      elevation: 0,
                    ),
                    onPressed: () async {
                      String poli = '-';
                      HospitalApi hospitalApi = HospitalApi();
                      var patientModelById =
                          await hospitalApi.getPatientById(id);
                      provider.clinicModel?.data?.forEach((element) {
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
                              jenisKelamin:
                                  patientModelById.data!.gender.toString(),
                              handphone:
                                  patientModelById.data!.phone.toString(),
                              keluhan:
                                  patientModelById.data!.sessions!.isNotEmpty
                                      ? patientModelById
                                          .data!.sessions!.last.complaint
                                          .toString()
                                      : '-'),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget antrian(String no) {
  return Container(
    alignment: Alignment.center,
    height: 35,
    decoration: BoxDecoration(
      color: MyColors.blue2(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: PoppinsText.whiteBold(no, 12),
    ),
  );
}

Widget jadwal(String date) {
  return Container(
    height: 35,
    decoration: BoxDecoration(
      color: MyColors.blue2(),
      borderRadius: BorderRadius.circular(5.0),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event,
            color: MyColors.white(),
          ),
          const SizedBox(
            width: 6,
          ),
          PoppinsText.whiteMedium(date, 12),
        ],
      ),
    ),
  );
}

popUpBatal(BuildContext context, String sessionId) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Container(
        height: 240,
        color: MyColors.white(),
        child: Column(
          children: [
            PoppinsText.black('Anda Yakin ingin membatalkan sesi ini?', 12),
            const SizedBox(
              height: 7,
            ),
            SvgPicture.asset('assets/popup1.svg'),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      final HospitalApi hospitalApi = HospitalApi();
                      final navigator = Navigator.of(context);
                      final provider =
                          Provider.of<SessionProvider>(context, listen: false);
                      var response = await hospitalApi.cancelSession(sessionId);
                      if (response.statusCode == 401) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => dialogError(
                              context,
                              'error authorization ${response.statusCode}',
                              '${response.statusMessage}, Restart kembali aplikasi'),
                        );
                      } else if (response.statusCode != 200) {
                        showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => dialogError(
                              context,
                              'active session error ${response.statusCode}',
                              '${response.statusMessage}, Hubungi teknisi atau Silahkan coba kembali.'),
                        );
                      } else {
                        navigator.pop();
                        provider.getSession();
                      }
                    },
                    child: PoppinsText.blueSemiBold('Ya, batalkan', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.white(),
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: BorderSide(
                          color: MyColors.blue(),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: PoppinsText.whiteSemiBold('Tidak', 12),
                    style: ElevatedButton.styleFrom(
                      primary: MyColors.blue(),
                      elevation: 0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
