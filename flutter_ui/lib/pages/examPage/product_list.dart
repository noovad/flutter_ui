import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {"name": "Nike Shoes", "price": "\$100", "image": "https://via.placeholder.com/150"},
      {"name": "Adidas Bag", "price": "\$80", "image": "https://via.placeholder.com/150"},
      {"name": "Rolex Watch", "price": "\$300", "image": "https://via.placeholder.com/150"},
    ];

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: ListTile(
            leading: Image.network(products[index]["image"]!),
            title: Text(products[index]["name"]!),
            subtitle: Text(products[index]["price"]!),
            trailing: const Icon(Icons.add_shopping_cart),
          ),
        );
      },
    );
  }
}
