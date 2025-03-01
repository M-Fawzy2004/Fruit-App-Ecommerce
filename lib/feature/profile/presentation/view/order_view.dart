import 'package:e_commerce_app/feature/profile/presentation/view/widget/order_view_body.dart';
import 'package:flutter/material.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  static const routeName = 'orderView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrderViewBody(),
    );
  }
}
