import 'package:flutter/material.dart';

import '../providers/locator.dart';
import '../screens/cart_screen.dart';
import '../services/cart_service.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = getIt<CartService>();
    return TextButton(
        onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const CartScreen(),
              ),
            ),
        child: Row(
          children: [
            const Icon(Icons.shopping_cart),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: ListenableBuilder(
                listenable: cartService,
                builder: (context, child) =>
                    Text('Cart: ${cartService.products.length}'),
              ),
            )
          ],
        ));
  }
}
