import 'package:app/componts/mi_drawer.dart';
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
      drawer: MiDrawer(),
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