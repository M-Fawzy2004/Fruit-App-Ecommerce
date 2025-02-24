import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/delivery_address_card.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/total_amount_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'ملخص الطلب :',
              style: Styles.fontText13(context).copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          TotalAmountCard(),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'يرجي تأكيد  طلبك',
              style: Styles.fontText13(context).copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          DeliveryAddressCard(
            address: context.read<OrderEntity>().shippingAddressEntity.toString(),
            onEdit: () {},
          ),
        ],
      ),
    );
  }
}
