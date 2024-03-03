import 'dart:io';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const scriptPath = "../image_to_excel.py";
    String excelPath = "";
    String photoPath = "";
    String coordsText = "";

    void ejecutarScript() {
      Process.run('python', [scriptPath, excelPath, photoPath, coordsText]);
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.15),
            borderRadius: BorderRadius.circular(12.0),
          ),
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                _title('Colocar imágenes en Excel'),
                _space(),
                _textField("Ruta del Excel", (val) => excelPath = val),
                _space(),
                _textField("Ruta de la imagen", (val) => photoPath = val),
                _space(),
                _textField("Coordenadas", (val) => coordsText = val),
                _space(),
                ElevatedButton(
                  onPressed: ejecutarScript,
                  child: const Text("Colocar imágen"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _textField(String title, ValueChanged<String> onChanged) {
    return TextField(
      decoration: InputDecoration(labelText: title),
      onChanged: onChanged,
    );
  }

  Widget _title(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18.0,
      ),
    );
  }

  Widget _space() => const SizedBox(height: 8.0);
}
