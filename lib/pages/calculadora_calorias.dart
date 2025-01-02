import 'package:app/componts/edit_elevated_button.dart';
import 'package:app/componts/super_elevated_button.dart';
import 'package:app/componts/super_text_form_field.dart';
import 'package:app/pages/calculadora_grasa.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';
class PantallaCalculadoraCalorias extends StatefulWidget {
  const PantallaCalculadoraCalorias({super.key});

  @override
  State<PantallaCalculadoraCalorias> createState() => _PantallaCalculadoraCaloriasState();
}

class _PantallaCalculadoraCaloriasState extends State<PantallaCalculadoraCalorias> {
  String seleccionarGenero = "";
  @override
  
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calorias"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const SizedBox(
              height: 25,
            ),
            ListTile(
              leading: const Icon(Icons.account_circle_sharp),
              title: const Text("Perfil"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PantallaInicio()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.calculate_sharp),
              title: const Text("Calculadora"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PantallaCalculadoraGrasa()));
              },
            ),
            ListTile(
                leading: Icon(Icons.calculate_sharp),
                title: Text("Calcular Calorias"),
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => PantallaCalculadoraCalorias(),
                  ),
                  );
                },
              )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //SizedBox(width: ancho * 0.05),
                EElevatedButton(
                  text: "Hombre",

                  isSelected: true,
                  isSelectable: seleccionarGenero == "Hombre",
                  onPressed: (){

                  seleccionarGenero = "Hombre"; 
                }
                ),
                //SizedBox(width: ancho * 0.04),
                EElevatedButton(
                  text: "Mujer",

                  isSelected: true,
                  isSelectable: seleccionarGenero == "Mujer",
                  onPressed: (){
                  seleccionarGenero = "Mujer";
                }
                ),

                //SizedBox(width: ancho * 0.05),
              ],
            ),
          const SizedBox(height: 13),
          STextFormField(
            hintText: "Ingresa tu Edad",
          ),
          STextFormField(
            hintText: "Ingresa tu Peso",
          ),
          STextFormField(
            hintText: "Ingresa Tu Altura",
          ),
          STextFormField(
            hintText: 'Ingresa el nivel de actvidad',
          ),
          SElevatedButton(
            text: "Datos",
            onPressed: (){},
          )
          ],
          ),
          
          
        ),
      ),
    );
  }
}