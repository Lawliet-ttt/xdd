import 'package:app/componts/mi_drawer.dart';
import 'package:app/componts/super_elevated_button.dart';
import 'package:app/componts/super_text_form_field.dart';
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

  final formKeys = GlobalKey<FormState>();
  final providerValidator = ValidatorsProviders();
   
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    final providerController = Provider.of<ControllersProviders>(context);
    
    edadController.text = providerController.edad;
    pesoController.text = providerController.peso;
    alturaController.text = providerController.altura;
    actividadController.text = providerController.actividad;
    cuelloController.text = providerController.cuello;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Porcentaje de Grasa"),
      ),
      drawer: MiDrawer(),
      body: Form(
        key: formKeys,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: ancho * 0.05),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: seleccionarGenero == "Hombre"
                            ? const Color(0xFF1E3A8A) //[800]
                            : const Color(0xFF2A4365),
                        minimumSize: Size(ancho * 0.43, alto * 0.08),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))
                        //elevation: seleccionarGenero == "Hombre" ? 10:2
                        ),
                    onPressed: () {
                      setState(() {
                        seleccionarGenero = "Hombre";
                      });
                    },
                    child: const Text(
                      "Hombre",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: ancho * 0.04),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: seleccionarGenero == "Mujer"
                            ? const Color(0xFF1E3A8A)
                            : const Color(0xFF2A4365),
                        minimumSize: Size(ancho * 0.43, alto * 0.08),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))
                        //elevation: seleccionarGenero == "Mujer" ? 10:2
                        ),
                    onPressed: () {
                      setState(() {
                        seleccionarGenero = "Mujer";
                      });
                    },
                    child: const Text(
                      "Mujer",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: ancho * 0.05),
                ],
              ),
              const SizedBox(height: 15),
              //SizedBox(width: ancho * 0.05),
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
              if(formKeys.currentState!.validate()){
                formKeys.currentState?.save();
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