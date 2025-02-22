import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:flutter/material.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CustomTextFormField(hintText: 'الاسم كامل', isPassword: false),
          SizedBox(
            height: screenHeight * .02,
          ),
          CustomTextFormField(hintText: 'البريد الإلكتروني', isPassword: false),
          SizedBox(
            height: screenHeight * .02,
          ),
          CustomTextFormField(hintText: 'العنوان', isPassword: false),
          SizedBox(
            height: screenHeight * .02,
          ),
          CustomTextFormField(hintText: 'المدينه', isPassword: false),
          SizedBox(
            height: screenHeight * .02,
          ),
          CustomTextFormField(
              hintText: 'رقم الطابق , رقم الشقه ..', isPassword: false),
          SizedBox(
            height: screenHeight * .02,
          ),
          CustomTextFormField(hintText: 'رقم الهاتف', isPassword: false),
          SizedBox(
            height: screenHeight * .02,
          ),
          SaveAddressToggle(),
        ],
      ),
    );
  }
}

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
