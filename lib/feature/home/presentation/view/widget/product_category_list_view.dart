import 'package:e_commerce_app/feature/home/presentation/view/widget/category_item.dart';
import 'package:flutter/material.dart';

class ProductCategoryListView extends StatefulWidget {
  const ProductCategoryListView({super.key});

  @override
  State<ProductCategoryListView> createState() =>
      _ProductCategoryListViewState();
}

class _ProductCategoryListViewState extends State<ProductCategoryListView> {
  // list of categories
  List categories = const [
    {'image': '', 'title': 'افوكادو'},
    {'image': '', 'title': 'فرولة'},
    {'image': '', 'title': 'موز'},
    {'image': '', 'title': 'بطيخ'},
    {'image': '', 'title': 'أناناس'},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return CategoryItem(
          image: categories[index]['image'],
          title: categories[index]['title'],
        );
      },
      itemCount: categories.length,
    );
  }
}
