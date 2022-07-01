import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hospital_management_system/widgets/pop_up_berhasil_simpan.dart';

class ResponScreen extends StatefulWidget {
  const ResponScreen({Key? key}) : super(key: key);

  @override
  State<ResponScreen> createState() => _ResponScreenState();
}

class _ResponScreenState extends State<ResponScreen> {
  double _size1 = 0;
  double _size2 = 0;
  double _size3 = 0;
  double _size4 = 0;
  double _opacity = 0;

  animasi() {
    Future.delayed(
      const Duration(milliseconds: 1450),
      () {
        setState(() {
          _opacity = 1.0;
        });
      },
    );

    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        setState(() {
          _size1 = 130;
        });
      },
    );

    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        setState(() {
          _size2 = 110;
        });
      },
    );

    Future.delayed(
      const Duration(milliseconds: 600),
      () {
        setState(() {
          _size3 = 90;
        });
      },
    );

    Future.delayed(
      const Duration(milliseconds: 100),
      () {
        setState(() {
          _size4 = 70;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    animasi();
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              popUpSucces(_size1, _size2, _size3, _size4, _opacity),
              const SizedBox(
                height: 20,
              ),
              AnimatedOpacity(
                opacity: _opacity,
                duration: const Duration(milliseconds: 200),
                child: Text(
                  'Hasil sesi pasien berhasil disimpan!',
                  style: GoogleFonts.poppins(
                    color: const Color.fromARGB(255, 6, 152, 190),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
