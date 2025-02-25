import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/checkout_view_body.dart';
import 'package:e_commerce_app/feature/home/entities/cart_entity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({
    super.key,
    required this.cartEntity,
  });

  static const routeName = 'checkout';
  final CartEntity cartEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: SafeArea(
          child: Provider.value(
            value: OrderEntity(
              cartEntity,
              shippingAddressEntity: ShippingAddressEntity(),
            ),
            child: CheckoutViewBody(
              cartEntity: cartEntity,
             
            ),
          ),
        ),
      ),
    );
  }
}
