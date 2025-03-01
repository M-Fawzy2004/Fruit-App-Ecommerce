import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomLogoutAccount extends StatelessWidget {
  const CustomLogoutAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'تسجيل الخروج',
              style: Styles.fontText13(context).copyWith(
                color: activeDotColor,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * .05,
            ),
            Image.asset(
              Assets.imagesArrowlogout,
              color: activeDotColor,
            ),
          ],
        ),
      ),
    );
  }
}
