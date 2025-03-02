import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/delivery_address_card.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/total_amount_card.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewSection extends StatelessWidget {
  const ReviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    double screenHeight = MediaQuery.sizeOf(context).height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Align(
            alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              LocaleKeys.CheckOut_appSummary.tr(),
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
            alignment: isArabic ? Alignment.centerRight : Alignment.centerLeft,
            child: Text(
              LocaleKeys.CheckOut_confirmOrder.tr(),
              style: Styles.fontText13(context).copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          DeliveryAddressCard(
            address:
                context.read<OrderEntity>().shippingAddressEntity.toString(),
            onEdit: () {},
          ),
        ],
      ),
    );
  }
}
