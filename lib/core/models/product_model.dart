import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/entities/review_entity.dart';

class ProductModel {
  final String name;
  final num price;
  final String code;
  final String desc;
  String? imageUrl;
  final bool isFeatured;
  final int expritionmonths;
  final bool isOrganic;
  final int numberOfCalories;
  final num avgRating;
  final num ratingCount;
  final num sellingCount;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.desc,
    this.imageUrl,
    required this.isFeatured,
    required this.expritionmonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.sellingCount,
    required this.avgRating,
    required this.ratingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      desc: json['description'],
      imageUrl: json['image_url'],
      isFeatured: json['is_featured'],
      expritionmonths: json['expiration_months'],
      isOrganic: json['is_organic'],
      numberOfCalories: json['number_of_calories'],
      avgRating: json['avg_rating'],
      unitAmount: json['unit_amount'],
      ratingCount: json['rating_count'],
      sellingCount: json['selling_count'],
      reviews: json['reviews'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      code: code,
      desc: desc,
      imageUrl: imageUrl,
      isFeatured: isFeatured,
      expritionmonths: expritionmonths,
      isOrganic: isOrganic,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      reviews: reviews,
      sellingCount: sellingCount,
    );
  }

  toMap() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': desc,
      'image_url': imageUrl,
      'is_featured': isFeatured,
      'expiration_months': expritionmonths,
      'is_organic': isOrganic,
      'number_of_calories': numberOfCalories,
      'avg_rating': avgRating,
      'unit_amount': unitAmount,
      'rating_count': ratingCount,
      'selling_count': sellingCount
    };
  }
}
