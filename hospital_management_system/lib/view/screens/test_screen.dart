import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/jadwal_card.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: jadwalBatalCard(),
      ),
    );
  }
}
