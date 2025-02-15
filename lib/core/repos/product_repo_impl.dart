import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/errors/failures.dart';
import 'package:e_commerce_app/core/models/product_model.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:e_commerce_app/core/services/data_base_services.dart';
import 'package:e_commerce_app/core/utils/backend_entpoint.dart';

class ProductRepoImpl extends ProductRepo {
  final DataBaseServices dataBaseServices;

  ProductRepoImpl(this.dataBaseServices);

  @override
  Future<Either<Failures, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await dataBaseServices.getDataSupbase(
        path: BackendEntpoint.getProducts,
        query: {
          'limit': 10,
          'orderBy': 'selling_count',
          'ascending': true,
        },
      );
      if (data is List<Map<String, dynamic>>) {
        List<ProductModel> products =
            data.map((e) => ProductModel.fromJson(e)).toList();
        List<ProductEntity> productEntity =
            products.map((e) => e.toEntity()).toList();
        return right(productEntity);
      } else {
        return left(
          ServerFailure(
            message: 'Feild to get Selling products',
          ),
        );
      }
    } catch (e) {
      return left(
        ServerFailure(
          message: 'Feild to get Selling products $e',
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<ProductEntity>>> getProducts() async {
    try {
      var data = await dataBaseServices.getDataSupbase(
        path: BackendEntpoint.getProducts,
      ) as List<Map<String, dynamic>>;

      List<ProductModel> products =
          data.map((e) => ProductModel.fromJson(e)).toList();

      List<ProductEntity> productEntity =
          products.map((e) => e.toEntity()).toList();
      return right(productEntity);
    } catch (e) {
      return left(
        ServerFailure(
          message: 'Feild to get products',
        ),
      );
    }
  }
}
