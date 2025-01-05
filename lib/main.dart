import 'package:app/pages/login.dart';
import 'package:app/providers/calorias.providers.dart';
import 'package:app/providers/controllers_providers.dart';
import 'package:app/providers/validators_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ValidatorsProviders()),
        ChangeNotifierProvider(create: (context)=> ControllersProviders())
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2A4365)),
          useMaterial3: true,
          scaffoldBackgroundColor: const Color(0xFFF5F5F5)),
      home: const PantallaInicio(),
    ),
      );
  }
}