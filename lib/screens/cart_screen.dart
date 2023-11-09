import '../providers/locator.dart';
import '../services/cart_service.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartService cartService = getIt<CartService>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your cart'),
      ),
      body: ListenableBuilder(
        listenable: cartService,
        builder: (context, child) {
          if (cartService.products.isEmpty) {
            return const Center(
              child: Text('Your cart is empty'),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  final product = cartService.products[index];

                  return ListTile(
                    title: Text(product.name),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.remove_circle,
                        color: Colors.red,
                      ),
                      onPressed: () => cartService.removeProduct(product),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: cartService.products.length);
          }
        },
      ),
    );
  }
}
