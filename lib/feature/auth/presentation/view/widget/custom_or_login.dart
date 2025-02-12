import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CutomOrLogin extends StatelessWidget {
  const CutomOrLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            endIndent: 20,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        Text(
          LocaleKeys.Login_or.tr(),
          style: Styles.fontText16(context).copyWith(
            fontWeight: FontWeight.w900,
          ),
        ),
        Expanded(
          child: Divider(
            indent: 20,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ],
    );
  }
}
