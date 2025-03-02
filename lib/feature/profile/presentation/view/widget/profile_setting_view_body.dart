import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/profile/presentation/view/widget/edit_profile_screen.dart';
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
              title: 'الملف الشخصي',
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
