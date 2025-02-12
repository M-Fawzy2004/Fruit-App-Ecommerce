import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'page_view_item.dart';
import 'splash_view_title.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      controller: pageController,
      itemCount: 2,
      itemBuilder: (context, index) {
        return index == 0
            ? PageViewItem(
                isVisible: true,
                image: Assets.imagesImagePageViewItem1,
                backgroundimage: Assets.imagesBackgroundPageViewItem1,
                title: SplashViewTitle(),
                description: LocaleKeys.SplashView1_description.tr(),
              )
            : PageViewItem(
                isVisible: false,
                image: Assets.imagesImagePageViewItem2,
                backgroundimage: Assets.imagesBackgroundPageViewItem2,
                title: Text(
                  LocaleKeys.SplashView2_title.tr(),
                  style: Styles.titleSplashView(context),
                ),
                description: LocaleKeys.SplashView2_description.tr(),
              );
      },
    );
  }
}
