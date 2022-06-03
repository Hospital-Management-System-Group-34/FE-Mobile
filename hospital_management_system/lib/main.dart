import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management_system/view/screens/datapasien_screen.dart';
import 'package:hospital_management_system/view/screens/home_screen.dart';
import 'package:hospital_management_system/view/screens/splash_screen.dart';

import 'view/screens/jadwal_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SIMARS',
      home: JadwalScreen(),
    );
  }
}
