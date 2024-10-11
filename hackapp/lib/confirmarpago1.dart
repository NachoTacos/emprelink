import 'package:flutter/material.dart';
import 'confirmarpago2.dart';  // Importación del archivo

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
      home: const MetododePagoWidget(),
    );
  }
}

class MetododePagoWidget extends StatelessWidget {
  const MetododePagoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Pago'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(builder: (context))
            )
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTransactionDetails(),
            const SizedBox(height: 20),
            _buildPaymentMethod(),
            const SizedBox(height: 20),
            _buildExchangeDescription(),
            const Spacer(),
            _buildButtons(context),  // Pasamos el contexto aquí
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

  Widget _buildTransactionDetails() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalles de la Transacción',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Monto:'),
                Text(
                  '\$500.00',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Comisión (2%):'),
                Text(
                  '\$10.00',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Total a Pagar:',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$510.00',
                  style: TextStyle(color: Colors.blue, fontSize: 18),
                ),
              ],
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

  Widget _buildExchangeDescription() {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Descripción del Intercambio',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 10),
            Text('Compra de laptop usada'),
            SizedBox(height: 5),
            Text(
              'Asegúrate de verificar el estado del producto antes de confirmar la transacción.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            onPressed: () {
              // Acción para cancelar
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            child: const Text('Cancelar'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              // Navega a la pantalla confirmarpago2
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ConfirmarPago2Widget()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            child: const Text('Confirmar Pago'),
          ),
        ),
      ],
    );
  }
}
