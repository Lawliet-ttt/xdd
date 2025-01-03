import 'package:flutter/material.dart';
class ControllersProviders extends ChangeNotifier{
  String _edad = "";
  String _peso = "";
  String _altura = "";
  String _actividad = "";
  String _cuello = "";
  String _cintura = "";

  String get edad => _edad;
  String get peso => _peso;
  String get altura => _altura;
  String get actividad => _actividad;
  String get cuello => _cuello;
  String get cintura => _cintura;

  void updateEdad(String value){
    _edad = value;
    notifyListeners();
  }
  void updatepeso(String value){
    _peso = value;
    notifyListeners();
  }
  void updatealtura(String value){
    _altura = value;
    notifyListeners();
  }
  void updateactividad(String value){
    _actividad = value;
    notifyListeners();
  }
  void updatecuello(String value){
    _cuello = value;
    notifyListeners();
  }
  void updatecintura(String value){
    _cintura = value;
    notifyListeners();
  }

}
