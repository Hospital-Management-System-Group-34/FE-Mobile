import 'package:flutter/material.dart';
import 'package:hospital_management_system/viewmodels/provider/patient_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/session_provider.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

import '../../widgets/jadwal_card.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({Key? key}) : super(key: key);

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: PoppinsText.blackBold('Janji  Hari Ini', 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.navigate_before, color: MyColors.blue()),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(
            top: 15,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyColors.unselectedTabBar(),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TabBar(
                    unselectedLabelColor: MyColors.unselectedTextTabBar(),
                    labelColor: MyColors.white(),
                    indicator: BoxDecoration(
                      color: MyColors.blue(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tabs: const [
                      Tab(
                        text: 'Akan Datang',
                      ),
                      Tab(
                        text: 'Selesai',
                      ),
                      Tab(
                        text: 'Dibatalkan',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    akanDatang(),
                    selesai(),
                    diBatalkan(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget akanDatang() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer2<SessionProvider, PatientProvider>(
        builder: (context, provider, providerPatient, _) {
          if (provider.state == SessionState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == SessionState.empty) {
            return Center(
              child: PoppinsText.neutral6SemiBold('Data Kosong', 16),
            );
          } else if (provider.state == SessionState.error) {
            return Center(
              child: PoppinsText.neutral6SemiBold('Error', 16),
            );
          } else {
            var filtered = provider.sessionModel!.data!
                .where((i) => i.status == 'Dalam antrian')
                .toList();
            return ListView.builder(
              itemCount: filtered.length,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemBuilder: (context, index) {
                var sesi = filtered[index];
                var pasien = providerPatient.patientModel!.data!
                    .lastWhere((element) => element.id == sesi.patientID);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: jadwalAkanDatangCard(
                      patientId: pasien.id!,
                      sessionId: sesi.id!,
                      context: context,
                      nama: pasien.name!,
                      noRekamMedis: pasien.medicalRecord!,
                      antri: sesi.queueCode!,
                      tanggal: sesi.date!),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget selesai() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer2<SessionProvider, PatientProvider>(
        builder: (context, provider, providerPatient, _) {
          if (provider.state == SessionState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == SessionState.empty) {
            return Center(
              child: PoppinsText.neutral6SemiBold('Data Kosong', 16),
            );
          } else if (provider.state == SessionState.error) {
            return Center(
              child: PoppinsText.neutral6SemiBold('Error', 16),
            );
          } else {
            var filtered = provider.sessionModel!.data!
                .where((i) => i.status == 'Selesai')
                .toList();
            return ListView.builder(
              itemCount: filtered.length,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemBuilder: (context, index) {
                var sesi = filtered[index];
                var pasien = providerPatient.patientModel!.data!
                    .lastWhere((element) => element.id == sesi.patientID);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: jadwalSelesaiCard(
                      context: context,
                      nama: pasien.name!,
                      noRekamMedis: pasien.medicalRecord!,
                      patientId: sesi.patientID!,
                      sessionId: sesi.id!),
                );
              },
            );
          }
        },
      ),
    );
  }

  Widget diBatalkan() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Consumer2<SessionProvider, PatientProvider>(
        builder: (context, provider, providerPatient, _) {
          if (provider.state == SessionState.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (provider.state == SessionState.empty) {
            return Center(
              child: PoppinsText.neutral6SemiBold('Data Kosong', 16),
            );
          } else if (provider.state == SessionState.error) {
            return Center(
              child: PoppinsText.neutral6SemiBold('Error', 16),
            );
          } else {
            var filtered = provider.sessionModel!.data!
                .where((i) => i.status == 'Dibatalkan')
                .toList();
            return ListView.builder(
              itemCount: filtered.length,
              physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              itemBuilder: (context, index) {
                var sesi = filtered[index];
                var pasien = providerPatient.patientModel!.data!
                    .lastWhere((element) => element.id == sesi.patientID);
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: jadwalBatalCard(
                    context: context,
                    id: pasien.id!,
                    nama: pasien.name!,
                    noRekamMedis: pasien.medicalRecord!,
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
