import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashViewTitle extends StatelessWidget {
  const SplashViewTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // text title
        Text(
          LocaleKeys.SplashView1_title.tr(),
          style: Styles.titleSplashView(context),
        ),

        // text space
        Text(' '),

        // text span
        Text.rich(
          TextSpan(
            children: [
              // text span 1
              TextSpan(
                text: LocaleKeys.SplashView1_enTitle.tr(),
                style: Styles.titleSplashView(context).copyWith(
                  color: Color(0xff1B5E37),
                ),
              ),

              // text span 2
              TextSpan(
                text: LocaleKeys.SplashView1_enTitle2.tr(),
                style: Styles.titleSplashView(context).copyWith(
                  color: Color(0xffF4A91F),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
