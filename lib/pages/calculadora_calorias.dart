import 'package:app/componts/mi_drawer.dart';
import 'package:app/componts/super_elevatedbuttonn.dart';
import 'package:app/componts/super_textformfieldd.dart';
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

  int calorias = 0;
  int caloriasdef = 0;
   
  @override 

  Widget build(BuildContext context) {
    
    final providerController = Provider.of<ControllersProviders>(context);

    //double ancho = MediaQuery.of(context).size.width;
    //double alto = MediaQuery.of(context).size.height;
    
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
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SElevatedButton(
                    text: "Hombre",
                    //widthFactor:ancho * 0.43 ,
                    //widthHeight: alto * 0.08,
                    /*
                    isSelected: true,
                    isSelectable: seleccionarGenero == "Mujer",
                    */
                    onPressed: (){
                    //seleccionarGenero = "Mujer";
                  }
                  ),
                  SElevatedButton(
                    text: "Mujer",
                    //widthFactor:ancho * 0.43 ,
                    //widthHeight: alto * 0.08,
                  
                    /*
                    isSelected: true,
                    isSelectable: seleccionarGenero == "Mujer",
                    */
                    onPressed: (){
                    //seleccionarGenero = "Mujer";
                  }
                  ),
                ],
              ),
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
              onSaved: (value) => providerController.updatepeso(value?? ''),
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
              text: "Calcular",
              onPressed: (){
                if (formkey.currentState!.validate()){
                  formkey.currentState?.save();
                  setState(() {
                  calorias = providerController.calcularCalorias();
                  caloriasdef = calorias - 300;
            });
            }           
              },
              ),
            
            if (calorias < 5000 && calorias > 500  )
                Text(
                  "Las calorías calculadas son: $calorias\n"
                  "Deficit son: $caloriasdef\n" ,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
            
            ],
            ),
          ),
        ),
      ),
    );
  }
}