import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/pasien_card.dart';

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
        icon: Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children : [
            SizedBox(
                      child: TextFormField(
                        key: Key('search'),
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 4.0),
                          prefixIcon: const Icon(Icons.search_rounded),
                          hintText: "Search",
                          filled: true,
                          isDense: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
            SizedBox(height: 15),
            Container(
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                  height: 110,
                  width: 330,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue, width: 2),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10,
                        left: 18,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            PoppinsText.blue('Nama Pasien', 12),
                            PoppinsText.blackSemiBold('Alteeza Akbar', 14),
                            const SizedBox(
                              height: 10,
                            ),
                            PoppinsText.blue('No. Peserta', 12),
                            PoppinsText.blackSemiBold('1098765432', 14),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 10,
                        child: myPopUpMenu(),
                      ),
                      
                    ],
                  ),
                );
                },
              ),
              ),


          ]
        )
      ),
    );
    
  }
}