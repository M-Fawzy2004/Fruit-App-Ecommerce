import 'package:e_commerce_app/feature/checkout/presentation/view/widget/step_item.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentPageIndex,
    required this.pageController,
  });

  final int currentPageIndex;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        getStep().length,
        (index) => Expanded(
          child: GestureDetector(
            onTap: () {
              pageController.jumpToPage(index);
            },
            child: StepItem(
              index: (index + 1).toString(),
              text: getStep()[index],
              isActive: index <= currentPageIndex,
            ),
          ),
        ),
      ),
    );
  }
}

List<String> getStep() {
  return [
    LocaleKeys.Shopping_shopping.tr(),
    LocaleKeys.Shopping_address.tr(),
    LocaleKeys.Shopping_review.tr(),
    LocaleKeys.Shopping_payment.tr(),
  ];
}
