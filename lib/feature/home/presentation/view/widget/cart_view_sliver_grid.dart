import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_item.dart';
import 'package:flutter/material.dart';

class CartViewSliverGrid extends StatelessWidget {
  const CartViewSliverGrid({super.key, required this.cartEntity});

  final List<CartItemEntity> cartEntity;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 272 / 100,
      ),
      itemCount: cartEntity.length,
      itemBuilder: (context, index) {
        return CartItem(
          cartEntity: cartEntity[index],
        );
      },
    );
  }
}
