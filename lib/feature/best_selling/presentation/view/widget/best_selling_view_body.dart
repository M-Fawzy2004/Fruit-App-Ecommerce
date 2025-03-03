import 'package:e_commerce_app/core/cubit/product_cubit/get_product_cubit.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/core/widget/search_bar_delegate.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/product_sliver_grid_bloc_builder.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellingViewBody extends StatefulWidget {
  const BestSellingViewBody({super.key});

  @override
  State<BestSellingViewBody> createState() => _BestSellingViewBodyState();
}

class _BestSellingViewBodyState extends State<BestSellingViewBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ProductViewHeader(
            title: LocaleKeys.HomeView_product.tr(),
            isVisible: true,
            isVisibleNotification: true,
          ),
        ),
        SliverPersistentHeader(
          pinned: true,
          floating: false,
          delegate: SearchBarDelegate(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            LocaleKeys.HomeView_bestSeller.tr(),
            style: Styles.fontText16(context),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.02,
          ),
        ),
        ProductSliverListBlocBuilder(),
      ],
    );
  }
}
