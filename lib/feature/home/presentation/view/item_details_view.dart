import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/item_details_view_body.dart';
import 'package:flutter/material.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key, required this.productEntity});

  static const routeName = '/item_details_view';
  final ProductEntity productEntity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemDetailsViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
