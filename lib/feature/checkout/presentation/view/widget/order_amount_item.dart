import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class OrderAmountItem extends StatelessWidget {
  const OrderAmountItem({
    super.key,
    required this.text,
    required this.price,
  });

  final String text, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text,
          style: Styles.fontText16(context).copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Spacer(),
        Text(price, style: Styles.fontText16(context))
      ],
    );
  }
}
