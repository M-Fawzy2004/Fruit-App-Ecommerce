import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/feature/home/entities/cart_entity.dart';
import 'package:e_commerce_app/feature/home/entities/cart_item_entity.dart';
import 'package:meta/meta.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartEntity cartEntity = CartEntity([]);

  void addCartItem(CartItemEntity cartItemEntity) {
    cartEntity.addCartItem(cartItemEntity);
    emit(CartAddedProduct());
  }
}
