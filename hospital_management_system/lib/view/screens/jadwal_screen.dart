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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: PoppinsText.blackBold('Janji  Hari Ini', 16),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.navigate_before, color: MyColors.blue()),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: Column(
            children: [
              Container(
                height: 50,
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
                      text: 'Akan Datang',
                    ),
                    Tab(
                      text: 'Selesai',
                    ),
                    Tab(
                      text: 'Dibatalkan',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    akanDatang(),
                    selesai(),
                    diBatalkan(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget akanDatang() {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: jadwalAkanDatangCard(context),
        );
      },
    );
  }

  Widget selesai() {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: jadwalSelesaiCard(),
        );
      },
    );
  }

  Widget diBatalkan() {
    return ListView.builder(
      itemCount: 10,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: jadwalBatalCard(),
        );
      },
    );
  }
}
