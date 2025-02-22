import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class ShippingItem extends StatelessWidget {
  const ShippingItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  final String title;
  final String subtitle;
  final String price;
  final int value;
  final int groupValue;
  final void Function(int?) onChanged;

  @override
  Widget build(BuildContext context) {
    bool isSelected = value == groupValue;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onChanged(value),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(12),
            border: isSelected
                ? Border.all(
                    color: activeDotColor,
                    width: 2,
                  )
                : null,
          ),
          child: ListTile(
            trailing: Text(
              price,
              style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),
            leading: Radio<int>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
              activeColor: Colors.green,
            ),
            selected: isSelected,
          ),
        ),
      ),
    );
  }
}
