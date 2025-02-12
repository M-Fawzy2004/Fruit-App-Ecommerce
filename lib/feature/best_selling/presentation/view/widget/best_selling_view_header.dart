import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BestSellingViewHeader extends StatelessWidget {
  const BestSellingViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        Text(
          LocaleKeys.HomeView_bestSeller.tr(),
          style: Styles.fontText19(context),
        ),
        Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kColorGery2,
          ),
          child: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              Assets.imagesNotification,
              // ignore: deprecated_member_use
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }
}
