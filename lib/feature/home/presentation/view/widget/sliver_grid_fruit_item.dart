import 'package:e_commerce_app/feature/home/presentation/view/widget/fruit_item.dart';
import 'package:flutter/material.dart';

class SliverListFruitItem extends StatelessWidget {
  const SliverListFruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 12,
        childAspectRatio: 170 / 200,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return FruitItem();
      },
    );
  }
}
