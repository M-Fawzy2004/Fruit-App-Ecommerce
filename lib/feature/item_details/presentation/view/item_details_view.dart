import 'package:e_commerce_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/widget/item_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.productEntity});

  static const routeName = '/item_details_view';
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ProductCubit(
              getIt.get<ProductRepo>(),
            ),
          ),
          BlocProvider(create: (context) => CartCubit()),
        ],
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: ItemDetailsViewBody(
            productEntity: productEntity,
          ),
        ),
      ),
    );
  }
}
