import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  const ProductDetailsInfoSection({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    productEntity.name,
                    style: Styles.fontText19(context),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Text(
                    '${productEntity.price.toString()} / ${productEntity.unitAmount} كيلو',
                    style: Styles.fontText16(context).copyWith(
                      color: Color(0xffF4A91F),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.add),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  color: Color(0xffFFC529),
                ),
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
                'المراجعه',
                style: Styles.fontText13(context).copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: activeDotColor,
                  color: activeDotColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Text(
            productEntity.desc,
            style: Styles.fontText13(context),
          ),
        ],
      ),
    );
  }
}
