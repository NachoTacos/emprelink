import 'package:flutter/material.dart';
import 'package:hackapp/components/ProductCard.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: const Text('Catalogo de Productos'),
      centerTitle: true,
     backgroundColor: Colors.blueGrey[50],
    ),
    body: const Column(
      children: [
        ProductCard(title: 'Hamburguesa',color: Colors.white, description: '40.99',imageUrl: 'https://media.istockphoto.com/id/1398630614/es/foto/hamburguesa-con-queso-de-tocino-en-un-bollo-tostado.jpg?s=1024x1024&w=is&k=20&c=n2CLk2LtRwFgQsXfQlJsx2l9fkeXzwVSaV1-ykYziDM='),
        ProductCard(title: 'Hot dog',color: Colors.white, description: "20.99",imageUrl: 'https://media.istockphoto.com/id/1398630614/es/foto/hamburguesa-con-queso-de-tocino-en-un-bollo-tostado.jpg?s=1024x1024&w=is&k=20&c=n2CLk2LtRwFgQsXfQlJsx2l9fkeXzwVSaV1-ykYziDM='),
        ProductCard(title: 'Menudo',color: Colors.white, description: '69.99',imageUrl: 'https://media.istockphoto.com/id/1398630614/es/foto/hamburguesa-con-queso-de-tocino-en-un-bollo-tostado.jpg?s=1024x1024&w=is&k=20&c=n2CLk2LtRwFgQsXfQlJsx2l9fkeXzwVSaV1-ykYziDM='),
        ProductCard(title: 'Tamales',color: Colors.white, description: '89.99 ',imageUrl: 'https://media.istockphoto.com/id/1398630614/es/foto/hamburguesa-con-queso-de-tocino-en-un-bollo-tostado.jpg?s=1024x1024&w=is&k=20&c=n2CLk2LtRwFgQsXfQlJsx2l9fkeXzwVSaV1-ykYziDM='),
        ProductCard(title: 'Waffles',color: Colors.white, description: '110.99',imageUrl: 'https://media.istockphoto.com/id/1398630614/es/foto/hamburguesa-con-queso-de-tocino-en-un-bollo-tostado.jpg?s=1024x1024&w=is&k=20&c=n2CLk2LtRwFgQsXfQlJsx2l9fkeXzwVSaV1-ykYziDM='),
      ],
      
    )
  ),
));

