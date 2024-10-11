import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pago',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResumenPagoScreen(),
    );
  }
}

class ResumenPagoScreen extends StatelessWidget {
  const ResumenPagoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Pago'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionSummary(),
            const SizedBox(height: 20),
            _buildPaymentMethod(),
            const SizedBox(height: 20),
            _buildPasswordConfirmation(),
            const Spacer(),
            _buildConfirmButton(),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Al confirmar, aceptas los términos y condiciones de nuestra política de transacciones seguras.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTransactionSummary() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Resumen de la Transacción',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Monto a Pagar:'),
                Text(
                  '\$510.00',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 5),
            const Text(
              'Incluye comisión del 2%',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethod() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: ListTile(
        leading: const Icon(Icons.credit_card, color: Colors.purple),
        title: const Text('Método de Pago'),
        subtitle: const Text('Tarjeta Vinculada •••• 1234'),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Acción al tocar Método de Pago
        },
      ),
    );
  }

  Widget _buildPasswordConfirmation() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Confirmar con Contraseña',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            const TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Ingresa tu contraseña',
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'La contraseña es necesaria para autorizar la transacción',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Acción para confirmar pago
        },
        style: ElevatedButton.styleFrom(
          backgroundColor:
              Colors.blue, // Cambiado de 'primary' a 'backgroundColor'
          padding: const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: const Text('Confirmar Pago', style: TextStyle(fontSize: 16)),
      ),
    );
  }
}
