import 'package:flutter/material.dart';
import 'package:hospital_management_system/models/patient_id_model.dart';
import 'package:hospital_management_system/viewmodels/provider/clinic_provider.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/rekam_medis_card.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

class RekamMedisScreen extends StatefulWidget {
  final PatientModelById patientModelById;
  final String noRekamMedis;
  const RekamMedisScreen(
      {Key? key, required this.noRekamMedis, required this.patientModelById})
      : super(key: key);

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
            PoppinsText.neutral5Bold(
                'No. Rekam Medis: ${widget.noRekamMedis}', 16),
            const SizedBox(
              height: 35,
            ),
            Expanded(
              child: Consumer<ClinicProvider>(
                builder: (context, provider, _) {
                  return ListView.builder(
                    physics: const AlwaysScrollableScrollPhysics(
                        parent: BouncingScrollPhysics()),
                    itemCount:
                        widget.patientModelById.data!.medicalRecords!.length,
                    itemBuilder: (context, index) {
                      var medicalRecord =
                          widget.patientModelById.data!.medicalRecords![index];
                      var dataSesi = widget.patientModelById.data!.sessions!
                          .singleWhere((element) =>
                              element.id == medicalRecord.sessionID);
                      var poli = provider.clinicModel!.data!.singleWhere(
                          (element) => element.id == dataSesi.clinicID);

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: rekamMedisCard(
                            context: context,
                            medicalRecords: medicalRecord,
                            sessions: dataSesi,
                            poli: poli.name!),
                      );
                    },
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
