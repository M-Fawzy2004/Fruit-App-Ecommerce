import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';
part 'get_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  Future<void> getBestSellingProduct() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProducts();

    result.fold(
      (failure) {
        print(
            "Failed to fetch products: ${failure.message}"); // Debugging: Print failure
        emit(ProductFailure(failure.message));
      },
      (products) {
        print(
            "Products fetched successfully: ${products.length}"); // Debugging: Print success
        emit(ProductSuccess(products));
      },
    );
  }
}
