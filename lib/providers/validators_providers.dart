import 'package:flutter/material.dart';

class  ValidatorsProviders extends ChangeNotifier{

  edadvalidator(String value, String message){
    if (value.isEmpty){
      return "Ingrese su edad";
    }else{
      double? edad = double.tryParse(value);
      if(edad == null){
        return "Por favor ingrese un número válido para su edad";
      }else if(edad < 1 || edad > 140){
        return "La edad debe estar entre 1 y 140";
      }
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
      }else if(peso < 35 || peso > 260){
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
      }else if(altura < 130 || altura > 260){
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

  cinturavalidator(String value, String message){
    if(value.isEmpty){
      return message;
    }else {
      double? cintura = double.tryParse(value);
      if(cintura == null){
        return "Por favor ingrese un número válido";
      }else if ( cintura < 40 || cintura > 350){
        return "El cuello debe estar entre 25 y 70 cm";
      }
    }
  }
  caderavalidator(String value, String message){
    if(value.isEmpty){
      return message;
    }else {
      double? cadera = double.tryParse(value);
      if(cadera == null){
        return "Por favor ingrese un número válido";
      }else if ( cadera < 70 || cadera > 170){
        return "La cadera debe estar entre 70 y 170 cm";
      }
    }
  }

  }
  