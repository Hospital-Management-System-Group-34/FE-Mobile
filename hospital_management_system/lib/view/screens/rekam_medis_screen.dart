import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/rekam_medis_card.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class RekamMedisScreen extends StatefulWidget {
  const RekamMedisScreen({Key? key}) : super(key: key);

  @override
  State<RekamMedisScreen> createState() => _RekamMedisScreenState();
}

class _RekamMedisScreenState extends State<RekamMedisScreen> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PoppinsText.neutral5Bold('No. Rekam Medis: 1028637519', 16),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(
                    parent: BouncingScrollPhysics()),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: rekamMedisCard(),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
