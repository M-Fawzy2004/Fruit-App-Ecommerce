import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/widget/details_feature_card.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class DetailsFeatureCardSliverGrid extends StatelessWidget {
  const DetailsFeatureCardSliverGrid({super.key, required this.productEntity});
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    final List categories = [
      {
        'image': Assets.imagesPower,
        'title': LocaleKeys.DetailsItem_validity.tr(),
        "name": productEntity.expritionmonths >= 12
            ? "${productEntity.expritionmonths ~/ 12} عام${productEntity.expritionmonths % 12 > 0 ? " و ${productEntity.expritionmonths % 12} شهر" : ""}"
            : "${productEntity.expritionmonths} شهر",
      },
      {
        'image': Assets.imagesOrganic,
        'title': LocaleKeys.DetailsItem_oganic.tr(),
        "name": productEntity.isOrganic ? "100%" : "لا",
      },
      {
        'image': Assets.imagesCalorey,
        'title': LocaleKeys.DetailsItem_gram.tr(),
        "name": productEntity.numberOfCalories.toString(),
      },
      {
        'image': Assets.imagesStar,
        'title': LocaleKeys.DetailsItem_review.tr(),
        "name":
            '(${productEntity.avgRating.toString()}) ${productEntity.reviews.length.toString()} ',
      },
    ];
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        mainAxisExtent: 100,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return DetailsFeatureCard(
          title: categories[index]['name'],
          image: categories[index]['image'],
          subtitle: categories[index]['title'],
        );
      },
    );
  }
}
