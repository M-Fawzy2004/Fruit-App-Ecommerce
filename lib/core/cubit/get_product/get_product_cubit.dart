import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:meta/meta.dart';
part 'get_product_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit(this.productRepo) : super(GetProductInitial());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(GetProductLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (l) => emit(
        GetProductFailure(l.message),
      ),
      (products) => emit(
        GetProductSuccess(products),
      ),
    );
  }
}
