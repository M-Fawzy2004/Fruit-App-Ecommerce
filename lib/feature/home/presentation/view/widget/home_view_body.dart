import 'package:e_commerce_app/feature/home/presentation/view/widget/best_selling_more_header.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/featured_list.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/sliver_grid_fruit_item.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
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
        SliverListFruitItem(),
      ],
    );
  }
}
