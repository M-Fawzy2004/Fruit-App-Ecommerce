import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_sliver_app_bar.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/home_view_body.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomNestedScrollView extends StatelessWidget {
  const CustomNestedScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          CustomSliverAppBar(
            isArabic: isArabic,
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: HomeViewBody(),
      ),
    );
  }
}
