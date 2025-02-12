import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar(context, {required String title, List<Widget>? actions}) {
  bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
  return AppBar(
    title: Text(
      title,
      style: Styles.titleSplashView(context),
    ),
    actions: actions,
    leading: isArabic ? _buildBackButton(context) : _buildBackButton(context),
    centerTitle: true,
  );
}

Widget _buildBackButton(BuildContext context) {
  return IconButton(
    onPressed: () {
      Navigator.pop(context);
    },
    icon: const Icon(Icons.arrow_back_ios),
  );
}
