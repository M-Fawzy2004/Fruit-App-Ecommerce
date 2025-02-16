part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartAddedProduct extends CartState {}

final class CartRemovedProduct extends CartState {}
