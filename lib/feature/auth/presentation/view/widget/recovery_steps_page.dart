import 'package:e_commerce_app/feature/auth/presentation/view/widget/forget_password_view.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/pin_code_verf_view.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/reset_password.dart';
import 'package:flutter/material.dart';

class RecoveryStepsPage extends StatelessWidget {
  const RecoveryStepsPage({super.key});

  static const routeName = '/recovery_steps_page';

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: getPage().length,
      itemBuilder: (context, index) {
        return getPage()[index];
      },
    );
  }

  List<Widget> getPage() {
    return [
      ForgetPasswordView(),
      PinCodeVerificationView(),
      ResetPassword(),
    ];
  }
}
