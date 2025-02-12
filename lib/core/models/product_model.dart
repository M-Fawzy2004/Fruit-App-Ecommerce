import 'dart:io';

import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/entities/review_entity.dart';

class ProductModel {
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
  final num sellingCount;
  final int unitAmount;
  final List<ReviewEntity> reviews;

  ProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.desc,
    required this.image,
    this.imageUrl,
    required this.isFeatured,
    required this.expritionmonths,
    required this.isOrganic,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.sellingCount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      desc: json['desc'],
      image: json['image'],
      imageUrl: json['imageUrl'],
      isFeatured: json['isFeatured'],
      expritionmonths: json['expritionmonths'],
      isOrganic: json['isOrganic'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      reviews: json['reviews'],
      sellingCount: json['sellingCount'],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      name: name,
      price: price,
      code: code,
      desc: desc,
      image: image,
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
