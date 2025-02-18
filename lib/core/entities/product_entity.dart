import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ProductEntity extends Equatable {
  final String name;
  final num price;
  final String code;
  final String desc;
  String? imageUrl;
  final bool isFeatured;
  final int expritionmonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating = 0;
  final num ratingCount = 0;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.name,
    required this.price,
    required this.code,
    required this.desc,
    this.imageUrl,
    required this.isFeatured,
    required this.expritionmonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required num sellingCount,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [code];
}
