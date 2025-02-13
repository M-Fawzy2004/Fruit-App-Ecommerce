import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';
part 'get_product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productRepo) : super(ProductInitial());

  final ProductRepo productRepo;

  Future<void> getBestSellingProducts() async {
    emit(ProductLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold(
      (l) => emit(
        ProductFailure(l.message),
      ),
      (products) => emit(
        ProductSuccess(products),
      ),
    );
  }
}
