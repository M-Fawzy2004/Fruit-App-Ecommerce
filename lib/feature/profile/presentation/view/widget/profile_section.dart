import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/favourite_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/order_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/profile_setting_view.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/profile_item.dart';
import 'package:e_commerce_app/theme/theme_app_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileSection extends StatefulWidget {
  const ProfileSection({super.key});

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Column(
      children: [
        ProfileItem(
          onTap: () =>
              Navigator.pushNamed(context, ProfileSettingView.routeName),
          text: 'الملف الشخصي',
          image: Assets.imagesUser,
          imageIcon: Assets.imagesArrowVector,
          isIcon: true,
        ),
        SizedBox(
          height: screenHeight * .005,
        ),
        ProfileItem(
          onTap: () => Navigator.pushNamed(context, OrderView.routeName),
          text: 'طلباتي',
          image: Assets.imagesBox,
          imageIcon: Assets.imagesArrowVector,
          isIcon: true,
        ),
        SizedBox(
          height: screenHeight * .005,
        ),
        ProfileItem(
          onTap: () => Navigator.pushNamed(context, FavouriteView.routeName),
          text: 'المفضلة',
          image: Assets.imagesHeart,
          imageIcon: Assets.imagesArrowVector,
          isIcon: true,
        ),
        SizedBox(
          height: screenHeight * .005,
        ),
        ProfileItem(
          text: 'الإشعارات',
          image: Assets.imagesNotf,
          imageIcon: Assets.imagesArrowVector,
          onChanged: (val) {
            setState(() {
              isSwitched = val;
            });
          },
          isIcon: false,
        ),
        SizedBox(
          height: screenHeight * .005,
        ),
        ProfileItem(
          text: 'اللغه',
          image: Assets.imagesHeart,
          imageIcon: Assets.imagesArrowVector,
          isIcon: true,
        ),
        SizedBox(
          height: screenHeight * .005,
        ),
        ProfileItem(
          text: 'الوضع',
          image: Assets.imagesMagicpen,
          imageIcon: Assets.imagesArrowVector,
          onChanged: (val) {
            setState(() {
              final themeProvider =
                  Provider.of<ThemeAppProvider>(context, listen: false);
              themeProvider.toggleTheme();
            });
          },
          isIcon: false,
        ),
      ],
    );
  }
}
