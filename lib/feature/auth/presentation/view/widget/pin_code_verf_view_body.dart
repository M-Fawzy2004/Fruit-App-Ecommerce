import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/pin_code_input_field.dart';
import 'package:flutter/material.dart';

class PinCodeVerificationViewBody extends StatefulWidget {
  const PinCodeVerificationViewBody({super.key, this.phoneNumber});
  final String? phoneNumber;

  @override
  State<PinCodeVerificationViewBody> createState() =>
      _PinCodeVerificationViewBodyState();
}

class _PinCodeVerificationViewBodyState
    extends State<PinCodeVerificationViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool hasError = false;
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ProductViewHeader(
              isVisible: true,
              isVisibleNotification: false,
              title: 'التحقق من الرمز',
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'ادخل الكود المرسل لك',
                    style: Styles.fontText16(context),
                  ),
                ),
                Text(
                  "Enter the code sent to ${widget.phoneNumber}",
                  style: const TextStyle(color: Colors.black54, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
                PinCodeInputField(
                  formKey: formKey,
                  onChanged: (value) => setState(() => currentText = value),
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'تحقق من الرمز',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      if (currentText.length != 6 || currentText != "123456") {
                        setState(() => hasError = true);
                      } else {
                        setState(() => hasError = false);
                        ScaffoldMessenger.of(context)
                            .showSnackBar(buildSnakBarError('تم التحقق'));
                      }
                    }
                  },
                ),
                if (hasError)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "*يرجى ملء جميع الخلايا بشكل صحيح",
                        style: Styles.fontText13(context).copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
