import 'package:flutter/material.dart';
import 'package:hospital_management_system/widgets/warna.dart';

Widget popUpSucces(
    double size1, double size2, double size3, double size4, double opacity) {
  return SizedBox(
    height: 130,
    width: 130,
    child: Stack(
      alignment: Alignment.center,
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: size1,
          height: size1,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 204, 253, 244),
              shape: BoxShape.circle),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: size2,
          height: size2,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 155, 251, 241),
              shape: BoxShape.circle),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          width: size3,
          height: size3,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 65, 226, 235), shape: BoxShape.circle),
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          width: size4,
          height: size4,
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 9, 194, 222),
            shape: BoxShape.circle,
          ),
        ),
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 200),
          child: Icon(
            Icons.check_rounded,
            color: MyColors.white(),
            size: 55,
          ),
        ),
      ],
    ),
  );
}
