import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EditProfileTextField extends StatelessWidget {
  final String text;
  final TextEditingController controller;
  final bool isEditable;
  final void Function()? onEditPressed;
  final String? image;
  const EditProfileTextField({
    super.key,
    required this.text,
    required this.controller,
    required this.isEditable,
    this.onEditPressed,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      readOnly: !isEditable,
      decoration: InputDecoration(
        fillColor: Theme.of(context).colorScheme.tertiary,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 15,
        ),
        hintText: text,
        hintStyle: Styles.titleLoginStyle(),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: methodEnableOutlineBorder(),
        focusedBorder: methodFocusOutlineBorder(),
        suffixIcon: image != null
            ? GestureDetector(
                onTap: onEditPressed,
                child: Image.asset(image!),
              )
            : null,
      ),
    );
  }

  OutlineInputBorder methodEnableOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: kColorGery,
      ),
    );
  }

  OutlineInputBorder methodFocusOutlineBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: kColorGery,
        width: 2,
      ),
    );
  }
}
