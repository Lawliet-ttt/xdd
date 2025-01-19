import 'dart:math';

import 'package:flutter/material.dart';
class ControllersProviders extends ChangeNotifier{
  String _edad = "";
  String _peso = "";
  String _altura = "";
  String _cuello = "";
  String _cintura = "";
  String _cadera = "";

  int _genero = 0;
  double _actividad = 1;

  String get edad => _edad;
  String get peso => _peso;
  String get altura => _altura;
  String get cuello => _cuello;
  String get cintura => _cintura;
  String get cadera => _cadera;

  int get genero => _genero;
  double get actividad => _actividad;

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
  void updateactividad(double value){
    _actividad = value;
    notifyListeners();
  }
  void updatecadera(String value){
    _cadera = value;
    notifyListeners();
  }

  int calcularCalorias(){
    double peso = double.tryParse(_peso) ?? 0;
    double edad = double.tryParse(_edad) ?? 0;
    double altura = double.tryParse(_altura) ?? 0;
    int genero =  _genero;
    double actividad = _actividad;
    
    double calorias = ( (10 * peso) + (6.25 * altura) - (5 * edad) + genero) * actividad;
    int caloriasredondeadas  = calorias.round();

    return caloriasredondeadas;
  }

  double calcularGrasaCorporal(){
    //double peso = double.tryParse(_peso) ?? 0;
    //double edad = double.tryParse(_edad) ?? 0;
    double altura = double.tryParse(_altura) ?? 0;
    double cuello = double.tryParse(_cuello) ?? 0;
    double cintura = double.tryParse(_cintura) ?? 0;
    double cadera = double.tryParse(_cadera) ?? 0;
    int genero = _genero;
    if(genero == 1){
      double resultado = 86.010 * log(cintura - cuello)/log(10) - 70.041 * log(altura)/log(10) + 36.76;
      //double resultadocorporal = double.parse(resultado.toStringAsFixed(2));
      return double.parse(resultado.toStringAsFixed(2));
    } else if(genero == 2){
      double resultado = 163.205 * log(cintura + cadera - cuello)/log(10) - 97.684 * log(altura)/log(10) - 78.387;
      //double resultadocorporal = double.parse(resultado.toStringAsFixed(2));
      return double.parse(resultado.toStringAsFixed(2));
    }
     throw ArgumentError("El género debe ser 1 (Hombre) o 2 (Mujer).");
  }
}
