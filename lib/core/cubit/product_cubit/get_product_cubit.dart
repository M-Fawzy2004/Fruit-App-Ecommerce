import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';
part 'get_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  // get selling product
  Future<void> getBestSellingProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProducts();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.message));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }

  // get all product
  Future<void> getProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getProducts();

    result.fold(
      (failure) {
        emit(ProductFailure(failure.message));
      },
      (products) {
        emit(ProductSuccess(products));
      },
    );
  }
}
