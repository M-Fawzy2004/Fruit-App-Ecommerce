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
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onSelect,
        child: Container(
          height: MediaQuery.sizeOf(context).height * 0.1,
          width: double.infinity,
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
