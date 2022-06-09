import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management_system/view/screens/home_screen.dart';
import 'package:hospital_management_system/widgets/warna.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: MyColors.white(),
      ),
      title: 'SIMARS',
      home: const HomeScreen(),
    );
  }
}
