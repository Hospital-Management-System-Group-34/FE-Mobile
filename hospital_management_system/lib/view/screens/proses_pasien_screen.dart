import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/view/screens/rekam_medis_screen.dart';
import 'package:hospital_management_system/widgets/custom_disabled_textfield.dart';
import 'package:hospital_management_system/widgets/custom_textfield.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class ProsesPasienScreen extends StatefulWidget {
  final PatientModelById patientModelById;
  final String nik;
  final String noRekamMedis;
  final String poli;
  final String nama;
  final String jenisKelamin;
  final String handphone;
  final String keluhan;

  const ProsesPasienScreen(
      {Key? key,
      required this.nik,
      required this.noRekamMedis,
      required this.poli,
      required this.nama,
      required this.jenisKelamin,
      required this.handphone,
      required this.keluhan,
      required this.patientModelById})
      : super(key: key);

  @override
  State<ProsesPasienScreen> createState() => _ProsesPasienScreenState();
}

class _ProsesPasienScreenState extends State<ProsesPasienScreen>
    with SingleTickerProviderStateMixin {
  var controllerAnamnesa = TextEditingController();
  var controllerTerapiObat = TextEditingController();
  var controllerTerapiNonObat = TextEditingController();
  var controllerDiagnosa = TextEditingController();
  var controllerTB = TextEditingController();
  var controllerBB = TextEditingController();
  var controllerSistole = TextEditingController();
  var controllerDiastole = TextEditingController();
  var controllerSuhu = TextEditingController();
  late TabController _controllerTab;

  final valueAlergiObat = ValueNotifier('');
  final alergiObatItem = ['Ada', 'Tidak Ada'];

  final valueStatPulang = ValueNotifier('');
  final statPulangItem = ['Rawat Jalan', 'Rawat Inap'];

  String title = 'Detail Pasien';

  @override
  void initState() {
    super.initState();
    _controllerTab = TabController(vsync: this, length: 2);
    _controllerTab.addListener(() {
      if (_controllerTab.index == 0) {
        title = 'Detail Pasien';
      } else {
        title = 'Proses Pasien';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: PoppinsText.blackBold(title, 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.navigate_before, color: MyColors.blue()),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 15),
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
                    controller: _controllerTab,
                    unselectedLabelColor: MyColors.unselectedTextTabBar(),
                    labelColor: MyColors.white(),
                    indicator: BoxDecoration(
                      color: MyColors.blue(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    tabs: const [
                      Tab(
                        text: 'Detail Pasien',
                      ),
                      Tab(
                        text: 'Proses Pasien',
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
                  controller: _controllerTab,
                  children: [
                    detailPasien(),
                    prosesPasien(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget detailPasien() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText.neutral9Medium('NIK', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.nik),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('No. Rekam Medis', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.noRekamMedis),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Poli', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.poli),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Nama Lengkap', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.nama),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Jenis Kelamin', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.jenisKelamin),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('No. Handphone', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.handphone),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Keluhan', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.keluhan),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: const Color.fromARGB(255, 9, 194, 222),
                fixedSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoppinsText.whiteBold('Riwayat Rekam Medis', 16),
                  const SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.navigate_next_rounded,
                    color: MyColors.white(),
                    size: 32,
                  )
                ],
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RekamMedisScreen(
                          noRekamMedis: widget.noRekamMedis,
                          patientModelById: widget.patientModelById),
                    ));
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  Widget prosesPasien() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText.neutral9Bold('Anamnesa', 16),
            const SizedBox(
              height: 10,
            ),
            myTextField(
                controller: controllerAnamnesa,
                textInputType: TextInputType.text,
                maxLines: 3,
                minLines: 1,
                hintText: 'Isi anamnesa pasien disini'),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Riwayat alergi obat', 16),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: valueAlergiObat,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: MyColors.neutral7(),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.expand_more),
                      value: (value.isEmpty) ? null : value,
                      hint: Text(
                        'Apakah pasien ada alergi obat?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: MyColors.neutral6(),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (inputan) =>
                          valueAlergiObat.value = inputan.toString(),
                      items: alergiObatItem
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: MyColors.black(),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Terapi obat', 16),
            const SizedBox(
              height: 10,
            ),
            myTextField(
                controller: controllerTerapiObat,
                textInputType: TextInputType.text,
                maxLines: 3,
                minLines: 1,
                hintText: 'Isi terapi obat pasien disini'),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Terapi non obat', 16),
            const SizedBox(
              height: 10,
            ),
            myTextField(
                controller: controllerTerapiNonObat,
                textInputType: TextInputType.text,
                maxLines: 3,
                minLines: 1,
                hintText: 'Isi terapi non obat pasien disini'),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Diagnosa', 16),
            const SizedBox(
              height: 10,
            ),
            myTextField(
                controller: controllerDiagnosa,
                textInputType: TextInputType.text,
                maxLines: 3,
                minLines: 1,
                hintText: 'Isi diagnosa pasien disini'),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Pemeriksaan Fisik', 16),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myTextField(
                          controller: controllerTB,
                          textInputType: TextInputType.number,
                          maxLines: 1,
                          minLines: 1,
                          hintText: 'Tinggi badan'),
                      const SizedBox(
                        height: 10,
                      ),
                      PoppinsText.neutral9Normal('*dalam cm', 14),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 28,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myTextField(
                        controller: controllerBB,
                        textInputType: TextInputType.number,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Berat badan'),
                    const SizedBox(
                      height: 10,
                    ),
                    PoppinsText.neutral9Normal('*dalam kg', 14),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Tekanan Darah', 16),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myTextField(
                          controller: controllerSistole,
                          textInputType: TextInputType.number,
                          maxLines: 1,
                          minLines: 1,
                          hintText: 'Sistole'),
                      const SizedBox(
                        height: 10,
                      ),
                      PoppinsText.neutral9Normal('*dalam mmHg', 14),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 28,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    myTextField(
                        controller: controllerDiastole,
                        textInputType: TextInputType.number,
                        maxLines: 1,
                        minLines: 1,
                        hintText: 'Diastole'),
                    const SizedBox(
                      height: 10,
                    ),
                    PoppinsText.neutral9Normal('*dalam mmHg', 14),
                  ],
                ))
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Suhu', 16),
            const SizedBox(
              height: 10,
            ),
            myTextField(
                controller: controllerSuhu,
                textInputType: TextInputType.number,
                maxLines: 1,
                minLines: 1,
                hintText: 'Isi suhu pasien disini'),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.neutral9Bold('Status Pulang', 16),
            const SizedBox(
              height: 10,
            ),
            ValueListenableBuilder(
              valueListenable: valueStatPulang,
              builder: (BuildContext context, String value, _) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: MyColors.neutral7(),
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      isExpanded: true,
                      icon: const Icon(Icons.expand_more),
                      value: (value.isEmpty) ? null : value,
                      hint: Text(
                        'Apakah pasien ada alergi obat?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: MyColors.neutral6(),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      onChanged: (inputan) =>
                          valueStatPulang.value = inputan.toString(),
                      items: statPulangItem
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(
                                  e,
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: MyColors.black(),
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 15,
            ),
            PoppinsText.blackMedium(
                '*Pastikan semua data terisi dengan benar', 14),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(double.infinity, 60),
                elevation: 0,
                primary: MyColors.blue(),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  PoppinsText.whiteBold('Konfirmasi', 20),
                ],
              ),
              onPressed: () {},
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
