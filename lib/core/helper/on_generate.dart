import 'package:e_commerce_app/feature/auth/presentation/view/signup_view.dart';
import 'package:e_commerce_app/feature/best_selling/presentation/view/best_selling_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/home_view.dart';
import 'package:e_commerce_app/feature/splash/presentation/view/splash_view.dart';
import 'package:flutter/material.dart';
import '../../feature/auth/presentation/view/signin_view.dart';
import '../../feature/on_boarding/presentation/view/on_boarding_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    // splash view
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => SplashView());

    // OnBoarding View
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => OnBoardingView());

    // LoginView
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => SignInView());

    // SignupView
    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());

    // Homeview
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => HomeView());

    // BestSellingView
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => BestSellingView());

    // default
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
