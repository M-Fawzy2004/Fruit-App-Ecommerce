import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/step_different_payment.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatelessWidget {
  final ValueChanged<int> onPaymentMethodSelected;

  const PaymentSection({super.key, required this.onPaymentMethodSelected});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            LocaleKeys.CheckOut_choosePayment1.tr(),
            style: Styles.fontText13(context),
          ),
          SizedBox(height: screenHeight * .016),
          Text(
            LocaleKeys.CheckOut_choosePayment.tr(),
            style: Styles.fontText13(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: screenHeight * .016),
          StepDifferentPayment(
            onPaymentMethodSelected: onPaymentMethodSelected,
          ),
          SizedBox(height: screenHeight * .045),
        ],
      ),
    );
  }
}
