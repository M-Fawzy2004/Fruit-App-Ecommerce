import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failures.dart';

abstract class ProductRepo {
  // get all products
  Future<Either<Failures, List<ProductEntity>>> getProducts();
  // get best selling products
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts();
}
