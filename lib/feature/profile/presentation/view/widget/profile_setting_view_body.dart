import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/edit_profile_screen.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileSettingViewBody extends StatelessWidget {
  const ProfileSettingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: ProductViewHeader(
              isVisible: true,
              isVisibleNotification: false,
              title: LocaleKeys.Profile_profile.tr(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.04,
          ),
        ),
        SliverToBoxAdapter(
          child: EditProfileScreen(),
        ),
      ],
    );
  }
}
