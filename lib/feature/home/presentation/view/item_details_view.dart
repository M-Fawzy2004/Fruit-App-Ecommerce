import 'package:e_commerce_app/feature/home/presentation/view/widget/item_details_view_body.dart';
import 'package:flutter/material.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({super.key});

  static const routeName = '/item_details_view';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ItemDetailsViewBody(),
    );
  }
}
