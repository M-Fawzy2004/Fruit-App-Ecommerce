// ignore_for_file: avoid_print

import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/otp_verification_screen.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PinCodeVerificationView extends StatefulWidget {
  const PinCodeVerificationView({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  State<PinCodeVerificationView> createState() =>
      _PinCodeVerificationViewState();
}

class _PinCodeVerificationViewState extends State<PinCodeVerificationView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool hasError = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: ProductViewHeader(
              isVisible: true,
              isVisibleNotification: false,
              title: LocaleKeys.ResetPass_checkPin.tr(),
            ),
          ),
          SliverToBoxAdapter(
            child: OtpVerificationScreen(
              phoneNumber: '',
              onVerify: (code) {
                print("تم التحقق بالكود: $code");
              },
            ),
          ),
        ],
      ),
    );
  }
}
