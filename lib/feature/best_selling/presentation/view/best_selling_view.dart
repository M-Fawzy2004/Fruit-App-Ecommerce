import 'package:e_commerce_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/core/repos/product_repo.dart';
import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/feature/best_selling/presentation/view/widget/best_selling_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  static const String routeName = 'best_selling_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ProductCubit(
          getIt.get<ProductRepo>(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: SafeArea(
            child: BestSellingViewBody(),
          ),
        ),
      ),
    );
  }
}
