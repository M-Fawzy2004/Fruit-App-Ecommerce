import 'package:e_commerce_app/feature/home/presentation/view/cart_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/product_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_nested_scroll_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/profile_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: IndexedStack(
          index: index,
          children: [
            const CustomNestedScrollView(),
            const ProductView(),
            const CartView(),
            const ProfileView(),
          ],
        ),
      ),
    );
  }
}
