import 'package:app/componts/edit_elevated_button.dart';
import 'package:app/componts/mi_drawer.dart';
import 'package:app/componts/super_elevated_button.dart';
import 'package:app/componts/super_text_form_field.dart';
import 'package:app/providers/controllers_providers.dart';
import 'package:app/providers/validators_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PantallaCalculadoraCalorias extends StatefulWidget {
  const PantallaCalculadoraCalorias({super.key});
  @override
  State<PantallaCalculadoraCalorias> createState() => _PantallaCalculadoraCaloriasState();
}

class _PantallaCalculadoraCaloriasState extends State<PantallaCalculadoraCalorias> {
  String seleccionarGenero = "";
  final edadController = TextEditingController();
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  final actividadController = TextEditingController();
  final providerValidator = ValidatorsProviders();
  final formkey = GlobalKey<FormState>();

  @override 

  Widget build(BuildContext context) {
    
    final providerController = Provider.of<ControllersProviders>(context);
    edadController.text = providerController.edad;
    pesoController.text = providerController.peso;
    alturaController.text = providerController.altura;
    actividadController.text = providerController.actividad;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calorias"),
      ),
      drawer: MiDrawer(),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  EElevatedButton(
                    text: "Hombre",
                    isSelected: true,
                    isSelectable: seleccionarGenero == "Hombre",
                    onPressed: (){
                    seleccionarGenero = "Hombre"; 
                  }
                  ),
                  EElevatedButton(
                    text: "Mujer",
                    isSelected: true,
                    isSelectable: seleccionarGenero == "Mujer",
                    onPressed: (){
                    seleccionarGenero = "Mujer";
                  }
                  ),
                ],
              ),
            const SizedBox(height: 13),
            STextFormField(
              hintText: "Edad",
              controller: edadController,
              validator: (value)=>providerValidator.edadvalidator(value, "Valide su edad"),
              onSaved: (value) => providerController.updateEdad(value ?? ''),
              
            ),
            STextFormField(
              hintText: "Peso",
              controller: pesoController,
              validator: (value) => providerValidator.pesovalidator(value, "valide su peso"),
              onSaved: (value) => providerController.updatepeso(value ?? ''),
            ),
            STextFormField(
              hintText: "Altura",
              controller: alturaController,
              validator: (value) => providerValidator.alturavalidator(value,"Ingrese su altura"),
              onSaved: (value) => providerController.updatealtura(value ?? '')
            ),
            STextFormField(
              hintText: 'Nivel de actvidad',
              controller: actividadController,
              validator: (value) => providerValidator.actividadvalidator(value, "valide su actividad"),
              onSaved: (value) => providerController.updateactividad(value ?? '')
            ),
            SElevatedButton(
              text: "Datos",
              onPressed: (){
                if (formkey.currentState!.validate()){
                  //providers.updateEdad(edadC  ontroller.text);
                  formkey.currentState?.save();
            }
              },
            )
            ],
            ),
          ),
        ),
      ),
    );
  }
}