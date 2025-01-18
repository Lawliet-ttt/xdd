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
  String seleccionarGenero = "";
  
  final edadController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final actividadController = TextEditingController();
  final cuelloController = TextEditingController();

  final _formKeys = GlobalKey<FormState>();
  final providerValidator = ValidatorsProviders();
   
  @override
  Widget build(BuildContext context) {
    //double ancho = MediaQuery.of(context).size.width;
    //double alto = MediaQuery.of(context).size.height;

    final providerController = Provider.of<ControllersProviders>(context);
    
    edadController.text = providerController.edad;
    pesoController.text = providerController.peso;
    alturaController.text = providerController.altura;
    //actividadController.text = providerController.actividad;
    cuelloController.text = providerController.cuello;

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
                  setState(() {
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
              //controller: cinturaController
              //validotor : (value)=> providerValidator.cinturaalidator(value,"Valide perimetro de la cintura"),
            ),
            SElevatedButton(
              text: "Calcular",
              onPressed: (){
              if(_formKeys.currentState!.validate()){
                _formKeys.currentState?.save();
              }
            }
            ),
            ],
            ),
          ),
        ),
      ),
    );
  }
}