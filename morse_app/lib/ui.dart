import 'package:flutter/material.dart';
import 'api_service.dart';

class MorseConverterScreen extends StatefulWidget {
  const MorseConverterScreen({super.key});

  @override
  State<MorseConverterScreen> createState() => _MorseConverterScreenState();
}

class _MorseConverterScreenState extends State<MorseConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _result = '';
  final ApiService _apiService = ApiService();

  // Función para convertir código Morse
  void _convertMorseCode() async {
    final morseCode = _controller.text.trim();
    if (morseCode.isEmpty) {
      setState(() {
        _result = 'Please enter valid Morse code.';
      });
      return;
    }
    final result = await _apiService.convertMorseToText(morseCode);
    setState(() {
      _result = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Morse Code Converter')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter Morse Code',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertMorseCode,
              child: const Text('Convert'),
            ),
            const SizedBox(height: 20),
            Text(
              'Result: $_result',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
