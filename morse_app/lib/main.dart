import 'package:flutter/material.dart';
import 'ui.dart';

void main() => runApp(const MorseApp());

class MorseApp extends StatelessWidget {
  const MorseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Morse Translator',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MorseConverterScreen(),
    );
  }
}
