import 'package:e_commerce_app/core/entities/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 0});

  num calculateTotalPrice() => productEntity.price * count;
  num calculateTotalWeight() => productEntity.unitAmount * count;
  incrasedCount() => count++;
  decreasedCount() => count--;
}
