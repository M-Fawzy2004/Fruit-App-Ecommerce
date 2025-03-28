import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/fruit_item.dart';
import 'package:flutter/material.dart';

class ProductSliverGrid extends StatelessWidget {
  const ProductSliverGrid({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 160 / 214,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FruitItem(
          productEntity: products[index],
        );
      },
    );
  }
}
