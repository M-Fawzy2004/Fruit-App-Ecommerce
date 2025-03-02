import 'package:e_commerce_app/core/helper/build_radio_tile.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
                Text(
                  LocaleKeys.CategoryProduct_sort.tr(),
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                buildRadioTile(
                  context,
                  title: LocaleKeys.CategoryProduct_priceLow.tr(),
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
                  title: LocaleKeys.CategoryProduct_priceHigh.tr(),
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
                  title: LocaleKeys.CategoryProduct_alphabet.tr(),
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
                  text: LocaleKeys.CategoryProduct_filtering.tr(),
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
