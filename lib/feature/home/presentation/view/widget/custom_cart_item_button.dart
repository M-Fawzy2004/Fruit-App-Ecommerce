import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartItemButton extends StatelessWidget {
  const CustomCartItemButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cartItems = context.watch<CartCubit>().cartEntity.cartItems;

    if (cartItems.isEmpty) {
      return const SizedBox.shrink();
    }

    return BlocBuilder<CartItemCubit, CartItemState>(
      builder: (context, state) {
        return CustomButton(
          text:
              '${LocaleKeys.Success_payment.tr()} ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} ${LocaleKeys.Success_pound.tr()}',
          onTap: () {},
        );
      },
    );
  }
}
