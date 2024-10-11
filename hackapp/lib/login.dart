import 'package:flutter/material.dart';
import 'main.dart'; // Importamos 'main.dart' para acceder a 'HomePage'

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'SIGN IN',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField('Username or Email'),
              const SizedBox(height: 16),
              _buildTextField('Password', obscureText: true),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot your password?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 20),
              _buildSubmitButton(context), // Pasamos el contexto
              const SizedBox(height: 20),
              const Text(
                'Sign in with',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 20),
              _buildSocialLoginButtons(),
              const SizedBox(height: 20),
              const Text(
                "Don't have an account? Sign Up",
                style: TextStyle(color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {bool obscureText = false}) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navegar a la pantalla de HomePage en main.dart
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()), // Aquí navega a HomePage
          );
        },
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text('Submit', style: TextStyle(fontSize: 16)),
      ),
    );
  }

  Widget _buildSocialLoginButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSocialButton(Icons.facebook, Colors.blue),
        const SizedBox(width: 10),
        _buildSocialButton(Icons.alternate_email, Colors.lightBlue),
        const SizedBox(width: 10),
        _buildSocialButton(Icons.g_mobiledata, Colors.red),
      ],
    );
  }

  Widget _buildSocialButton(IconData icon, Color color) {
    return InkWell(
      onTap: () {
        // Acción para iniciar sesión con redes sociales
      },
      child: CircleAvatar(
        radius: 25,
        backgroundColor: color,
        child: Icon(icon, color: Colors.white),
      ),
    );
  }
}
