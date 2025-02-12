import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/core/utils/left_curve_clipper.dart';
import 'package:e_commerce_app/core/utils/right_curve_clipper.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/featured_button.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    var size = MediaQuery.sizeOf(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        color: Theme.of(context).colorScheme.tertiary,
        width: size.width - 55,
        child: AspectRatio(
          aspectRatio: 342 / 150,
          child: Stack(
            children: [
              isArabic
                  ? Positioned(
                      left: 0,
                      bottom: 0,
                      right: size.width * 0.5,
                      child: Image.asset(
                        Assets.imagesPineappleCuate,
                      ),
                    )
                  : Positioned(
                      left: size.width * 0.5,
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        Assets.imagesPineappleCuate,
                      ),
                    ),
              ClipPath(
                clipper: isArabic ? LeftCurveClipper() : RightCurveClipper(),
                child: Container(
                  width: size.width * 0.5,
                  color: Colors.green,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Spacer(),
                        Text(
                          LocaleKeys.HomeView_eidOffers.tr(),
                          style: Styles.fontText13(context).copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        Spacer(),
                        Text(
                          LocaleKeys.HomeView_discount.tr(),
                          style: Styles.fontText19(context).copyWith(
                            color: Theme.of(context).colorScheme.surface,
                          ),
                        ),
                        Spacer(),
                        FeaturedButton(
                          title: LocaleKeys.HomeView_shopNow.tr(),
                          onPressed: () {},
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
