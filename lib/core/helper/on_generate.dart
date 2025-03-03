import 'package:e_commerce_app/core/entities/product_entity.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/recovery_view.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/signup_view.dart';
import 'package:e_commerce_app/feature/best_selling/presentation/view/best_selling_view.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/checkout_view.dart';
import 'package:e_commerce_app/feature/home/entities/cart_entity.dart';
import 'package:e_commerce_app/feature/home/presentation/view/cart_view.dart';
import 'package:e_commerce_app/feature/item_details/presentation/view/item_details_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/main_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/product_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/favourite_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/order_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/profile_setting_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/profile_view.dart';
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

    // recovery steps view
    case RecoveryView.routeName:
      return MaterialPageRoute(builder: (context) => RecoveryView());

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
      final product = settings.arguments as ProductEntity?;
      if (product != null) {
        return MaterialPageRoute(
          builder: (context) => ItemDetailsView(productEntity: product),
        );
      }
      return MaterialPageRoute(builder: (context) => Scaffold());

    // chechout view
    case CheckoutView.routeName:
      final cartEntity = settings.arguments as CartEntity?;
      if (cartEntity != null) {
        return MaterialPageRoute(
          builder: (context) => CheckoutView(
            cartEntity: cartEntity,
          ),
        );
      }
      return MaterialPageRoute(builder: (context) => Scaffold());

    // profile view
    case ProfileView.routeName:
      return MaterialPageRoute(builder: (context) => ProfileView());

    // profile setting view
    case ProfileSettingView.routeName:
      return MaterialPageRoute(builder: (context) => ProfileSettingView());

    // order view
    case OrderView.routeName:
      return MaterialPageRoute(builder: (context) => OrderView());

    // favourite view
    case FavouriteView.routeName:
      return MaterialPageRoute(builder: (context) => FavouriteView());

    // default
    default:
      return MaterialPageRoute(builder: (context) => Scaffold());
  }
}
