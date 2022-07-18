import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

PageTransition transition({required PageTransitionType type, required Widget page}) {
  return PageTransition(
    type: type, 
    duration: const Duration(seconds: 1),
    child: page
  ); 
}