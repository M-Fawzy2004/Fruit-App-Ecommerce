import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/entities/review_entity.dart';
import 'package:e_commerce_app/core/helper/get_avg_rating.dart';

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
  final num ratingCount = 0;
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
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      desc: json['desc'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'] ?? false,
      expritionmonths: json['expritionmonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: json['reviews'],
      sellingCount: json['sellingCount'],
      avgRating: getAvagreRating(json['reviews']),
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
      'desc': desc,
      'imageUrl': imageUrl,
      'isFeatured': isFeatured,
      'expritionmonths': expritionmonths,
      'isOrganic': isOrganic,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'avgRating': avgRating,
      'ratingCount': ratingCount,
      'reviews': reviews,
      'sellingCount': sellingCount,
    };
  }
}
