import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_cached_network_image.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_subtite_text.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/item_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_outline,
                color: Colors.grey,
              ),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                CustomCachedNetworkImage(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      ItemDetailsView.routeName,
                      arguments: productEntity,
                    );
                  },
                  imageUrl: productEntity.imageUrl ?? '',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.007,
                ),
                ListTile(
                  title: Text(
                    productEntity.name,
                    maxLines: 1,
                    style: Styles.fontText16(context).copyWith(
                      fontWeight: FontWeight.w800,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: CustomSubtitleText(productEntity: productEntity),
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xff1B5E37),
                    child: IconButton(
                      onPressed: () {
                        context.read<CartCubit>().addProduct(
                              productEntity,
                            );
                      },
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
