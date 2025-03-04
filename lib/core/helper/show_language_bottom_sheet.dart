import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/services/shared_preference_singleton.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void showLanguageBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) {
      String currentLanguage = context.locale.languageCode;

      return Container(
        padding: EdgeInsets.all(16),
        color: Theme.of(context).colorScheme.tertiary,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${LocaleKeys.Profile_currentLanguage.tr()} ${currentLanguage == 'ar' ? 'العربية' : 'English'}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Divider(),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: currentLanguage == 'ar'
                      ? Colors.green
                      : Colors.transparent,
                ),
              ),
              child: ListTile(
                title: Text('العربية'),
                trailing: currentLanguage == 'ar'
                    ? Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () => _changeLanguage(context, Locale('ar')),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: currentLanguage == 'en'
                      ? Colors.green
                      : Colors.transparent,
                ),
              ),
              child: ListTile(
                title: Text('English'),
                trailing: currentLanguage == 'en'
                    ? Icon(Icons.check, color: Colors.green)
                    : null,
                onTap: () => _changeLanguage(context, Locale('en')),
              ),
            ),
          ],
        ),
      );
    },
  );
}

void _changeLanguage(BuildContext context, Locale locale) async {
  await context.setLocale(locale);
  await Prefs.setString('selected_locale', locale.languageCode);

  Navigator.pop(context);

  ScaffoldMessenger.of(context).showSnackBar(
    buildSnakBarError(
      "تم تغيير اللغة إلى ${locale.languageCode == 'ar' ? 'العربية' : 'English'}",
      backgroundColor: activeDotColor,
    ),
  );
}
