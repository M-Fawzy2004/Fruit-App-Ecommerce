import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductImageDetailsHeader extends StatelessWidget {
  const ProductImageDetailsHeader({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        CustomCachedNetworkImage(
          height: screenHeight * 0.35,
          width: screenWidth,
          imageUrl: productEntity.imageUrl!,
        ),
        Positioned(
          top: screenHeight * 0.04,
          right: isArabic ? screenHeight * 0.014 : null,
          left: isArabic ? null : screenHeight * 0.014,
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
            ),
            child: FittedBox(
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
