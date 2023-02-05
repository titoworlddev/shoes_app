import 'package:flutter/material.dart';

class ZapatoModel with ChangeNotifier {
  String _assetImage = 'negro';

  String get assetImage => _assetImage;
  set assetImage(String valor) {
    _assetImage = valor;
    notifyListeners();
  }

  double _talla = 9.0;

  double get talla => _talla;
  set talla(double valor) {
    _talla = valor;
    notifyListeners();
  }
}
