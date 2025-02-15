import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/category_item.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductCategoryListView extends StatefulWidget {
  const ProductCategoryListView({super.key});

  @override
  State<ProductCategoryListView> createState() =>
      _ProductCategoryListViewState();
}

class _ProductCategoryListViewState extends State<ProductCategoryListView> {
  // list of categories
  List categories = [
    {
      'image': Assets.imagesAvocado,
      'title': LocaleKeys.CategoryProduct_avocado.tr(),
    },
    {
      'image': Assets.imagesFrawola,
      'title': LocaleKeys.CategoryProduct_strawberry.tr(),
    },
    {
      'image': Assets.imagesBnana,
      'title': LocaleKeys.CategoryProduct_banana.tr(),
    },
    {
      'image': Assets.imagesBatteek,
      'title': LocaleKeys.CategoryProduct_watermelon.tr(),
    },
    {
      'image': Assets.imagesAnans,
      'title': LocaleKeys.CategoryProduct_pineapple.tr(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.135,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryItem(
            image: categories[index]['image'],
            title: categories[index]['title'],
          );
        },
        itemCount: categories.length,
      ),
    );
  }
}
