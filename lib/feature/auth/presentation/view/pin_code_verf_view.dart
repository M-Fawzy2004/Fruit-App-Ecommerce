import 'package:e_commerce_app/feature/auth/presentation/view/widget/pin_code_verf_view_body.dart';
import 'package:flutter/material.dart';

class PinCodeVerificationView extends StatelessWidget {
  const PinCodeVerificationView({
    super.key,
    this.phoneNumber,
  });

  final String? phoneNumber;
  static const routeName = 'PinCodeVerificationView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: SafeArea(
          child: PinCodeVerificationViewBody(),
        ),
      ),
    );
  }
}
