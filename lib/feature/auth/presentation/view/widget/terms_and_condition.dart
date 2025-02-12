import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_check_box.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class TermsAndCondition extends StatelessWidget {
  final bool isAccepted;
  final ValueChanged<bool> onChanged;

  const TermsAndCondition({
    super.key,
    required this.isAccepted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // check box
        CustomCheckBox(
          isChecker: isAccepted,
          onChanged: (bool value) {
            onChanged(value);
          },
        ),

        // size box width
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.04,
        ),

        // size box height and text rich
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.7,
          child: Text.rich(
            TextSpan(
              children: [
                // text span 1
                TextSpan(
                  text: LocaleKeys.SignUp_agreeText1.tr(),
                  style: Styles.fontText13(context),
                ),

                // text span 2
                TextSpan(
                  text: LocaleKeys.SignUp_agreeText2.tr(),
                  style: Styles.fontText13(context).copyWith(
                    color: const Color(0xff1B5E37),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
