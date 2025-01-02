import 'package:app/pages/calculadora_calorias.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';



class PantallaCalculadoraGrasa extends StatefulWidget {
  const PantallaCalculadoraGrasa({super.key});

  @override
  State<PantallaCalculadoraGrasa> createState() =>
      _PantallaCalculadoraGrasaState();
}

class _PantallaCalculadoraGrasaState extends State<PantallaCalculadoraGrasa> {
  String seleccionarGenero = "";
  String text1 = '';
  String pesotext = '';
  String edadtext = '';
  String alturatext = '';
  String cuellotext = '';
  String cinturatext = '';

  late TextEditingController pesoController;
  late TextEditingController edadController;
  //late TextEditingController alturaController;
  late TextEditingController cuelloController;
  late TextEditingController cinturaController;
  @override
   void initState(){
    super.initState();
    pesoController = TextEditingController();
    edadController = TextEditingController();
    //alturaController = TextEditingController();
    cuelloController = TextEditingController();
    cinturaController = TextEditingController();
   }
   @override
   void dispose(){
    pesoController.dispose();
    super.dispose();
   }
  
  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Porcentaje de Grasa"),
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
            const SizedBox(height: 15),
            //SizedBox(width: ancho * 0.05),
            Row(
            children: [
            Expanded(
              child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: ancho * 0.05),
                    child: TextField(
                      controller: edadController,
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
                      controller: pesoController,
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
                     // controller: alturaController,
                      onSubmitted: (String value){
                      },
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
                      controller: cuelloController,
                          decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ingresa el perimetro de tu cuello',
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
                      controller: cinturaController,
                          decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: 'Ingresa el perimetro de tu cintura',
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
                        borderRadius: BorderRadius.circular(5))),
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
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2A4365),
                    minimumSize: Size(ancho * 0.9, alto * 0.08),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child:  Text(
                  "text",
                  style: TextStyle(color: Colors.white),
                )
                ),
            const SizedBox(height: 15),
            
            

          
          ],
          ),
          
          
        ),
      ),
    );
  }
}