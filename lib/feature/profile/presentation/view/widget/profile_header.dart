import 'package:e_commerce_app/core/helper/function/get_user.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/profile/presentation/provider/user_provider/user_provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .09,
      child: Stack(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.tertiary,
            radius: 35,
            child: Image.asset(Assets.imagesPerson),
          ),
          Positioned(
            bottom: 0,
            right: isArabic ? 22 : null,
            left: isArabic ? null : 22,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: Image.asset(
                  Assets.imagesCamera,
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Positioned(
            right: isArabic ? 100 : null,
            left: isArabic ? null : 100,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Provider.of<UserProvider>(context).name,
                  style: Styles.fontText13(context).copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * .005,
                ),
                Text(
                  getUser().email,
                  style: Styles.fontText13(context).copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
