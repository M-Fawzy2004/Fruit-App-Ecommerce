// ignore_for_file: deprecated_member_use

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_commerce_app/feature/home/presentation/view/product_view.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/custom_nested_scroll_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  final screens = [
    const CustomNestedScrollView(),
    const ProductView(),
    Center(child: const Text('عربه التسوق')),
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('الاعدادات'),
          SizedBox(
            height: 120,
          ),
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    ),
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
    return Scaffold(
      bottomNavigationBar: methodCurvedNavigationBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: screens[index],
        ),
      ),
    );
  }

  // curved navigation bar
  CurvedNavigationBar methodCurvedNavigationBar(BuildContext context) {
    return CurvedNavigationBar(
      onTap: onItemTapped,
      index: index,
      height: MediaQuery.sizeOf(context).height * 0.07,
      color: Theme.of(context).colorScheme.surface,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      buttonBackgroundColor: Color(0xff1B5E37),
      animationDuration: const Duration(milliseconds: 500),
      animationCurve: Curves.easeInOut,
      items: items,
    );
  }
}
