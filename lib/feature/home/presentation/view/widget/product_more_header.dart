import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductMoreHeader extends StatelessWidget {
  const ProductMoreHeader({
    super.key,
    required this.titleOne,
    this.titleTwo,
    this.onTap,
  });

  final String titleOne;
  final String? titleTwo;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleOne,
          style: Styles.fontText16(context),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            titleTwo ?? '',
            style: Styles.fontText13(context).copyWith(
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
