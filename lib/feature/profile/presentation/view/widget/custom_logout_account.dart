// ignore_for_file: use_build_context_synchronously

import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/signin_view.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomLogoutAccount extends StatelessWidget {
  const CustomLogoutAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, SignInView.routeName);
      },
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
              LocaleKeys.Profile_logout.tr(),
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
