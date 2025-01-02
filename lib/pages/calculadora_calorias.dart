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
    String text = '';
  @override
  
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
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
            //SizedBox(width: ancho * 0.05),
            const SizedBox(height: 15),
            Row(
            children: [
            Expanded(
              child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.05),
                    child: TextField(
                          decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ingresa tu edad',
          ),
          ),
          ),
          ),
          ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
            Expanded(
              child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.05),
                    child: TextField(
                          decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ingresa tu peso',
          ),
          ),
          ),
          ),
          ],
          ),
          const SizedBox(height: 15),
          Row(
            children: [
            Expanded(
              child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.05),
                    child: TextField(
                          decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ingresa tu altura',
          ),
          ),
          ),
          ),
          ],
          ),
          
            const SizedBox(height: 15),
            Row(
            children: [
            Expanded(
              child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.05),
                    child: TextField(
                          decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ingresa el nivel de actvidad',
          ),
          ),
          ),
          ),
          ],
          ),
          const SizedBox(height: 15),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: ancho * 0.05),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A4365),
                    minimumSize: Size(ancho * 0.9, alto * 0.08),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                        )
                        ),
                onPressed: () {},
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white),
                )
                ),
                SizedBox(width: ancho * 0.05),
              ],
            ),
            const SizedBox(height: 15),
            STextFormField(
              hintText: "Datos",
            )
          ],
          ),
          
          
        ),
      ),
    );
  }
}