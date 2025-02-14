import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomSubtitleText extends StatelessWidget {
  const CustomSubtitleText({
    super.key,
    required this.productEntity,
  });

  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: productEntity.price.toString(),
              style: Styles.fontText16(context).copyWith(
                color: Color(0xffF4A91F),
              ),
            ),
            TextSpan(
              text: " / ",
              style: Styles.fontText16(context).copyWith(
                color: Color(0xffF4A91F),
              ),
            ),
            TextSpan(
              text: '${productEntity.unitAmount} كيلو',
              style: Styles.fontText13(context).copyWith(
                color: Color(0xffF8C76D),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
