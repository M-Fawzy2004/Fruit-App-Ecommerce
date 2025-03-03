// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class PinCodeInputField extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final Function(String) onChanged;

  const PinCodeInputField({
    required this.formKey,
    required this.onChanged,
    super.key,
  });

  @override
  _PinCodeInputFieldState createState() => _PinCodeInputFieldState();
}

class _PinCodeInputFieldState extends State<PinCodeInputField> {
  late TextEditingController controller;
  late StreamController<ErrorAnimationType> errorController;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
    errorController = StreamController<ErrorAnimationType>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: PinCodeTextField(
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        validator: (v) => (v!.length < 6) ? "يرجى إدخال الكود الكامل" : null,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
          fieldHeight: 50,
          fieldWidth: 40,
          activeFillColor: Theme.of(context).colorScheme.tertiary,
          selectedFillColor: Theme.of(context).colorScheme.tertiary,
          inactiveFillColor: Theme.of(context).colorScheme.tertiary,
          activeColor: Theme.of(context).colorScheme.tertiary,
          inactiveColor: Theme.of(context).colorScheme.tertiary,
          selectedColor: Theme.of(context).colorScheme.tertiary,
        ),
        cursorColor: Colors.black,
        animationDuration: const Duration(milliseconds: 300),
        enableActiveFill: true,
        errorAnimationController: errorController,
        controller: controller,
        keyboardType: TextInputType.number,
        boxShadows: const [
          BoxShadow(
            offset: Offset(0, 1),
            color: Colors.black12,
            blurRadius: 10,
          ),
        ],
        onCompleted: (v) => debugPrint("Completed"),
        onChanged: widget.onChanged,
        beforeTextPaste: (text) => true,
      ),
    );
  }
}
