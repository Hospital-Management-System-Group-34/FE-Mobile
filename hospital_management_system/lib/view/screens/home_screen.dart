import 'package:flutter/material.dart';
import 'package:hospital_management_system/view/screens/datapasien_screen.dart';
import 'package:hospital_management_system/view/screens/jadwal_screen.dart';
import 'package:hospital_management_system/widgets/jadwal_card.dart';
import 'package:hospital_management_system/widgets/pasien_card.dart';
import 'package:hospital_management_system/widgets/poppins_text.dart';
import 'package:hospital_management_system/widgets/warna.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 170,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  bottom: 30,
                  right: 0,
                  left: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/Ava.png'),
                      ),
                      const SizedBox(width: 15),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PoppinsText.blackBold('Keshya Valerie Sky', 16),
                          PoppinsText.blueSemiBold('Dokter Umum', 12),
                        ],
                      ),
                      const SizedBox(width: 40),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            color: MyColors.blue()),
                        alignment: Alignment.centerRight,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, right: 14, left: 14),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PoppinsText.blackBold('Janji Hari Ini', 16),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const JadwalScreen(),
                            ),
                          );
                        },
                        child: PoppinsText.blue('Lihat semua', 12),
                      ),
                    ],
                  ),
                  jadwalHomeCard(),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      PoppinsText.blackBold('Data Pasien', 16),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DataPasien(),
                            ),
                          );
                        },
                        child: PoppinsText.blue('Lihat semua', 12),
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: 4,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16),
                    itemBuilder: (context, index) {
                      return pasienCard();
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
