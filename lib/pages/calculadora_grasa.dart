import 'package:app/componts/mi_drawer.dart';
import 'package:app/componts/super_dropdownbuttonn.dart';
import 'package:app/componts/super_elevatedbuttonn.dart';
import 'package:app/componts/super_textformfieldd.dart';
import 'package:app/providers/controllers_providers.dart';
import 'package:flutter/material.dart';
import 'package:app/providers/validators_providers.dart';
import 'package:provider/provider.dart';

class PantallaCalculadoraGrasa extends StatefulWidget {
  const PantallaCalculadoraGrasa({super.key});

  @override
  State<PantallaCalculadoraGrasa> createState() =>
      _PantallaCalculadoraGrasaState();
}

class _PantallaCalculadoraGrasaState extends State<PantallaCalculadoraGrasa> {
  
  final edadController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final actividadController = TextEditingController();
  final cuelloController = TextEditingController();
  final cinturaController = TextEditingController();

  final providerValidator = ValidatorsProviders();
  final _formKeys = GlobalKey<FormState>();

  String seleccionarGenero = "";
  int valorgenero = 0;
  double grasa = 0;

  @override
  void initState(){
    super.initState();
    final  providerController = Provider.of<ControllersProviders>(context,listen: false);
    edadController.text = providerController.edad;
    pesoController.text = providerController.peso;
    alturaController.text = providerController.altura;
    cinturaController.text = providerController.cintura;
    cuelloController.text = providerController.cuello;
  }
  @override
  Widget build(BuildContext context) {

    final providerController = Provider.of<ControllersProviders>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Porcentaje de Grasa"),
      ),
      drawer: MiDrawer(),
      body: Form(
        key: _formKeys,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
              
              const SizedBox(height: 5),
              SDropdownButton(
                items: ['Hombre', 'Mujer'],
                hint: "Selecciona un genero",
                icon: Icons.arrow_drop_down,
                onChanged: (String ? newValue) {
                  if(newValue =='Hombre'){
                    valorgenero = 1;
                  }else if(newValue=='Mujer'){
                    valorgenero = 2;
                  }
                  setState(() {
              Provider.of<ControllersProviders>(context,listen: false).updategenero(valorgenero);
                  });
                }
                )
              ,
              STextFormField(
                hintText: "edad",
                controller: edadController,
                validator: (value)=>providerValidator.edadvalidator(value, "Valide su edad"),
                onSaved: (value) => providerController.updateEdad(value ?? '')
              ),
            STextFormField(
              hintText: "altura",
              controller: alturaController,
              validator: (value) => providerValidator.alturavalidator(value,"valide su altura"),
              onSaved: (value) =>providerController.updatealtura(value ?? '') ,
            ),
            STextFormField(
              hintText: "peso",
              controller: pesoController,
              validator: (value) => providerValidator.pesovalidator(value, "valide su peso"),
              onSaved: (value) =>providerController.updatepeso(value ?? '') ,
            ),
            
            STextFormField(
              hintText: "cuello",
              controller: cuelloController,
              validator : (value)=> providerValidator.cuellovalidator(value,"Valide perimetro del cuello"),
              onSaved: (value) =>providerController.updatecuello(value ?? '') ,
            ),
            STextFormField(
              hintText: "Cintura",
              controller: cinturaController,
              validator : (value)=> providerValidator.cinturavalidator(value,"Valide perimetro de la cintura"),
              onSaved: (value) =>providerController.updatecintura(value ?? ''),
            ),
            SElevatedButton(
              text: "Calcular",
              onPressed: (){
              if(_formKeys.currentState!.validate()){
                _formKeys.currentState?.save();
                setState(() {
                  grasa = providerController.calcularGrasaCorporal();
                });
              }
            }
            ),
            if(grasa>1 && grasa<100)
              Text("Su porcentaje de grasa es $grasa")
            ],
            ),
          ),
        ),
      ),
    );
  }
}