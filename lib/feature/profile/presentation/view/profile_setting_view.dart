import 'package:e_commerce_app/feature/profile/presentation/view/widget/profile_setting_view_body.dart';
import 'package:flutter/material.dart';

class ProfileSettingView extends StatelessWidget {
  const ProfileSettingView({super.key});

  static const routeName = 'profileSetting';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileSettingViewBody(),
    );
  }
}
