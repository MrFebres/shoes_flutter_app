import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _size = 9.0;

  String get currentImage => _assetImage;

  set assetImage(String image) {
    _assetImage = image;
    notifyListeners();
  }

  double get size => _size;

  set size(double size) {
    _size = size;
    notifyListeners();
  }
}
