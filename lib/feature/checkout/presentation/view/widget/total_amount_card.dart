import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/order_amount_item.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TotalAmountCard extends StatelessWidget {
  const TotalAmountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
        child: Column(
          children: [
            OrderAmountItem(
              text: LocaleKeys.CheckOut_subtotal.tr(),
              price:
                  '${context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString()} ${LocaleKeys.Success_pound.tr()}',
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            OrderAmountItem(
              text: LocaleKeys.CheckOut_delivery.tr(),
              price: '30 ${LocaleKeys.Success_pound.tr()}',
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Divider(
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            OrderAmountItem(
              text: LocaleKeys.CheckOut_allTotal.tr(),
              price:
                  '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30).toString()} جنيه',
            ),
          ],
        ),
      ),
    );
  }
}
