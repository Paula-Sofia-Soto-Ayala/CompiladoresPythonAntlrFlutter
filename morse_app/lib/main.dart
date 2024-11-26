import 'package:flutter/material.dart';
import 'ui.dart';
import 'home_screen.dart'; // Importa la nueva página de inicio

void main() => runApp(const MorseApp());

class MorseApp extends StatelessWidget {
  const MorseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morse Translator',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/', // Ruta inicial
      routes: {
        '/': (context) => const HomeScreen(), // Página de inicio
        '/morse': (context) =>
            const MorseConverterScreen(), // Página del convertidor
      },
    );
  }
}
