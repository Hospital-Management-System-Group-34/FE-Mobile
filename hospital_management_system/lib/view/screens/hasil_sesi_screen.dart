import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/custom_disabled_textfield.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class HasilSesiScreen extends StatefulWidget {
  const HasilSesiScreen({Key? key}) : super(key: key);

  @override
  State<HasilSesiScreen> createState() => _HasilSesiScreenState();
}

class _HasilSesiScreenState extends State<HasilSesiScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: PoppinsText.blackBold('Hasil Sesi', 16),
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
            myDisabledTextField('012342385482001'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('No. Rekam Medis', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('PS.19375181'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Poli', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('UMUM'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Nama Lengkap', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Cassandra Winter'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Jenis Kelamin', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Perempuan'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('No. Handphone', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('082134567399'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Keluhan', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Batuk Pilek'),
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
            myDisabledTextField('Terindikasi Influenza'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Riwayat Alergi Obat', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Tidak Ada'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Terapi Obat', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Paracetamol'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Diagnosa', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Influenza'),
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
                      myDisabledTextField('160'),
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
                      myDisabledTextField('52'),
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
                      myDisabledTextField('90'),
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
                      myDisabledTextField('60'),
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
            myDisabledTextField('36'),
            const SizedBox(
              height: 10,
            ),
            PoppinsText.neutral9Medium('Status Pulang', 16),
            const SizedBox(
              height: 10,
            ),
            myDisabledTextField('Rawat Jalan'),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
