import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/order_amount_item.dart';
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
      height: screenHeight * 0.18,
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
              text: 'المجموع الفرعي :',
              price:
                  '${context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString()} جنيه',
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            OrderAmountItem(
              text: 'التوصيل :',
              price: '30 جنيه',
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Divider(
              indent: 30,
              endIndent: 30,
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            OrderAmountItem(
              text: 'المجموع الكلي :',
              price:
                  '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30).toString()} جنيه',
            ),
          ],
        ),
      ),
    );
  }
}
