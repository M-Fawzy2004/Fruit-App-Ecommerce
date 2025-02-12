import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class NotHaveAccountAndHaveAccount extends StatelessWidget {
  const NotHaveAccountAndHaveAccount({
    super.key,
    required this.title1,
    required this.title2,
    this.onTap,
  });

  final String title1;
  final String title2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title1,
          style: Styles.fontText16(context),
        ),
        Text(' '),
        GestureDetector(
          onTap: onTap,
          child: Text(
            title2,
            style: Styles.fontText16(context).copyWith(color: activeDotColor),
          ),
        )
      ],
    );
  }
}
