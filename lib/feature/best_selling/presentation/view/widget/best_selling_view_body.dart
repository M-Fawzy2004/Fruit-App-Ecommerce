import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
            child: ProductViewHeader(
              title: LocaleKeys.HomeView_bestSeller.tr(),
              isVisible: true,
              isVisibleNotification: true,
            ),
          ),
        ),
      ],
    );
  }
}
