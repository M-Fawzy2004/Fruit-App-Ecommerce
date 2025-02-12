import 'package:e_commerce_app/feature/best_selling/presentation/view/widget/best_selling_view_header.dart';
import 'package:flutter/material.dart';

class BestSellingViewBody extends StatelessWidget {
  const BestSellingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: BestSellingViewHeader(),
          ),
        ),
      ],
    );
  }
}
