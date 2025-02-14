import 'package:e_commerce_app/feature/home/presentation/view/widget/product_view_body.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  static const routeName = 'product-view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProductViewBody(),
    );
  }
}
