import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hospital_management_system/models/authentication_model.dart';
import 'package:hospital_management_system/services/hospital_api.dart';
import 'package:hospital_management_system/view/screens/home_screen.dart';
import 'package:hospital_management_system/view/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SharedPreferences sp;
  late bool statusLogin;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      checkLogin();
    });
  }

  void checkLogin() async {
    sp = await SharedPreferences.getInstance();
    statusLogin = sp.getBool('loginStatus') ?? false;
    final HospitalApi hospitalApi = HospitalApi();

    if (statusLogin == true) {
      AuthModel authModel = await hospitalApi.refreshAccessToken();
      if (authModel.code != 200) {
        await sp.setBool('loginStatus', false);
        await sp.remove('user');
        await sp.remove('accessToken');
        await sp.remove('refreshToken');
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
              (route) => false,
            );
          },
        );
      } else {
        await sp.setString('accessToken', authModel.data!.accessToken!);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
              (route) => false,
            );
          },
        );
      }
    } else if (statusLogin == false) {
      Future.delayed(
        const Duration(seconds: 2),
        () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
            (route) => false,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset('assets/logo.svg'),
      ),
    );
  }
}
