import 'package:e_commerce_app/feature/checkout/presentation/view/widget/checkout_view_body.dart';
import 'package:flutter/material.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  static const routeName = 'checkout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SafeArea(
          child: CheckoutViewBody(),
        ),
      ),
    );
  }
}
