import 'package:flutter/material.dart';
class ControllersProviders extends ChangeNotifier{
  String _edad = "";
  String _peso = "";
  String _altura = "";
  String _actividad = "";
  String _cuello = "";
  String _cintura = "";
  int _genero = 1;

  String get edad => _edad;
  String get peso => _peso;
  String get altura => _altura;
  String get actividad => _actividad;
  String get cuello => _cuello;
  String get cintura => _cintura;
  int get genero => _genero;

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
  void updategenero(int value){
    _genero = value;
    notifyListeners();
  }

  int calcularCalorias(){
    double peso = double.tryParse(_peso) ?? 0;
    double edad = double.tryParse(_edad) ?? 0;
    double altura = double.tryParse(_altura) ?? 0;
    int genero =  _genero;
    //double actividad = double.tryParse(_actividad) ?? 0;
    
    double calorias = ( (10 * peso) + (6.25 * altura) - (5 * edad) + genero) * 1.55;
    int calor  = calorias.round();

    return calor;
  }
}
