import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../providers/locator.dart';
import '../services/cart_service.dart';
import '../services/product_service.dart';
import '../widgets/cart_button.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartService = getIt<CartService>();
    final productService = getIt<ProductService>();
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product list'),
        actions: const [
          CartButton(),
        ],
      ),
      body: ListenableBuilder(
        listenable: cartService,
        builder: (context, child) => ListView.separated(
          itemBuilder: (context, index) {
            final product = productService.products[index];
            final isAlreadyInCart = cartService.products.contains(product);

            return ListTile(
              title: Text(product.name),
              subtitle: Text(
                product.description,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black38,
                    ),
              ),
              leading: Icon(
                Icons.shopping_cart,
                color: isAlreadyInCart ? Colors.green : Colors.transparent,
              ),
              trailing: Text(
                formatter.format(product.price),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.black54,
                    ),
              ),
              onTap: isAlreadyInCart
                  ? null
                  : () => cartService.addProduct(product),
            );
          },
          separatorBuilder: (context, index) => const Divider(),
          itemCount: productService.products.length,
        ),
      ),
    );
  }
}
