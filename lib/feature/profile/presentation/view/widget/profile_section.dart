import 'package:e_commerce_app/core/helper/show_language_bottom_sheet.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/favourite_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/order_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/profile_setting_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/profile_item.dart';
import 'package:e_commerce_app/theme/theme_app_provider.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool isNotificationsOn = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Consumer<ThemeAppProvider>(
      builder: (context, themeProvider, child) {
        return Column(
          children: [
            ProfileItem(
              onTap: () =>
                  Navigator.pushNamed(context, ProfileSettingView.routeName),
              text: LocaleKeys.Profile_profile.tr(),
              image: Assets.imagesUser,
              imageIcon: Assets.imagesArrowVector,
              isIcon: true,
              isSwitched: false,
            ),
            SizedBox(height: screenHeight * .005),
            ProfileItem(
              onTap: () => Navigator.pushNamed(context, OrderView.routeName),
              text: LocaleKeys.Profile_order.tr(),
              image: Assets.imagesBox,
              imageIcon: Assets.imagesArrowVector,
              isIcon: true,
              isSwitched: false,
            ),
            SizedBox(height: screenHeight * .005),
            ProfileItem(
              onTap: () =>
                  Navigator.pushNamed(context, FavouriteView.routeName),
              text: LocaleKeys.Profile_favorite.tr(),
              image: Assets.imagesHeart,
              imageIcon: Assets.imagesArrowVector,
              isIcon: true,
              isSwitched: false,
            ),
            SizedBox(height: screenHeight * .005),
            ProfileItem(
              text: LocaleKeys.Profile_notification.tr(),
              image: Assets.imagesNotf,
              imageIcon: Assets.imagesArrowVector,
              isSwitched: isNotificationsOn,
              onChanged: (val) {
                setState(() {
                  isNotificationsOn = val;
                });
              },
              isIcon: false,
            ),
            SizedBox(height: screenHeight * .005),
            ProfileItem(
              onTap: () async {
                showLanguageBottomSheet(context);
                setState(() {});
              },
              text: LocaleKeys.Profile_language.tr(),
              image: Assets.imagesGlobal,
              imageIcon: Assets.imagesArrowVector,
              isIcon: true,
              isSwitched: false,
            ),
            SizedBox(height: screenHeight * .005),
            ProfileItem(
              text: LocaleKeys.Profile_darkMode.tr(),
              image: Assets.imagesMagicpen,
              imageIcon: Assets.imagesArrowVector,
              isSwitched: themeProvider.isDarkMode,
              onChanged: (val) {
                themeProvider.toggleTheme();
              },
              isIcon: false,
            ),
          ],
        );
      },
    );
  }
}
