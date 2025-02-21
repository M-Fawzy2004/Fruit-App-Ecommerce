import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/details_feature_card_sliver_grid.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/product_details_info_section.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/product_image_detials_header.dart';
import 'package:flutter/material.dart';

class ItemDetailsViewBody extends StatelessWidget {
  const ItemDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ProductImageDetailsHeader(),
        ),
        SliverToBoxAdapter(
          child: ProductDetailsInfoSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .03,
          ),
        ),
        DetailsFeatureCardSliverGrid(),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * .015,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomButton(text: 'أضف الي السلة'),
        ),
      ],
    );
  }
}
