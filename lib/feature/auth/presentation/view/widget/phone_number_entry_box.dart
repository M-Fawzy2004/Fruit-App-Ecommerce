import 'package:e_commerce_app/feature/auth/presentation/view/widget/phone_number_form.dart';
import 'package:flutter/material.dart';

class PhoneNumberEntryBox extends StatefulWidget {
  final ValueChanged<String>? onPhoneNumberChanged;
  final Function(String?)? onSaved;

  const PhoneNumberEntryBox({super.key, this.onPhoneNumberChanged, this.onSaved});

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
    final RegExp phoneRegex = RegExp(r'^\d{11}$');
    return phoneRegex.hasMatch(phoneNumber);
  }

  void _onPhoneNumberChanged(String value) {
    setState(() {
      if (value.isEmpty) {
        _errorText = '';
      } else if (!_validatePhoneNumber(value)) {
        _errorText = "الرجاء إدخال رقم هاتف صالح مكون من 11 أرقام";
      } else {
        _errorText = '';
      }
    });

    widget.onPhoneNumberChanged?.call(value);
  }

  @override
  Widget build(BuildContext context) {
    return PhoneNumberForm(
      phoneNumberController: _phoneNumberController,
      phoneNumberFocusNode: _phoneNumberFocusNode,
      errorText: _errorText,
      onPhoneNumberChanged: _onPhoneNumberChanged,
    );
  }
}
