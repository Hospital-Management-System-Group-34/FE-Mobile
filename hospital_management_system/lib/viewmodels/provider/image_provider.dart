import 'dart:io';

import 'package:flutter/cupertino.dart';

class MyImageProvider extends ChangeNotifier {
  File? image;

  changeImage(File f) {
    image = f;
    notifyListeners();
  }
}
