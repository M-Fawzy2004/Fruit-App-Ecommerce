import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_header.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_view_sliver_grid.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var text =
        '${LocaleKeys.Success_payment.tr()} ${context.watch<CartCubit>().cartEntity.calculateTotalPrice()} ${LocaleKeys.Success_pound.tr()}';
    return Stack(
      children: [
        CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: CartHeader(),
            ),
            CartViewSliverGrid(
              cartEntity: context.watch<CartCubit>().cartEntity.cartItems,
            ),
          ],
        ),
        Positioned(
          right: 0,
          left: 0,
          bottom: MediaQuery.sizeOf(context).height * 0.02,
          child: CustomButton(
            text: text,
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
