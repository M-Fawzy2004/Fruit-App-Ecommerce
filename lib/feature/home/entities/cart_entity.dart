import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem(CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }

  bool isExist(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return true;
      }
    }
    return false;
  }

  CartItemEntity getCartItem(ProductEntity productEntity) {
    for (var cartItem in cartItems) {
      if (cartItem.productEntity == productEntity) {
        return cartItem;
      }
    }
    return CartItemEntity(
      productEntity: productEntity,
      count: 1,
    );
  }
}
