import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/widget/custom_rating_item.dart';
import 'package:flutter/material.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  const ProductDetailsInfoSection({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  bool isArabic(String text) {
    return RegExp(r'[\u0600-\u06FF]').hasMatch(text);
  }

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
                  Directionality(
                    textDirection: isArabic(productEntity.name)
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Text(
                      productEntity.name,
                      style: Styles.fontText19(context),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.01,
                  ),
                  Directionality(
                    textDirection: isArabic(productEntity.unitAmount.toString())
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Text(
                      '${productEntity.price.toString()} / ${productEntity.unitAmount} كيلو',
                      style: Styles.fontText16(context).copyWith(
                        color: Color(0xffF4A91F),
                      ),
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
          CustomRatingItem(
            productEntity: productEntity,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Directionality(
            textDirection: isArabic(productEntity.desc)
                ? TextDirection.rtl
                : TextDirection.ltr,
            child: Text(
              productEntity.desc,
              style: Styles.fontText13(context),
            ),
          ),
        ],
      ),
    );
  }
}
