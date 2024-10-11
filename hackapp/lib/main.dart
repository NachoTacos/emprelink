import 'package:flutter/material.dart';
import 'home_screen.dart'; // Importa la pantalla de inicio
import 'qr_screen.dart'; // Importa la pantalla de escáner QR
import 'profile_screen.dart'; // Importa la pantalla de perfil

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navegación con Navbar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Lista de pantallas
  final List<Widget> _screens = [
    const HomeScreen(), // Pantalla de Inicio
    QRScreen( ),   // Pantalla de Escáner QR
    const ProfileScreen(),  // Pantalla de Perfil
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex], // Muestra la pantalla seleccionada
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Escanear QR',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped, // Cambia la pantalla al hacer tap
      ),
    );
  }
}
