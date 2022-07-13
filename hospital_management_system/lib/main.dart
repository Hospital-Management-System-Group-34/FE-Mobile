import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital_management_system/view/screens/splash_screen.dart';
import 'package:hospital_management_system/viewmodels/provider/auth_provider.dart';
import 'package:hospital_management_system/viewmodels/provider/patient_provider.dart';
import 'package:hospital_management_system/widgets/warna.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => LogoutProvider()),
        ChangeNotifierProvider(create: (_) => PatientProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: const SplashScreen(),
    );
  }
}
