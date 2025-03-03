import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_item/cart_item_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_item_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCartActionButton extends StatelessWidget {
  const CustomCartActionButton({
    super.key,
    required this.cartEntity,
  });

  final CartItemEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CartItemActionButton(
          onTap: () {
            cartEntity.incrasedCount();
            context.read<CartItemCubit>().updateCartItem(cartEntity);
          },
          icon: Icons.add,
          containerColor: Color(0xff5DB957),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FittedBox(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.04,
              width: MediaQuery.sizeOf(context).width * 0.08,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: Center(
                child: Text(
                  cartEntity.count.toString(),
                  style: Styles.fontText19(context),
                ),
              ),
            ),
          ),
        ),
        CartItemActionButton(
          onTap: () {
            if (cartEntity.count > 1) {
              cartEntity.decreasedCount();
              context.read<CartItemCubit>().updateCartItem(cartEntity);
            }
          },
          icon: Icons.remove,
          containerColor: Theme.of(context).colorScheme.tertiary,
        ),
        Spacer(),
        Text(
          '${cartEntity.calculateTotalPrice()} جنيه',
          style: Styles.fontText19(context).copyWith(
            color: Color(0xffF4A91F),
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
