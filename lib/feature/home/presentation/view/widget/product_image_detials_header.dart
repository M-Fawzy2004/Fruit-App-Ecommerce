import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/core/utils/curved_clipper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProductImageDetailsHeader extends StatelessWidget {
  const ProductImageDetailsHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Stack(
      children: [
        ClipPath(
          clipper: CurvedClipper(),
          child: Container(
            height: screenHeight * 0.55,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Positioned(
          top: screenHeight * 0.08,
          right: 0,
          left: 0,
          child: Image.asset(
            Assets.imagesImagetesttt1,
          ),
        ),
        Positioned(
          top: screenHeight * 0.04,
          right: isArabic ? screenHeight * 0.014 : null,
          left: isArabic ? null : screenHeight * 0.014,
          child: Container(
            height: screenHeight * 0.05,
            width: screenWidth * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.surface,
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
        Positioned(
          top: screenHeight * 0.49,
          right: isArabic ? screenHeight * 0.014 : null,
          left: isArabic ? null : screenHeight * 0.014,
          child: Text(
            'بطيخ احمر طازج',
            style: Styles.fontText19(context),
          ),
        ),
      ],
    );
  }
}
