import 'package:flutter/material.dart';
import 'package:hospital_management_system/view/screens/datapasien_screen.dart';
import 'package:hospital_management_system/widgets/jadwal_card.dart';
import 'package:hospital_management_system/widgets/pasien_card.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 138,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PoppinsText.whiteBold('Keshya Valerie Sky', 16),
                        PoppinsText.blue('Dokter Umum', 12),
                      ],
                    ),
                    SizedBox(width: 51),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      alignment: Alignment.centerRight,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: PoppinsText.blackBold('Janji Hari Ini', 16),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24),
                  child: PoppinsText.blue('Lihat semua', 12),
                ),
              ],
            ),
            SizedBox(height: 15),
            jadwal1Card(),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: PoppinsText.blackBold('Data Pasien', 16),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DataPasien()));
                  },
                  child: PoppinsText.blue('Lihat semua', 12),
                  
                ),
              ],
            ),
            SizedBox(height: 15),
            pasienCard(),
            SizedBox( height: 15),
            pasienCard(),
            SizedBox( height: 15),
            pasienCard(),
          ]
        ),
      )
    );
  }
}
