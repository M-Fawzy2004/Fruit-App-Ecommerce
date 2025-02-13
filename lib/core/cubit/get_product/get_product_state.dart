part of 'get_product_cubit.dart';

@immutable
sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

final class GetProductFailure extends GetProductState {
  final String message;
  GetProductFailure(this.message);
}

final class GetProductSuccess extends GetProductState {
  final List<ProductEntity> products;
  GetProductSuccess(this.products);
}
