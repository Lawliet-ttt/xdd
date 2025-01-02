import 'package:flutter/material.dart';

class  FieldProviders extends ChangeNotifier{

  String alturatext = '';
 
  late TextEditingController alturaController;

  void changeUserName({

    required String newAlturatext,
  }) async{
    alturatext = newAlturatext;
    notifyListeners();
  }
  }
  