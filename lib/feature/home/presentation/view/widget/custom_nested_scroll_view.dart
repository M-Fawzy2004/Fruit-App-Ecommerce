import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_sliver_app_bar.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/home_view.dart';
import 'package:flutter/material.dart';

class CustomNestedScrollView extends StatelessWidget {
  const CustomNestedScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CustomSliverAppBar(),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: HomeView(),
      ),
    );
  }
}
