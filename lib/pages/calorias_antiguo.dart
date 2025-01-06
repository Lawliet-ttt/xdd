import 'package:app/componts/mi_drawer.dart';
import 'package:flutter/material.dart';

class PantallaCalculadoraGrasaxd extends StatefulWidget {
  const PantallaCalculadoraGrasaxd({super.key});

  @override
  State<PantallaCalculadoraGrasaxd> createState() => _PantallaCalculadoraGrasaxd();
}

class _PantallaCalculadoraGrasaxd extends State<PantallaCalculadoraGrasaxd> {
  

  final _weightController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();

  List<String> list = <String> ['Hombre','Mujer'];

  final List<DropdownMenuEntry<String>> dropdownMenuEntries = [
    const DropdownMenuEntry(value: 'Hombre', label: 'Hombre'),
    const DropdownMenuEntry(value: 'Mujer', label: 'Mujer')
  ];

  String _genero = "Hombre";
  double? _resultado;
  double? _imc;

  void _calcularGrasa(){
    String pesoText = _weightController.text;
    String edadText = _ageController.text;
    String alturaText = _heightController.text;

    if ( pesoText.isEmpty || edadText.isEmpty || alturaText.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Por favor, completa todos los campos"))
        );
      return;

    }

    double peso = double.tryParse(pesoText) ?? 0;
    double edad = double.tryParse(edadText) ?? 0;
    double altura = double.tryParse(alturaText) ?? 0;

    if(peso <= 1 || peso >= 350){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ingresar un peso valido"))
        );
        return;
    }

    if (edad <= 1 || edad >= 150) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ingresar una edad valida"))
      );
      return;
    }
    

    if (altura <= 54 || altura >= 273) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ingresar una altura valida"))
        );
        return;
    }
    
    double alturaEnMetros = altura/100;
    double grasaCorporal;

    double indice = peso/(alturaEnMetros*alturaEnMetros);

    if (_genero == 'Hombre') {
      grasaCorporal = (1.20 * indice) + (0.23 * edad) - 16.2;
    } else { 
      grasaCorporal = (1.20 * indice) + (0.23 * edad) - 5.4;
    }

    setState(() {
      _resultado = grasaCorporal;
    });

    setState(() {
      _imc =indice;
    });
  }

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double alto = MediaQuery.of(context).size.height;

    return   Scaffold(
      appBar: AppBar(
        title: Text("Antiguo"),
      ),
      drawer: MiDrawer(),
        body: SingleChildScrollView(
          child : Center(
            child: Column(
              
            mainAxisAlignment: MainAxisAlignment.center,
            

          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(padding: EdgeInsets.all(alto*0.03)
             ),
             const Text("Calculadora",
             style: TextStyle(
              color: Color(0xFF1A237E),
              fontWeight: FontWeight.bold,
              fontSize: 20
              ),
              ),
                Padding(padding: EdgeInsets.all(alto*0.03)
             ),
              ],
            ),
             
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                
                SizedBox(
                width: ancho*0.4,
                height: alto*0.26,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("    Peso (Kg)",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1A237E)),
                      ),
                    ),
                    SizedBox(height: alto*0.01,),
                  TextField(
                controller: _weightController,
                decoration:   InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xFF000000 ),
                  //width: 2.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color(0xFF000000 ),
                   // width: 2.5
                  ),
                ),
                labelText: "Introduce tu peso",
                labelStyle:  
                const TextStyle(
                color: Color(0xFF000000), 
                fontSize: 15,
                //fontWeight: FontWeight.bold
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never
                ),
                keyboardType: TextInputType.number,
                style:  const TextStyle(
                  color: Color(0xFF000000)),
              ),
                  ],
                )
                
            ),


            //EDAD
               SizedBox(
                width: ancho*0.4,
                height: alto*0.26,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("    Edad",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1A237E)),
                      ),
                    ),
                    SizedBox(height: alto*0.01,),
                  TextField(
                controller: _ageController,
                decoration:   InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xFF000000 ),
                  //width: 2.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color(0xFF000000 ),
                   // width: 2.5
                  ),
                ),
                labelText: "Introduce tu edad",
                labelStyle:  
                const TextStyle(
                color: Color(0xFF000000), 
                fontSize: 15,
                //fontWeight: FontWeight.bold
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never
                ),
                keyboardType: TextInputType.number,
                style:  const TextStyle(
                  color: Color(0xFF000000)),
              ),
                  ],
                )
                
            ),


            ],

            ),
            const SizedBox(width: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                
                SizedBox(
                width: ancho*0.4,
                height: alto*0.26,
                child: Column(
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("    Altura",style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1A237E)),
                      ),
                    ),
                    SizedBox(height: alto*0.01,),
                  TextField(
                controller: _heightController,
                decoration:   InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Color(0xFF000000 ),
                  //width: 2.5,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(
                    color: Color(0xFF000000 ),
                   // width: 2.5
                  ),
                ),
                labelText: "Introduce tu altura",
                labelStyle:  
                const TextStyle(
                color: Color(0xFF000000), 
                fontSize: 15,
                //fontWeight: FontWeight.bold
                ),
                floatingLabelBehavior: FloatingLabelBehavior.never
                ),
                keyboardType: TextInputType.number,
                style:  const TextStyle(
                  color: Color(0xFF000000)),
              ),
                  ],
                )
                
            ),

            SizedBox(
  width: ancho * 0.4,
  height: alto * 0.25,
  child: Column(
    children: [
      const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "    Genero", 
          style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF1A237E)),
        ),
      ),
      SizedBox(
        width: ancho * 0.4,
        child: DropdownButtonFormField<String>(
          value: _genero,
          decoration: InputDecoration(
            // El borde se mantiene igual en todos los estados.
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF000000), // Color del borde
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF000000), // Color del borde cuando tiene el foco
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0xFF000000), // Color del borde por defecto
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: const Color(0xFFFFFFFF), // Color de fondo siempre blanco
            filled: true, // Rellena con el color especificado
          ),
          items: list.map((String genero) {
            return DropdownMenuItem<String>(
              value: genero,
              child: Text(
                genero,
                style: const TextStyle(
                  color: Color(0xFF000000), // Estilo del texto
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              _genero = newValue!;
            });
          },
          style: const TextStyle(color: Color(0xFF000000)), // Estilo del texto
          iconEnabledColor: const Color(0xFF000000),
           // Color del icono del dropdown
          dropdownColor: const Color(0xFFFFFFFF), // Color del fondo del menu desplegable
           // Remueve la línea de abajo
        ),
      ),
    ],
  ),
)

              ]
                ),
              ElevatedButton(
                onPressed: _calcularGrasa,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFFFF),
                  foregroundColor: const Color(0xFF000000),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
                  minimumSize: Size(ancho*0.14, alto*0.09),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: const BorderSide(
                      color: Colors.black
                    )
                  )
                  
                ), 
                child: const Text("Calcular",style: TextStyle(color: Color(0xFF1A237E)),),
                ),
                SizedBox(height: alto*0.05),
                Column(
                  children: [
                    if (_resultado != null && (_resultado! <= 1 || _resultado! >= 70))
                const Text(
                "El cálculo no es realista, verifica tus datos.",
                style: TextStyle(color: Color(0xFF1A237E),
                fontWeight: FontWeight.bold
                ),
                ),
                if (_resultado != null && _resultado! > 1 && _resultado! < 70)
                Text(
                "Tu porcentaje de grasa es ${_resultado!.toStringAsFixed(1)}% y tu IMC es ${_imc!.toStringAsFixed(1)}",
                style: const TextStyle(color: Color(0xFF1A237E),
                fontWeight: FontWeight.bold),
                ),
                  ],
                )
          
          ],
          
                 
            
       
        ),
          )
        
        ),
              );
        
  }
}