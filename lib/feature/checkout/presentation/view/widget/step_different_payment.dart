import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/custom_diff_payment.dart';
import 'package:flutter/material.dart';

class StepDifferentPayment extends StatefulWidget {
  const StepDifferentPayment({
    super.key,
    required this.onPaymentMethodSelected,
  });
  final Function(int) onPaymentMethodSelected;

  @override
  State<StepDifferentPayment> createState() => _StepDifferentPaymentState();
}

class _StepDifferentPaymentState extends State<StepDifferentPayment> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        getDifferentPayment().length,
        (index) {
          return CustomDifferentPayment(
            image: getDifferentPayment()[index],
            isSelected: selectedIndex == index,
            onSelect: () {
              setState(() {
                selectedIndex = index;
              });
              widget.onPaymentMethodSelected(index);
            },
          );
        },
      ),
    );
  }
}

List<String> getDifferentPayment() {
  return [
    Assets.imagesPaypal,
    Assets.imagesPaymob,
  ];
}
