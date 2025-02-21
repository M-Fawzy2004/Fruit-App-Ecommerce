import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/details_feature_card.dart';
import 'package:flutter/material.dart';

class DetailsFeatureCardSliverGrid extends StatefulWidget {
  const DetailsFeatureCardSliverGrid({super.key});

  @override
  State<DetailsFeatureCardSliverGrid> createState() =>
      _DetailsFeatureCardSliverGridState();
}

class _DetailsFeatureCardSliverGridState
    extends State<DetailsFeatureCardSliverGrid> {
  final List categories = [
    {
      'image': Assets.imagesPower,
      'title': 'الصلاحيه',
    },
    {
      'image': Assets.imagesOrganic,
      'title': 'اوجانيك',
    },
    {
      'image': Assets.imagesCalorey,
      'title': '100 جرام',
    },
    {
      'image': Assets.imagesStar,
      'title': 'Reviews',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 1,
        mainAxisExtent: 100,
      ),
      itemCount: 4,
      itemBuilder: (context, index) {
        return DetailsFeatureCard(
          title: categories[index]['title'],
          image: categories[index]['image'],
          subtitle: categories[index]['title'],
        );
      },
    );
  }
}
