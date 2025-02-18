import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/feature/home/entities/cart_entity.dart';
import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addProduct(ProductEntity productEntity) {
    bool isProductExist = cartEntity.isExist(productEntity);
    var getCartItems = cartEntity.getCartItem(productEntity);
    if (isProductExist) {
      getCartItems.incrasedCount();
    } else {
      cartEntity.addCartItem(getCartItems);
    }
    emit(CartItemAdded());
  }

  void removeProduct(CartItemEntity cartItemEntity) {
    cartEntity.removeCartItem(cartItemEntity);
    emit(CartItemRemoved());
  }
}
