import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/pin_code_input_field.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final Function(String) onVerify;

  const OtpVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.onVerify,
  });

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String currentText = "";
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        Row(
          children: [
            Text(
              LocaleKeys.ResetPass_enterCode.tr(),
              style: Styles.fontText16(context),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        PinCodeInputField(
          formKey: formKey,
          onChanged: (value) => setState(() => currentText = value),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        CustomButton(
          text: LocaleKeys.ResetPass_checkPin.tr(),
          onTap: () {
            if (formKey.currentState!.validate()) {
              if (currentText.length != 4 || currentText != "1234") {
                setState(() => hasError = true);
              } else {
                setState(() => hasError = false);
                ScaffoldMessenger.of(context).showSnackBar(
                  buildSnakBarError('تم التحقق'),
                );
                widget.onVerify(currentText);
              }
            }
          },
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        GestureDetector(
          onTap: () {},
          child: Text(
            LocaleKeys.ResetPass_resentCode.tr(),
            style: Styles.fontText16(context).copyWith(
              color: Color(0xff2D9F5D),
            ),
          ),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.03,
        ),
        if (hasError)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                LocaleKeys.ResetPass_sureCompleteData.tr(),
                style: Styles.fontText13(context).copyWith(
                  color: Colors.red,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
