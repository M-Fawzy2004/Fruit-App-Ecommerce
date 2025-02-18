import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_cached_network_image.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_cart_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartEntity});

  final CartItemEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntrinsicHeight(
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.15,
              width: MediaQuery.sizeOf(context).width * 0.2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.tertiary,
              ),
              child: CustomCachedNetworkImage(
                imageUrl: cartEntity.productEntity.imageUrl!,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        cartEntity.productEntity.name,
                        style: Styles.fontText16(context),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          context.read<CartCubit>().removeProduct(cartEntity);
                        },
                        child: SvgPicture.asset(Assets.imagesTrash),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  Text(
                    'كيلو ${cartEntity.calculateTotalWeight()}',
                    style: Styles.fontText16(context).copyWith(
                      color: Color(0xffF4A91F),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  CustomCartActionButton(cartEntity: cartEntity),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
