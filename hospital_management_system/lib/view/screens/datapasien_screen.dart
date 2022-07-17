import 'package:flutter/material.dart';
import 'package:hospital_management_system/viewmodels/provider/patient_provider.dart';
import 'package:hospital_management_system/widgets/pasien_card.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

import '../../widgets/poppins_text.dart';

class DataPasien extends StatefulWidget {
  const DataPasien({Key? key}) : super(key: key);

  @override
  State<DataPasien> createState() => _DataPasienState();
}

class _DataPasienState extends State<DataPasien> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText.blackBold('Data Pasien', 16),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before, color: MyColors.blue()),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(
              child: TextFormField(
                key: const Key('search'),
                style: const TextStyle(
                  fontSize: 16,
                ),
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 4.0),
                  prefixIcon: const Icon(Icons.search_rounded),
                  hintText: "Cari Pasien",
                  filled: true,
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: Consumer<PatientProvider>(
                builder: (context, provider, _) {
                  if (provider.state == PatientState.empty) {
                    return Column(
                      children: [
                        const SizedBox(height: 50),
                        PoppinsText.neutral6SemiBold('Empty Patient Data', 16),
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
                        parent: BouncingScrollPhysics(),
                      ),
                      padding: EdgeInsets.zero,
                      itemCount: provider.patientModel?.data?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16),
                      itemBuilder: (context, index) {
                        final pasien = provider.patientModel!.data![
                            provider.patientModel!.data!.length - (index + 1)];
                        return pasienCard(
                            context: context,
                            id: pasien.id!,
                            nama: pasien.name!,
                            noRekamMedis: pasien.medicalRecord!);
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
