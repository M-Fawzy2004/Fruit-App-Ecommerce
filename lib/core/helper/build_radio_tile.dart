import 'package:flutter/material.dart';

Widget buildRadioTile(
  BuildContext context, {
  required String title,
  required String value,
  required String groupValue,
  required Function(String?) onChanged,
}) {
  return RadioListTile<String>(
    title: Text(title, style: const TextStyle(fontSize: 16)),
    value: value,
    groupValue: groupValue,
    onChanged: onChanged,
    activeColor: Theme.of(context).colorScheme.surface,
  );
}
