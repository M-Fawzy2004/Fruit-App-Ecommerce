import 'package:e_commerce_app/core/helper/show_modal_bottom_sheet.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderProductView extends StatelessWidget {
  const HeaderProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          LocaleKeys.HomeView_product.tr(),
          style: Styles.fontText16(context),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => showSortBottomSheet(context),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: SvgPicture.asset(
                Assets.imagesArrowSwapHorizontal1,
              ),
            ),
          ),
        ),
      ],
    );
  }

}
