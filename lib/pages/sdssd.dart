import 'package:flutter/material.dart';

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
  final formkey = GlobalKey<FormState>();

  int _calorias = 0;

  @override
  Widget build(BuildContext context) {
    //double ancho = MediaQuery.of(context).size.width;
    //double alto = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora de Calorías"),
      ),
      body: Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          seleccionarGenero = "Hombre";
                        });
                      },
                      child: Text(
                        "Hombre",
                        style: TextStyle(
                          color: seleccionarGenero == "Hombre" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          seleccionarGenero = "Mujer";
                        });
                      },
                      child: Text(
                        "Mujer",
                        style: TextStyle(
                          color: seleccionarGenero == "Mujer" ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 13),
                TextFormField(
                  controller: edadController,
                  decoration: const InputDecoration(hintText: "Edad"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Ingrese su edad"
                      : null,
                ),
                TextFormField(
                  controller: pesoController,
                  decoration: const InputDecoration(hintText: "Peso (kg)"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Ingrese su peso"
                      : null,
                ),
                TextFormField(
                  controller: alturaController,
                  decoration: const InputDecoration(hintText: "Altura (cm)"),
                  validator: (value) => value == null || value.isEmpty
                      ? "Ingrese su altura"
                      : null,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      setState(() {
                        // Calcular calorías
                        double peso = double.tryParse(pesoController.text) ?? 0;
                        double altura = double.tryParse(alturaController.text) ?? 0;
                        double edad = double.tryParse(edadController.text) ?? 0;
                        _calorias = ((10 * peso) + (6.25 * altura) - (5 * edad) + 5).round();
                      });
                    }
                  },
                  child: const Text("Calcular Calorías"),
                ),
                const SizedBox(height: 20),
                if (_calorias > 0)
                  Text(
                    "Las calorías son: $_calorias",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
