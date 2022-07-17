import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/custom_disabled_textfield.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class HasilSesiScreen extends StatefulWidget {
  final String alergi;
  final String terapiObat;
  final String diagnosa;
  final String tinggi;
  final String berat;
  final String systole;
  final String diastole;
  final String suhu;
  final String status;
  final String nik;
  final String noRekamMedis;
  final String poli;
  final String nama;
  final String jenisKelamin;
  final String handphone;
  final String keluhan;
  final String anamnesa;

  const HasilSesiScreen(
      {Key? key,
      required this.diagnosa,
      required this.tinggi,
      required this.berat,
      required this.systole,
      required this.diastole,
      required this.suhu,
      required this.status,
      required this.nik,
      required this.noRekamMedis,
      required this.poli,
      required this.nama,
      required this.jenisKelamin,
      required this.handphone,
      required this.keluhan,
      required this.anamnesa,
      required this.alergi,
      required this.terapiObat})
      : super(key: key);

  @override
  State<HasilSesiScreen> createState() => _HasilSesiScreenState();
}

class _HasilSesiScreenState extends State<HasilSesiScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controllerTab;
  String title = 'Detail Pasien';

  @override
  void initState() {
    super.initState();
    _controllerTab = TabController(length: 2, vsync: this);
    _controllerTab.addListener(() {
      if (_controllerTab.index == 0) {
        title = 'Detail Pasien';
      } else {
        title = 'Hasil Sesi';
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
                        text: 'Hasil Sesi',
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
                    hasilSesi(),
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
          ],
        ),
      ),
    );
  }

  Widget hasilSesi() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText.neutral9Medium('Anamnesa', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.anamnesa),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Riwayat Alergi Obat', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.alergi),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Terapi Obat', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.terapiObat),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Diagnosa', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.diagnosa),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Pemeriksaan Fisik', 16),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myDisabledTextField(widget.tinggi),
                      const SizedBox(
                        height: 10,
                      ),
                      PoppinsText.neutral6Normal('*dalam cm', 14),
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
                      myDisabledTextField(widget.berat),
                      const SizedBox(
                        height: 10,
                      ),
                      PoppinsText.neutral6Normal('*dalam kg', 14),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Tekanan Darah', 16),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      myDisabledTextField(widget.systole),
                      const SizedBox(
                        height: 10,
                      ),
                      PoppinsText.neutral6Normal('*dalam mmHg', 14),
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
                      myDisabledTextField(widget.diastole),
                      const SizedBox(
                        height: 10,
                      ),
                      PoppinsText.neutral6Normal('*dalam mmHg', 14),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Suhu', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.suhu),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Status Pulang', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField(widget.status),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
