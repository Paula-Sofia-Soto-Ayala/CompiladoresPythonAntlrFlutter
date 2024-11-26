import 'dart:convert'; // Para convertir JSON
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl =
      "https://morse-api-latest-locf.onrender.com/morse_to_text";

  Future<String> convertMorseToText(String morseCode) async {
    try {
      // Preparar la solicitud POST
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'sentence': morseCode
        }), // El campo "sentence" se agrega automáticamente
      );

      // Verificar la respuesta
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['result'] ?? 'No result received.';
      } else {
        return 'Error: ${response.reasonPhrase} (Code: ${response.statusCode})';
      }
    } catch (e) {
      return 'Error: $e'; // Manejo de errores
    }
  }
}
