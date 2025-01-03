import 'package:app/componts/edit_elevated_button.dart';
import 'package:app/componts/mi_drawer.dart';
import 'package:app/componts/super_elevated_button.dart';
import 'package:app/componts/super_text_form_field.dart';
import 'package:app/providers/field_providers.dart';
import 'package:flutter/material.dart';
class PantallaCalculadoraCalorias extends StatefulWidget {
  const PantallaCalculadoraCalorias({super.key});

  @override
  State<PantallaCalculadoraCalorias> createState() => _PantallaCalculadoraCaloriasState();
}

class _PantallaCalculadoraCaloriasState extends State<PantallaCalculadoraCalorias> {
  String seleccionarGenero = "";
  final edad = TextEditingController();
  final peso = TextEditingController();
  final altura = TextEditingController();
  final actividad = TextEditingController();

  final provider = FieldProviders();
  final formkey = GlobalKey<FormState>();
  @override 
  
  Widget build(BuildContext context) {
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
              controller: edad,
              validator: (value)=>provider.edadvalidator(value, "Valide su edad")
            ),
            STextFormField(
              hintText: "Peso",
              controller: peso,
              validator: (value) => provider.pesovalidator(value, "valide su peso"),
            ),
            STextFormField(
              hintText: "Altura",
              controller: altura,
              validator: (value) => provider.alturavalidator(value,"Ingrese su altura"),
            ),
            STextFormField(
              hintText: 'Nivel de actvidad',
              controller: actividad,
              validator: (value) => provider.actividadvalidator(value, "valide su actividad"),
            ),
            SElevatedButton(
              text: "Datos",
              onPressed: (){
                if (formkey.currentState!.validate()){

            }else{
              
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