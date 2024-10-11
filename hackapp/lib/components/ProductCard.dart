import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;  // Prop para la URL de imagen
  final Color color;

  const ProductCard({
    Key? key,
    required this.title,
    required this.color,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200,  // Altura definida
        child: Card(
          color: color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Imagen
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Image.network(
                    imageUrl,
                    width: 130,
                    height: 130,
                  ),
                ),
                const SizedBox(width: 10),  // Espacio entre la imagen y el texto
                // Column para las etiquetas de texto
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                        maxLines: 3,  // Limitar a 3 líneas
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Botón con ícono de carrito
                IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  color: Colors.black,
                  onPressed: () {
                    // Acción al presionar el botón
                    print('Carrito de compras presionado');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
