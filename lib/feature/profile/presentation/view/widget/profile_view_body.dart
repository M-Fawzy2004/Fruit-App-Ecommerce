import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/custom_logout_account.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/profile_header.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/profile_section.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ProductViewHeader(
            isVisible: false,
            isVisibleNotification: false,
            title: LocaleKeys.Profile_myAccount.tr(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.04,
          ),
        ),
        SliverToBoxAdapter(
          child: ProfileHeader(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.04,
          ),
        ),
        SliverToBoxAdapter(
          child: ProfileSection(),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: screenHeight * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomLogoutAccount(),
        ),
      ],
    );
  }
}
