import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneNumberEntryBox extends StatefulWidget {
  final ValueChanged<String>? onPhoneNumberChanged;

  const PhoneNumberEntryBox({super.key, this.onPhoneNumberChanged});

  @override
  State<PhoneNumberEntryBox> createState() => _PhoneNumberEntryBoxState();
}

class _PhoneNumberEntryBoxState extends State<PhoneNumberEntryBox> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final FocusNode _phoneNumberFocusNode = FocusNode();
  String _errorText = '';

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _phoneNumberFocusNode.dispose();
    super.dispose();
  }

  bool _validatePhoneNumber(String phoneNumber) {
    final RegExp phoneRegex = RegExp(r'^\d{10}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  void _onPhoneNumberChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorText = '';
      } else if (!_validatePhoneNumber(value)) {
        _errorText = "الرجاء إدخال رقم هاتف صالح مكون من 10 أرقام";
      } else {
        _errorText = '';
      }
    });

    widget.onPhoneNumberChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _phoneNumberController,
          focusNode: _phoneNumberFocusNode,
          style: Styles.fontText16(context),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.end,
          decoration: InputDecoration(
            hintText: '10012345678',
            hintStyle: Styles.fontText16(context).copyWith(
              color: Colors.grey,
            ),
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
            errorText: _errorText.isNotEmpty ? _errorText : null,
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * 0.003,
                    height: MediaQuery.sizeOf(context).height * 0.03,
                    color: kColorGery,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.02,
                  ),
                  Text(
                    '+20',
                    style: Styles.fontText16(context),
                  ),
                ],
              ),
            ),
          ),
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            LengthLimitingTextInputFormatter(10),
          ],
          onChanged: _onPhoneNumberChanged,
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
      ],
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
