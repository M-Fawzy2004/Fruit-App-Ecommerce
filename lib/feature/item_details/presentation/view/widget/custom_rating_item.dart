import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomRatingItem extends StatelessWidget {
  const CustomRatingItem({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Color(0xffFFC529),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.02,
        ),
        Text(
          productEntity.ratingCount.toString(),
          style: Styles.fontText13(context).copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.02,
        ),
        Text(
          '(${productEntity.avgRating})',
          style: Styles.fontText13(context).copyWith(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.02,
        ),
        Text(
          LocaleKeys.DetailsItem_review.tr(),
          style: Styles.fontText13(context).copyWith(
            decoration: TextDecoration.underline,
            decorationColor: activeDotColor,
            color: activeDotColor,
          ),
        )
      ],
    );
  }
}
