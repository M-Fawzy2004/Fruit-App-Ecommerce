import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItems;

  CartEntity(this.cartItems);

  addCartItem (CartItemEntity cartItem) {
    cartItems.add(cartItem);
  }
}