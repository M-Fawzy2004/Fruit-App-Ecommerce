import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CustomDifferentPayment extends StatelessWidget {
  const CustomDifferentPayment({
    super.key,
    required this.image,
    required this.isSelected,
    required this.onSelect,
  });

  final String image;
  final bool isSelected;
  final VoidCallback onSelect;

  @override
  Widget build(BuildContext context) {
    bool isArabic = EasyLocalization.of(context)?.locale.languageCode == 'ar';
    return Padding(
      padding:
          isArabic ? EdgeInsets.only(left: 10.0) : EdgeInsets.only(right: 10.0),
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.08,
          width: MediaQuery.sizeOf(context).width * 0.25,
          decoration: BoxDecoration(
            border: Border.all(
              color: isSelected ? Colors.green : Colors.grey,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
