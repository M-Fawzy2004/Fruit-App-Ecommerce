import 'package:e_commerce_app/core/helper/build_radio_tile.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:flutter/material.dart';

void showSortBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Theme.of(context).colorScheme.tertiary,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      String selectedValue = 'price_asc';
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'ترتيب حسب :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                buildRadioTile(
                  context,
                  title: 'السعر ( الأقل إلى الأعلى )',
                  value: 'price_asc',
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val!;
                    });
                  },
                ),
                buildRadioTile(
                  context,
                  title: 'السعر ( الأعلى إلى الأقل )',
                  value: 'price_desc',
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val!;
                    });
                  },
                ),
                buildRadioTile(
                  context,
                  title: 'الأبجدية',
                  value: 'alphabetical',
                  groupValue: selectedValue,
                  onChanged: (val) {
                    setState(() {
                      selectedValue = val!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                CustomButton(
                  text: 'تصفيه',
                  onTap: () {
                    Navigator.pop(context, selectedValue);
                  },
                ),
              ],
            ),
          );
        },
      );
    },
  );
}
