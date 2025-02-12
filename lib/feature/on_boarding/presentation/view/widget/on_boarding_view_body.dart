import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/services/shared_preference_singleton.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/signin_view.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'on_boarding_page_view.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  // page controller
  late PageController pageController;

  // current page index defult => 0
  var currentPage = 0;

  // initalization page controller
  @override
  void initState() {
    super.initState();
    pageController = PageController();
    pageController.addListener(() {
      int newPage = pageController.page!.round();
      if (currentPage != newPage) {
        setState(() {
          currentPage = newPage;
        });
      }
    });
  }

  // dispose page controller
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: OnBoardingPageView(pageController: pageController),
        ),
        DotsIndicator(
          dotsCount: 2,
          decorator: DotsDecorator(
            color: currentPage == 1 ? Color(0xff1B5E37) : Color(0xffAEDCAB),
            activeColor: activeDotColor,
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
        Visibility(
          visible: currentPage == 1 ? true : false,
          maintainAnimation: true,
          maintainSize: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
            child: CustomButton(
              text: LocaleKeys.SplashView2_buttonName.tr(),
              onTap: () {
                Prefs.setBool(kIsInBoardingView, true);
                Navigator.of(context)
                    .pushReplacementNamed(SignInView.routeName);
              },
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.05,
        ),
      ],
    );
  }
}
