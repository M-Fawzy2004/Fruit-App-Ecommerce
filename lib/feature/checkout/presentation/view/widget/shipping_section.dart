import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/shipping_item.dart';
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
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price:
              '${(context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 30).toString()} جنيه',
          value: 1,
          groupValue: selectedOption,
          onChanged: (val) {
            setState(() {
              selectedOption = val!;
            });
          },
        ),
        ShippingItem(
          title: 'الدفع أونلاين',
          subtitle: 'يرجي تحديد طريقه الدفع',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice().toString()} جنيه',
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
