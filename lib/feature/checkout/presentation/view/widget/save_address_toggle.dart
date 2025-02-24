import 'package:flutter/material.dart';

class SaveAddressToggle extends StatefulWidget {
  const SaveAddressToggle({super.key});

  @override
  State<SaveAddressToggle> createState() => _SaveAddressToggleState();
}

class _SaveAddressToggleState extends State<SaveAddressToggle> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.scale(
            scale: 0.7,
            child: Switch(
              value: isSwitched,
              onChanged: (value) {
                setState(() {
                  isSwitched = value;
                });
              },
              activeColor: Colors.white,
              activeTrackColor: Colors.green,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: Colors.grey,
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .02,
          ),
          Text(
            'حفظ العنوان',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
