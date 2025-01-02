import 'package:app/pages/calculadora_calorias.dart';
import 'package:app/pages/calculadora_grasa.dart';
import 'package:flutter/material.dart';

class PantallaInicio extends StatefulWidget {
  const PantallaInicio({super.key});

  @override
  State<PantallaInicio> createState() => _PantallaInicioState();
}

class _PantallaInicioState extends State<PantallaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Prueba"),
        centerTitle: false,
      ),
      drawer: Drawer(
        child: ListView(
          //padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 25,
            ),
              ListTile(
                leading: Icon(Icons.account_circle_sharp),
                title: Text("Perfil"),
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context)=> PantallaInicio()
                    )
                    );
                },
              ),
              ListTile(
                leading: Icon(Icons.calculate_sharp),
                title: Text("Calcular Porcentaje de Grasa"),
                onTap: (){
                  Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => PantallaCalculadoraGrasa(),
                  ),
                  );
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
      body: Center(
        child: Column(
          children: [
            Text("Hola")
          ],
        ),
        //mainAxisAlignment: MainAxisAlignment.center,
        
      ),
    );
  }
}