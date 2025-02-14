import 'package:e_commerce_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/feature/best_selling/presentation/view/best_selling_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/product_more_header.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/featured_list.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/product_sliver_list_bloc_builder.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
    context.read<ProductCubit>().getBestSellingProduct();
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
              ProductMoreHeader(
                onTap: () => Navigator.pushNamed(
                  context,
                  BestSellingView.routeName,
                ),
                titleOne: LocaleKeys.HomeView_bestSeller.tr(),
                titleTwo: LocaleKeys.HomeView_more.tr(),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
            ],
          ),
        ),
        ProductSliverListBlocBuilder(),
      ],
    );
  }
}
