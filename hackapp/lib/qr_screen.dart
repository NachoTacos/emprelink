import 'package:flutter/material.dart';

class QRScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escanear QR'),
      ),
      body: const Center(
        child: Text('Pantalla de escaneo de código QR'),
      ),
    );
  }
}
