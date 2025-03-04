import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberForm extends StatelessWidget {
  final TextEditingController phoneNumberController;
  final FocusNode phoneNumberFocusNode;
  final String errorText;
  final ValueChanged<String> onPhoneNumberChanged;
  final Function(String?)? onSaved;

  const PhoneNumberForm({
    super.key,
    required this.phoneNumberController,
    required this.phoneNumberFocusNode,
    required this.errorText,
    required this.onPhoneNumberChanged,
    this.onSaved,
  });

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            onSaved: onSaved,
            controller: phoneNumberController,
            focusNode: phoneNumberFocusNode,
            style: Styles.fontText16(context),
            textAlign: isArabic ? TextAlign.end : TextAlign.start,
            decoration: InputDecoration(
              fillColor: Theme.of(context).colorScheme.tertiary,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 15,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: _methodEnableOutlineBorder(),
              focusedBorder: _methodFocusOutlineBorder(),
              errorText: errorText.isNotEmpty ? errorText : null,
              prefixIcon: isArabic ? null : _buildCountryCode(context),
              suffixIcon: isArabic ? _buildCountryCode(context) : null,
            ),
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(119),
            ],
            onChanged: onPhoneNumberChanged,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
        ],
      ),
    );
  }

  Widget _buildCountryCode(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '+20',
            style: Styles.fontText16(context),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.02,
          ),
          Container(
            width: MediaQuery.sizeOf(context).width * 0.003,
            height: MediaQuery.sizeOf(context).height * 0.03,
            color: kColorGery,
          ),
        ],
      ),
    );
  }

  OutlineInputBorder _methodEnableOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: kColorGery,
      ),
    );
  }

  OutlineInputBorder _methodFocusOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: kColorGery,
        width: 2,
      ),
    );
  }
}
