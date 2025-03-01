import 'package:e_commerce_app/feature/profile/presentation/view/widget/profile_view_body.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  static const routeName = 'profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: ProfileViewBody(),
      ),
    );
  }
}
