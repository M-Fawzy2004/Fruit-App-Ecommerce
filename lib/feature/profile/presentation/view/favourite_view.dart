import 'package:e_commerce_app/feature/profile/presentation/view/widget/favourite_view_body.dart';
import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  static const routeName = 'favourite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FavouriteViewBody(),
    );
  }
}
