import 'dart:convert';

import 'package:app_flutter/widgets/column_gap.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "http://192.168.18.34:5000/api";
  final textController = TextEditingController();
  Future<Response>? _response;

  void onPressed() {
    Map<String, String> headers = {'Content-Type': 'application/json'};
    String body = json.encode({'text': textController.value.text});

    _response = post(Uri.parse(url), body: body, headers: headers);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter 💖 Python'),
        centerTitle: true,
      ),
      body: MyColumn(
        padding: const EdgeInsets.all(36.0),
        gap: 20.0,
        children: [
          const Text('Mensaje:'),
          TextField(controller: textController),
          ElevatedButton(onPressed: onPressed, child: const Text('Enviar')),
          const Text('Imagen:'),
          _image(),
        ],
      ),
    );
  }

  Widget _image() {
    return FutureBuilder(
        future: _response,
        builder: (context, snapshot) {
          final response = snapshot.data;

          if (response == null) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return Image.memory(response.bodyBytes);
          }

          return const Text('Hubo en error en la carga de la imagen');
        });
  }
}
