import 'package:app/componts/mi_drawer.dart';
import 'package:app/componts/super_dropdownbuttonn.dart';
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
  final _formkey = GlobalKey<FormState>();

  int calorias = 0;
  int caloriasdef = 0;
  int caloriasvol = 0;
  int valorgenero = 0;
  double valoractividad = 0;
   
  @override
  void initState() {
    super.initState();
    final providerController = Provider.of<ControllersProviders>(context, listen: false);
    edadController.text = providerController.edad;
    pesoController.text = providerController.peso;
    alturaController.text = providerController.altura;
  }
  @override
  Widget build(BuildContext context) {
    
    final providerController = Provider.of<ControllersProviders>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calorias"),
      ),
      drawer: MiDrawer(),
      body: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
              const SizedBox(height: 5),
            SDropdownButton(
              //title: "1",
              items: ['Hombre','Mujer'],
              hint: "Selecciona un genero",
              icon: Icons.arrow_drop_down,
              onChanged: (String? newValue) {
                if (newValue == 'Hombre'){
                valorgenero = 5;
              } else  if (newValue == 'Mujer'){
                valorgenero = -161;
              }
            setState(() {
              Provider.of<ControllersProviders>(context,listen: false).updategenero(valorgenero);
              
            });
          },
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
            SDropdownButton(
              //title: "2",
              items: ['Sedentario ','Actividad ligera','Actividad moderada','Actividad intensa','Actividad muy intensa'],
              hint: "Selecciona tu actividad",
              icon: Icons.arrow_drop_down,
              onChanged: (String? newValue){
                if (newValue == 'Sedentario'){
                  valoractividad = 1.2;
                } else if(newValue == 'Actividad ligera'){
                  valoractividad = 1.375;
                } else if(newValue == 'Actividad moderada'){
                  valoractividad = 1.55;
                } else if(newValue =='Actividad intensa'){
                  valoractividad = 1.725;
                } else if(newValue == 'Actividad muy intensa'){
                  valoractividad = 1.9;
                }
                setState(() {
                  Provider.of<ControllersProviders>(context,listen: false). updateactividad(valoractividad);
                });
              }
              ),
            
            SElevatedButton(
              text: "Calcular",
              onPressed: (){
                if (_formkey.currentState!.validate()){
                  _formkey.currentState?.save();
                  setState(() {
                  calorias = providerController.calcularCalorias();
                  caloriasdef = calorias - 300;
                  caloriasvol = calorias + 300;
            });
            }           
              },
              ),
            
            if (calorias < 5000 && calorias > 500  )
                Text(
                  "Superavit son: $caloriasvol\n"
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