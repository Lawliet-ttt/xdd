import 'package:flutter/material.dart';

class  ValidatorsProviders extends ChangeNotifier{

  edadvalidator(String value, String message){
    if (value.isEmpty){
      return "Ingrese su edad";
    }else{
      return null;
    }
  }

  pesovalidator(String value, String message){
    if (value.isEmpty){
      return message;
    }else{
      double? peso = double.tryParse(value);
      if(peso == null){
        return "Por favor ingrese un número válido para el peso";
      }else if(peso<35 || peso>260){
        return "El peso debe estar entre 35 y 260";
      }
    }
  }

  alturavalidator(String value, String message){
    if (value.isEmpty){
      return message;
    }else {
      double? altura = double.tryParse(value);
      if(altura == null){
        return "Por favor ingrese un número válido";
      }else if(altura<130 || altura>260){
        return "La altura debe estar entre 130 y 260 cm";
      }
    }
  }

  actividadvalidator(String value, String message){
    if (value.isEmpty){
      return message;
    }else{
      return null;
    }
  }

  cuellovalidator(String value, String message){
    if(value.isEmpty){
      return message;
    }else {
      double? cuello = double.tryParse(value);
      if(cuello == null){
        return "Por favor ingrese un número válido";
      }else if(cuello < 25 ||  cuello > 70){
        return "El cuello debe estar entre 25 y 70 cm";
      }
    }
  }

  }
  