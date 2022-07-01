import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/custom_disabled_textfield.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class DetailRekamMedis extends StatefulWidget {
  const DetailRekamMedis({Key? key}) : super(key: key);

  @override
  State<DetailRekamMedis> createState() => _DetailRekamMedisState();
}

class _DetailRekamMedisState extends State<DetailRekamMedis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText.blackBold('Riwayat Rekam Medis', 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: MyColors.blue()),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              height: 40,
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: MyColors.neutral3(),
              ),
              child:
                  PoppinsText.neutral6SemiBold('Tanggal Sesi: 27 Mei 2022', 14),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(child: hasilSesi()),
          ],
        ),
      ),
    );
  }

  Widget hasilSesi() {
    return SingleChildScrollView(
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
    );
  }
}
