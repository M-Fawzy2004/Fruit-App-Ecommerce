import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/shipping_item.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        ShippingItem(
          title: LocaleKeys.CheckOut_cash.tr(),
          subtitle: LocaleKeys.CheckOut_deliveryPlace.tr(),
          price:
              '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30).toString()} ${LocaleKeys.Success_pound.tr()}',
          value: 1,
          groupValue: selectedOption,
          onChanged: (val) {
            setState(() {
              selectedOption = val!;
            });
          },
        ),
        ShippingItem(
          title: LocaleKeys.CheckOut_online.tr(),
          subtitle: LocaleKeys.CheckOut_selectPayment.tr(),
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString()} ${LocaleKeys.Success_pound.tr()}',
          value: 2,
          groupValue: selectedOption,
          onChanged: (val) {
            setState(() {
              selectedOption = val!;
            });
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
