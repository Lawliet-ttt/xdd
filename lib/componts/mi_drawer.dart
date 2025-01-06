import 'package:app/pages/calculadora_calorias.dart';
import 'package:app/pages/calculadora_grasa.dart';
import 'package:app/pages/calorias_antiguo.dart';
import 'package:app/pages/login.dart';
import 'package:flutter/material.dart';
class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.account_circle_sharp),
            title: Text("Perfil"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> PantallaInicio()
                  )
                  );
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate_sharp),
            title: Text("Calcular Calorias"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> PantallaCalculadoraCalorias()
                  )
                  );
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate_sharp),
            title: Text("Calculadora"),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context)=> PantallaCalculadoraGrasa()
                  )
                  );
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate_sharp),
            title: Text("Calculadora Antigua"),
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                  builder: (context)=>PantallaCalculadoraGrasaxd()
                  )
                  );
            },
          )
        ],
      ),
    );
  }
}