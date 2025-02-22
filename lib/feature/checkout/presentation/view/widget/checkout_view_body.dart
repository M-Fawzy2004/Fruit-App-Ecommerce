import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/checkout_step_page_view.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/checkout_steps.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ProductViewHeader(
          isVisible: true,
          isVisibleNotification: false,
          title: LocaleKeys.Shopping_shopping.tr(),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CheckoutSteps(),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Expanded(
          child: CheckOutStepPageView(pageController: pageController),
        ),
        CustomButton(
          text: 'التالي',
          onTap: () {
            pageController.nextPage(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
      ],
    );
  }
}
