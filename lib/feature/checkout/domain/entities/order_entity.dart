import 'package:e_commerce_app/feature/checkout/domain/entities/shipping_address_entity.dart';
import 'package:e_commerce_app/feature/home/entities/cart_entity.dart';

class OrderEntity {
  final CartEntity cartEntity;
  bool? payWithCash;
  ShippingAddressEntity shippingAddressEntity = ShippingAddressEntity();

  OrderEntity(
    this.cartEntity, {
    this.payWithCash,
    required this.shippingAddressEntity,
  });

}
