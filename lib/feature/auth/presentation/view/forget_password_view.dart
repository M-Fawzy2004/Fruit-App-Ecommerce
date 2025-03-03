import 'package:e_commerce_app/feature/auth/presentation/view/widget/forget_password_view_body.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/pin_code_verf_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  static const routeName = 'ForgetPasswordView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: PageView(
            children: [
              ForgetPasswordViewBody(),
              PinCodeVerificationView(),
            ],
          ),
        ),
      ),
    );
  }
}
