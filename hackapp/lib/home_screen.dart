import 'package:flutter/material.dart';
import 'catalogo_productos.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Acceder a menú'),
        ),
      ),
    );
  }
}
