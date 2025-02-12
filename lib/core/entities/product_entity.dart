import 'dart:io';

import 'package:e_commerce_app/core/entities/review_entity.dart';

class ProductEntity {
  final String name;
  final num price;
  final String code;
  final String desc;
  final File image;
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
    required this.image,
    this.imageUrl,
    required this.isFeatured,
    required this.expritionmonths,
    this.isOrganic = false,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews, required num sellingCount,
  });
}
