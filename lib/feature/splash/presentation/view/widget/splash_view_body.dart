// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/core/services/firebase_auth_services.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/presentation/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../on_boarding/presentation/view/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    // navgation to onboarding view
    excuteNavgation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // image plant
        Align(
          alignment: Alignment.bottomLeft,
          child: SvgPicture.asset(Assets.imagesFreepikPlant),
        ),
        // image fruit hub
        SvgPicture.asset(Assets.imagesFruitHub),
        // image circles
        SvgPicture.asset(
          Assets.imagesFreepikCircles,
          fit: BoxFit.fill,
        ),
      ],
    );
  }

  // method navgation
  void excuteNavgation() {
    // bool isInBoardingView = Prefs.getBool(kIsInBoardingView);
    Future.delayed(
      const Duration(seconds: 3),
      () {
        // if (isInBoardingView) {
        //   Navigator.pushReplacementNamed(context, LoginView.routeName);
        // } else {
        //   Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        // }
        var isLogin = FirebaseAuthServices().isLoggedIn();
        if (isLogin) {
          Navigator.pushReplacementNamed(context, MainView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
  }
}
