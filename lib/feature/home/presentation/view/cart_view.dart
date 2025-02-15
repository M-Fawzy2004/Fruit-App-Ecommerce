import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_view_body.dart';
import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routeName = 'cartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: const CartViewBody(),
      ),
    );
  }
}
