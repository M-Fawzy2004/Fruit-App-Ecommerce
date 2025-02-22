import 'package:e_commerce_app/feature/checkout/presentation/view/widget/shipping_item.dart';
import 'package:flutter/material.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedOption = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40 جنيه',
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
          price: 'مجاني',
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
}
