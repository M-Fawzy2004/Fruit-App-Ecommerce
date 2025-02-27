// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/main_view_body_bloc_consumer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const routeName = '/home';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final items = [
    Icon(CupertinoIcons.house_fill),
    Icon(CupertinoIcons.square_grid_2x2),
    Icon(CupertinoIcons.cart_fill),
    Icon(CupertinoIcons.person_fill),
  ];

  int index = 0;

  void onItemTapped(int index) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    setState(() {
      this.index = isArabic ? index : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        bottomNavigationBar: methodCurvedNavigationBar(context),
        body: MainViewBodyBlocConsumer(index: index),
      ),
    );
  }

  // curved navigation bar
  CurvedNavigationBar methodCurvedNavigationBar(BuildContext context) {
    return CurvedNavigationBar(
      onTap: onItemTapped,
      index: index,
      color: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      buttonBackgroundColor: Color(0xff1B5E37),
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInOut,
      items: items,
    );
  }
}
