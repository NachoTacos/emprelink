import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Confirmación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ConfirmacionWidget(),
    );
  }
}

class ConfirmacionWidget extends StatefulWidget {
  const ConfirmacionWidget({super.key});

  @override
  State<ConfirmacionWidget> createState() => _ConfirmacionWidgetState();
}

class _ConfirmacionWidgetState extends State<ConfirmacionWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white, // Cambiado a color nativo
        appBar: AppBar(
          backgroundColor: Colors.blueGrey[50], // Cambiado a color nativo
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Transacción exitosa',
              style: TextStyle(
                fontFamily: 'Inter Tight',
                color: Colors.black,
                fontSize: 22,
                letterSpacing: 0.0,
              ),
            ),
          ),
          centerTitle: true, // Ajustado para centrar el título
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: const AlignmentDirectional(0, -1),
                child: Container(
                  width: 400,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[50], // Cambiado a color nativo
                    borderRadius: BorderRadius.circular(8),
                    shape: BoxShape.rectangle,
                  ),
                  child: Align(
                    alignment: const AlignmentDirectional(0, 0),
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: Image.network(
                          'https://i.pinimg.com/originals/a1/05/7d/a1057dcb644d8729f4f76b2032f21743.gif',
                          width: 320,
                          height: 320,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0, 0),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    'Su pago ha sido procesado exitosamente',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 22,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const Align(
                alignment: AlignmentDirectional(0, 1),
                child: Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    'Recibirás un correo electrónico con los detalles de tu transacción. También podrás ver tus transacciones en la aplicación.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      letterSpacing: 0.0,
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print('Button pressed ...');
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 20),
                  backgroundColor: Colors.blue, // Color del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text(
                  'Listo',
                  style: TextStyle(
                    fontFamily: 'Inter Tight',
                    color: Colors.white,
                    fontSize:
                        18, // Cambié de 80 a 18 para evitar problemas de tamaño
                    letterSpacing: 0.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
