import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/widget/details_feature_card_sliver_grid.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/widget/product_details_info_section.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/widget/product_image_detials_header.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key, required this.productEntity});

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ProductImageDetailsHeader(
            productEntity: productEntity,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
        ),
        SliverToBoxAdapter(
          child: ProductDetailsInfoSection(
            productEntity: productEntity,
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
        ),
        DetailsFeatureCardSliverGrid(
          productEntity: productEntity,
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .015,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomButton(
            onTap: () {
              context.read<CartCubit>().addProduct(productEntity);
              ScaffoldMessenger.of(context).showSnackBar(
                buildSnakBarError(
                  LocaleKeys.Success_titleAdd.tr(),
                  backgroundColor: activeDotColor,
                ),
              );
            },
            text: LocaleKeys.DetailsItem_addToCart.tr(),
          ),
        ),
      ],
    );
  }
}
