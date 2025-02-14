import 'package:e_commerce_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/core/helper/get_dummy_product.dart';
import 'package:e_commerce_app/core/widget/custom_error.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/product_sliver_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductSliverListBlocBuilder extends StatelessWidget {
  const ProductSliverListBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ProductSliverList(products: state.products);
        } else if (state is ProductFailure) {
          return SliverToBoxAdapter(
            child: CustomError(text: state.message),
          );
        } else {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductSliverList(
              products: getDummyProducts(),
            ),
          );
        }
      },
    );
  }
}
