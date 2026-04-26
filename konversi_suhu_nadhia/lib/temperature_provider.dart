import 'package:flutter/material.dart';

class TemperatureProvider extends ChangeNotifier {

  String satuanInput = "Celsius";

  double c = 0;
  double f = 0;
  double k = 0;
  double r = 0;

  void setSatuan(String value) {
    satuanInput = value;
    notifyListeners();
  }

  void konversi(String value) {

    if (value.isEmpty) return;

    double input = double.parse(value);

    switch (satuanInput) {

      case "Celsius":
        c = input;
        f = (c * 9/5) + 32;
        k = c + 273.15;
        r = c * 4/5;
        break;

      case "Fahrenheit":
        f = input;
        c = (f - 32) * 5/9;
        k = c + 273.15;
        r = c * 4/5;
        break;

      case "Kelvin":
        k = input;
        c = k - 273.15;
        f = (c * 9/5) + 32;
        r = c * 4/5;
        break;

      case "Reamur":
        r = input;
        c = r * 5/4;
        f = (c * 9/5) + 32;
        k = c + 273.15;
        break;
    }

    notifyListeners();
  }
}