import 'package:flutter/material.dart';

// Paleta de colores
const Color navyGray = Color(0xFF253031);
const Color greenBlue = Color(0xFFB88C9E);
const Color blueCake = Color(0xFF2978A0);
const Color goldCake = Color(0xFFBCAB79);
const Color cyanBlueCake = Color(0xFFC6E0FF);
const Color pinkCake = Color(0xFFB88C9E);
const Color neonChingaVista = Color(0xFFE0FF4F);

// Clase que representa un pedido
class Order {
  final String id;
  String status;

  Order({required this.id, required this.status});
}

// Clase que representa el estado de una mesa
class TableStatus {
  final String id;
  String status;

  TableStatus({required this.id, required this.status});
}

// Clase que representa un producto del menú
class Product {
  String name;
  double price;
  String description;

  Product({required this.name, required this.price, required this.description});
}

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pantalla de Administrador',
      theme: ThemeData(
        primaryColor: blueCake,
        appBarTheme: AppBarTheme(
          backgroundColor: blueCake,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: navyGray),
          bodyMedium: TextStyle(color: greenBlue),
        ),
      ),
      home: AdminScreen(),
    );
  }
}

class AdminScreen extends StatefulWidget {
  @override
  _AdminScreenState createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  // Lista de pedidos, mesas y productos
  List<Order> orders = [
    Order(id: '1', status: 'En curso'),
    Order(id: '2', status: 'Completado'),
    Order(id: '3', status: 'En curso'),
  ];

  List<TableStatus> tables = [
    TableStatus(id: '1', status: 'Disponible'),
    TableStatus(id: '2', status: 'Ocupada'),
    TableStatus(id: '3', status: 'En Limpieza'),
  ];

  List<Product> products = [
    Product(
        name: 'Pizza Clásica',
        price: 8.99,
        description: 'Deliciosa pizza con queso y tomate.'),
    Product(
        name: 'Hamburguesa Doble',
        price: 12.50,
        description: 'Hamburguesa con doble carne y queso.'),
    Product(
        name: 'Pasta Alfredo',
        price: 9.99,
        description: 'Pasta con salsa Alfredo.'),
    Product(
        name: 'Ensalada César',
        price: 7.50,
        description: 'Ensalada fresca con aderezo César.'),
    Product(
        name: 'Tacos de Carne',
        price: 6.99,
        description: 'Tacos rellenos de carne.'),
  ];

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  void addProduct() {
    if (nameController.text.isNotEmpty &&
        priceController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      setState(() {
        products.add(Product(
          name: nameController.text,
          price: double.parse(priceController.text),
          description: descriptionController.text,
        ));
        // Limpiar los campos del formulario
        nameController.clear();
        priceController.clear();
        descriptionController.clear();
      });
    }
  }

  void deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  List<Widget> buildInitialProductList() {
    return products.take(3).map((product) {
      int index = products.indexOf(product);
      return ProductCard(
        product: product,
        onDelete: () => deleteProduct(index),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de Administrador'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildSectionTitle('Gestión de Pedidos'),
            ...orders.map((order) => OrderCard(order: order)).toList(),
            SizedBox(height: 20),
            buildSectionTitle('Gestión de Mesas'),
            ...tables.map((table) => TableCard(table: table)).toList(),
            SizedBox(height: 20),
            buildSectionTitle('Gestión de Productos'),
            ...buildInitialProductList(),
            if (products.length > 3) buildViewMoreProductsButton(context),
            SizedBox(height: 20),
            buildAddProductForm(),
            SizedBox(height: 20),
            buildSectionTitle('Reportes de Ventas'),
            SalesReportButton(onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SalesReportDialog(),
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Text(title,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold));
  }

  Widget buildViewMoreProductsButton(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductListScreen(products: products)),
        );
      },
      child: Text('Ver más productos'),
    );
  }

  Widget buildAddProductForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Agregar Producto', style: TextStyle(fontSize: 22)),
        TextField(
          controller: nameController,
          decoration: InputDecoration(labelText: 'Nombre del Producto'),
        ),
        TextField(
          controller: priceController,
          decoration: InputDecoration(labelText: 'Precio'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: descriptionController,
          decoration: InputDecoration(labelText: 'Descripción'),
        ),
        ElevatedButton(
          onPressed: addProduct,
          child: Text('Agregar Producto'),
        ),
      ],
    );
  }
}

// Widget que representa cada pedido en una tarjeta
class OrderCard extends StatelessWidget {
  final Order order;

  const OrderCard({required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: goldCake, // Color para los pedidos
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('Pedido #${order.id}'),
        trailing: DropdownButton<String>(
          value: order.status,
          onChanged: (String? newValue) {
            order.status = newValue!;
          },
          items: <String>['En curso', 'Completado']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Widget que representa cada mesa en una tarjeta
class TableCard extends StatelessWidget {
  final TableStatus table;

  const TableCard({required this.table});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: greenBlue, // Color para las mesas
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('Mesa #${table.id}'),
        trailing: DropdownButton<String>(
          value: table.status,
          onChanged: (String? newValue) {
            table.status = newValue!;
          },
          items: <String>['Disponible', 'Ocupada', 'En Limpieza']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}

// Widget que representa cada producto en una tarjeta
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onDelete;

  const ProductCard({required this.product, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cyanBlueCake, // Color para los productos
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(product.name),
        subtitle: Text(
            'Precio: \$${product.price.toStringAsFixed(2)}\nDescripción: ${product.description}'),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: onDelete,
        ),
      ),
    );
  }
}

// Pantalla para ver todos los productos
class ProductListScreen extends StatelessWidget {
  final List<Product> products;

  const ProductListScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todos los Productos'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ProductCard(
            product: product,
            onDelete: () {
              // Lógica para eliminar un producto (esto debería ser manejado por el estado)
            },
          );
        },
      ),
    );
  }
}

// Botón para ver reportes de ventas
class SalesReportButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SalesReportButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text('Generar Reporte de Ventas'),
    );
  }
}

// Diálogo para mostrar reportes de ventas
class SalesReportDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Reporte de Ventas'),
      content: Text('Aquí van los detalles de las ventas...'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cerrar'),
        ),
      ],
    );
  }
}
