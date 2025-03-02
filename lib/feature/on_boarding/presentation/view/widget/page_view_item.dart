import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/services/shared_preference_singleton.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../auth/presentation/view/signin_view.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundimage,
    required this.description,
    required this.title,
    required this.isVisible,
  });

  final String image, backgroundimage, description;
  final Widget title;
  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // add size box for height => 0.5
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: SvgPicture.asset(
                  backgroundimage,
                  fit: BoxFit.fill,
                ),
              ),

              // Moving image
              Positioned(
                top: 90,
                right: 0,
                left: 0,
                child: Image.asset(image),
              ),

              // text skip
              Visibility(
                visible: isVisible,
                child: GestureDetector(
                  onTap: () {
                    Prefs.setBool(kIsInBoardingView, true);
                    Navigator.of(context)
                        .pushReplacementNamed(SignInView.routeName);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 25,
                    ),
                    child: Text(
                      LocaleKeys.SplashView1_hintTitle.tr(),
                      style: Styles.fontText13(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // text title splash view
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 45),
          child: title,
        ),

        // desc splash view
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60.0),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: Styles.fontText13(context),
          ),
        ),
      ],
    );
  }
}
