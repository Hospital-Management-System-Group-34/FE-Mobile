import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/pasien_card.dart';
import 'package:hospital_management_system/widgets/warna.dart';

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
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: 11,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16),
                itemBuilder: (context, index) {
                  return pasienCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
