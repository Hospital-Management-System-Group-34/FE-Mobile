import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

import '../../widgets/jadwal_card.dart';

class JadwalScreen extends StatefulWidget {
  const JadwalScreen({Key? key}) : super(key: key);

  @override
  State<JadwalScreen> createState() => _JadwalScreenState();
}

class _JadwalScreenState extends State<JadwalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PoppinsText.blackBold('Janji  Hari Ini', 16),
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
            Row(
              children: [
                ElevatedButton(onPressed: () {} , child: Text('Senin')),
                ElevatedButton(onPressed: () {} , child: Text('Senin')),
                ElevatedButton(onPressed: () {} , child: Text('Senin')),
              ],
            ),
            SizedBox(height: 15),
            Container(
              height: 400,
              width: double.infinity,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                  height: 180,
                  width: 328,
                  margin: const EdgeInsets.only(bottom: 20),	
                  decoration: BoxDecoration(
                    color: MyColors.blue(),
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 18,
                        left: 18,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoppinsText.whiteMedium('Nama Pasien', 12),
                            PoppinsText.whiteSemiBold('Cassandra Winter', 14),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 18,
                        right: 18,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PoppinsText.whiteMedium('No. Peserta', 12),
                            PoppinsText.whiteSemiBold('1098361345', 14),
                          ],
                        ),
                      ),
                      Positioned(bottom: 75, left: 18, right: 18, child: myWaktuSesi()),
                      Positioned(
                          bottom: 18,
                          left: 18,
                          right: 18,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: PoppinsText.whiteSemiBold('Re-schedule', 12),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(140, 10),
                                  primary: MyColors.blue(),
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    side: BorderSide(
                                      color: MyColors.white(),
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {},
                                child: PoppinsText.blueSemiBold('Proses Pasien', 12),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: const Size(140, 10),
                                  primary: MyColors.white(),
                                  elevation: 0,
                                ),
                              ),
                            ],
                          )),
                    ],
                  ),
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