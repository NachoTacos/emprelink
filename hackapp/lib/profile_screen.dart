import 'package:flutter/material.dart';

// Pantalla de Mi Perfil
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String _email = 'usuario@email.com';
  String _nombre = 'Nombre del Usuario';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              backgroundImage:
                  AssetImage('assets/profile_pic.png'), // Imagen de perfil
            ),
            const SizedBox(height: 16),
            Text(
              _nombre,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Detalles de Cuenta'),
              subtitle: Text('Correo electrónico: $_email'),
              trailing: const Icon(Icons.edit),
              onTap: () {
                // Funcionalidad para editar detalles de la cuenta
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfileScreen(
                      email: _email,
                      nombre: _nombre,
                      onSave: (String nombre, String email) {
                        setState(() {
                          _email = email;
                          _nombre = nombre;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Agregar Método de Pago'),
              trailing: const Icon(Icons.credit_card),
              onTap: () {
                // Navegar a la pantalla para agregar tarjeta
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddPaymentScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Compras Recientes'),
              trailing: const Icon(Icons.history),
              onTap: () {
                // Navegar a la pantalla de compras recientes
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RecentPurchasesScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de edición de perfil
class EditProfileScreen extends StatefulWidget {
  final String email;
  final String nombre;
  final Function(String, String) onSave;

  const EditProfileScreen({
    Key? key,
    required this.email,
    required this.nombre,
    required this.onSave,
  }) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _emailController;
  late TextEditingController _nombreController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController(text: widget.email);
    _nombreController = TextEditingController(text: widget.nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nombreController,
              decoration: const InputDecoration(labelText: 'Nombre'),
            ),
            TextField(
              controller: _emailController,
              decoration:
                  const InputDecoration(labelText: 'Correo Electrónico'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                widget.onSave(
                  _nombreController.text,
                  _emailController.text,
                );
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla para agregar método de pago
class AddPaymentScreen extends StatefulWidget {
  const AddPaymentScreen({Key? key}) : super(key: key);

  @override
  _AddPaymentScreenState createState() => _AddPaymentScreenState();
}

class _AddPaymentScreenState extends State<AddPaymentScreen> {
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Método de Pago'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _cardNumberController,
              decoration: const InputDecoration(labelText: 'Número de Tarjeta'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _expiryDateController,
              decoration:
                  const InputDecoration(labelText: 'Fecha de Expiración'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _cvvController,
              decoration: const InputDecoration(labelText: 'CVV'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Simular guardado y mostrar mensaje
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Agregada exitosamente'),
                  ),
                );
                Navigator.pop(context); // Volver al área de perfil
              },
              child: const Text('Agregar Tarjeta'),
            ),
          ],
        ),
      ),
    );
  }
}

// Pantalla de Compras Recientes
class RecentPurchasesScreen extends StatelessWidget {
  const RecentPurchasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compras Recientes'),
      ),
      body: ListView(
        children: const <Widget>[
          ListTile(
            title: Text('Compra 1'),
            subtitle: Text('Importe: \$25.00\nNúmero de orden: 123456'),
          ),
          ListTile(
            title: Text('Compra 2'),
            subtitle: Text('Importe: \$15.00\nNúmero de orden: 123457'),
          ),
          // Agregar más compras aquí
        ],
      ),
    );
  }
}