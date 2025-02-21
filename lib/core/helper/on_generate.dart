import 'package:e_commerce_app/feature/auth/presentation/view/signup_view.dart';
import 'package:e_commerce_app/feature/best_selling/presentation/view/best_selling_view.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/checkout_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/cart_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/item_details_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/main_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/product_view.dart';
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
    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());

    // BestSellingView
    case BestSellingView.routeName:
      return MaterialPageRoute(builder: (context) => BestSellingView());

    // product view
    case ProductView.routeName:
      return MaterialPageRoute(builder: (context) => ProductView());

    // cart view
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());

    // item details view
    case ItemDetailsView.routeName:
      return MaterialPageRoute(builder: (context) => ItemDetailsView());

    // chechout view
    case CheckoutView.routeName:
      return MaterialPageRoute(builder: (context) => CheckoutView());

    // default
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
