import 'package:e_commerce_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/best_selling_more_header.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/featured_list.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/sliver_list_fruit_item.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/sliver_list_fruit_item_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getBestSellingProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.015,
              ),
              FeaturedList(),
              SizedBox(
                height: size.height * 0.02,
              ),
              BestSellingMoreHeader(),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
        SliverListFruitItemBlocBuilder(),
      ],
    );
  }
}
