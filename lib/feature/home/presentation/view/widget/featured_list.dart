import 'package:e_commerce_app/feature/home/presentation/view/widget/feature_item.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (context) => Padding(
            padding: isArabic
                ? const EdgeInsets.only(left: 10.0)
                : EdgeInsets.only(right: 15.0),
            child: const FeaturedItem(),
          ),
        ),
      ),
    );
  }
}
