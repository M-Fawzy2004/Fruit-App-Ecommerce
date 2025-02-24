import 'package:e_commerce_app/feature/checkout/presentation/view/widget/address_input_section.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/payment_section.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/review_section.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/shipping_section.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CheckOutStepPageView extends StatelessWidget {
  const CheckOutStepPageView({
    super.key,
    required this.pageController,
    required this.formKey,
    required this.valueListenable,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        itemCount: getPage().length,
        itemBuilder: (context, index) {
          return getPage()[index];
        },
      ),
    );
  }

  List<Widget> getPage() {
    return [
      ShippingSection(),
      AddressInputSection(
        formKey: formKey,
        valueListenable: valueListenable,
      ),
      ReviewSection(),
      PaymentSection(),
    ];
  }
}
