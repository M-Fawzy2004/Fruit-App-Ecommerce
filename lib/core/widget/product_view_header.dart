import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductViewHeader extends StatelessWidget {
  const ProductViewHeader({
    super.key,
    required this.isVisible,
    required this.isVisibleNotification,
    required this.title,
  });

  final bool isVisible;
  final bool isVisibleNotification;
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (isVisible)
            Align(
              alignment:
                  isArabic ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.05,
                width: MediaQuery.sizeOf(context).width * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).colorScheme.tertiary,
                ),
                child: FittedBox(
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new_outlined,
                    ),
                  ),
                ),
              ),
            ),
          Text(
            title,
            style: Styles.fontText19(context),
          ),
          if (isVisibleNotification)
            Align(
              alignment:
                  isArabic ? Alignment.centerLeft : Alignment.centerRight,
              child: Container(
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
                    color: Colors.black, // ignore: deprecated_member_use
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
