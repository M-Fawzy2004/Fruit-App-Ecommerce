import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/profile/presentation/provider/user_provider/user_provider.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextAppBarHeader extends StatelessWidget {
  const TextAppBarHeader({
    super.key,
    required this.isArabic,
  });

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: isArabic
            ? const EdgeInsets.only(right: 15.0)
            : const EdgeInsets.only(left: 15.0),
        child: RichText(
          textAlign: isArabic ? TextAlign.right : TextAlign.left,
          text: TextSpan(
            children: [
              TextSpan(
                text: "${LocaleKeys.HomeView_textAppBar.tr()}\n",
                style: Styles.fontText16(context).copyWith(
                  color: const Color(0xff949D9E),
                ),
              ),
              TextSpan(
                text: Provider.of<UserProvider>(context).name,
                style: Styles.fontText16(context).copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
