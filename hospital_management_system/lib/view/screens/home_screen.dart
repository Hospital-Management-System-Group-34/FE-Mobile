import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hospital_management_system/view/screens/datapasien_screen.dart';
import 'package:hospital_management_system/view/screens/jadwal_screen.dart';
import 'package:hospital_management_system/view/screens/profile_screen.dart';
import 'package:hospital_management_system/viewmodels/provider/clinic_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/image_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/patient_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/session_provider.dart';
import 'package:hospital_management_system/widgets/jadwal_card.dart';
import 'package:hospital_management_system/widgets/pasien_card.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/transition.dart';

class HomeScreen extends StatefulWidget {
  final String userName;
  const HomeScreen({Key? key, required this.userName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkImage();
      Provider.of<PatientProvider>(context, listen: false).getPatient();
      Provider.of<SessionProvider>(context, listen: false).getSession();
      Provider.of<ClinicProvider>(context, listen: false).getClinic();
    });
  }

  getData() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<PatientProvider>(context, listen: false).getPatient();
      Provider.of<SessionProvider>(context, listen: false).getSession();
      Provider.of<ClinicProvider>(context, listen: false).getClinic();
    });
  }

  void checkImage() async {
    var sp = await SharedPreferences.getInstance();
    var i = sp.getString('image');
    if (i != null) {
      if (!mounted) return;
      Provider.of<MyImageProvider>(context, listen: false).changeImage(File(i));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 170,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Consumer<MyImageProvider>(
                              builder: (context, provider, _) => CircleAvatar(
                                radius: 30,
                                backgroundImage: provider.image != null
                                    ? FileImage(provider.image!)
                                    : const AssetImage('assets/Ava.png')
                                        as ImageProvider,
                              ),
                            ),
                            const SizedBox(width: 15),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PoppinsText.blackBold(widget.userName, 16),
                                PoppinsText.blueSemiBold('Dokter Umum', 12),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(Icons.arrow_forward_ios,
                              color: MyColors.blue()),
                          alignment: Alignment.centerRight,
                          onPressed: () {
                            Navigator.push(
                                context,
                                transition(type: PageTransitionType.fade, page: ProfileScreen(userName: widget.userName),),);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 14, left: 14),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText.blackBold('Janji Hari Ini', 16),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          transition(type: PageTransitionType.fade, page: JadwalScreen(),),
                        );
                      },
                      child: PoppinsText.blue('Lihat semua', 12),
                    ),
                  ],
                ),
                Consumer2<SessionProvider, PatientProvider>(
                  builder: (context, provider, providerPatient, _) {
                    if (provider.state == SessionState.loading) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          CircularProgressIndicator(),
                        ],
                      );
                    } else if (provider.state == SessionState.empty) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PoppinsText.neutral6SemiBold('Data Kosong', 16),
                        ],
                      );
                    } else if (provider.state == SessionState.error) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PoppinsText.blackSemiBold(
                              'Error ${provider.sessionModel?.code}', 16),
                          const SizedBox(height: 10),
                          PoppinsText.neutral6Normal(
                              'terdapat masalah, tolong hubungi teknisi atau Coba lagi(1)',
                              12),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              onPressed: () => provider.getSession(),
                              child: PoppinsText.white('Coba Lagi', 12)),
                        ],
                      );
                    } else {
                      var filtered = provider.sessionModel!.data!
                          .lastWhere((i) => i.status == 'Dalam antrian');

                      if (providerPatient.state == PatientState.loading) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            CircularProgressIndicator(),
                          ],
                        );
                      } else if (providerPatient.state == PatientState.error) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PoppinsText.blackSemiBold(
                                'Error ${providerPatient.patientModel?.code}',
                                16),
                            const SizedBox(height: 10),
                            PoppinsText.neutral6Normal(
                                'terdapat masalah, tolong hubungi teknisi atau Coba lagi (2)',
                                12),
                            const SizedBox(height: 10),
                            ElevatedButton(
                                onPressed: () => providerPatient.getPatient(),
                                child: PoppinsText.white('Coba Lagi', 12)),
                          ],
                        );
                      } else if (providerPatient.state == PatientState.empty) {
                        return jadwalHomeCard(
                          nama: '-',
                          noRekamMedis: '-',
                          noAntrian: filtered.queueCode!,
                          tanggal: filtered.date!,
                        );
                      } else {
                        var pasien = providerPatient.patientModel!.data!
                            .lastWhere(
                                (element) => element.id == filtered.patientID);

                        return jadwalHomeCard(
                          nama: pasien.name!,
                          noRekamMedis: pasien.medicalRecord!,
                          noAntrian: filtered.queueCode!,
                          tanggal: filtered.date!,
                        );
                      }
                    }
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PoppinsText.blackBold('Data Pasien', 16),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DataPasien(),
                          ),
                        );
                      },
                      child: PoppinsText.blue('Lihat semua', 12),
                    ),
                  ],
                ),
                Consumer<PatientProvider>(
                  builder: (context, provider, _) {
                    if (provider.state == PatientState.empty) {
                      return Column(
                        children: [
                          const SizedBox(height: 50),
                          PoppinsText.neutral6SemiBold(
                              'Empty Patient Data', 16),
                        ],
                      );
                    } else if (provider.state == PatientState.loading) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          SizedBox(height: 50),
                          CircularProgressIndicator(),
                        ],
                      );
                    } else if (provider.state == PatientState.error) {
                      return Column(
                        children: [
                          const SizedBox(height: 50),
                          PoppinsText.blackSemiBold(
                              'Error ${provider.patientModel?.code}', 16),
                          const SizedBox(height: 10),
                          PoppinsText.neutral6Normal(
                              'terdapat masalah, tolong hubungi teknisi', 12),
                        ],
                      );
                    } else {
                      return GridView.builder(
                        physics: const AlwaysScrollableScrollPhysics(
                            parent: BouncingScrollPhysics()),
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        itemCount: provider.patientModel!.data!.length < 4
                            ? provider.patientModel!.data!.length
                            : 4,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16),
                        itemBuilder: (context, index) {
                          final pasien = provider.patientModel?.data?[
                              (provider.patientModel!.data!.length) -
                                  (index + 1)];
                          return pasienCard(
                              context: context,
                              id: pasien!.id!,
                              nama: pasien.name!,
                              noRekamMedis: pasien.medicalRecord!);
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
