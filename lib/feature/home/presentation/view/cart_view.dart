import 'package:e_commerce_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  static const routeName = 'cartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: BlocProvider(
          create: (context) => CartItemCubit(),
          child: const CartViewBody(),
        ),
      ),
    );
  }
}
