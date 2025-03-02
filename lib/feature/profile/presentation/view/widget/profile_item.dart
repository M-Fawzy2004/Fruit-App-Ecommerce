import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.text,
    required this.image,
    this.onTap,
    required this.imageIcon,
    required this.isIcon,
    this.onChanged,
    required this.isSwitched, // إضافة المتغير فقط
  });

  final String text, image, imageIcon;
  final void Function()? onTap;
  final bool isIcon;
  final bool isSwitched;
  final void Function(bool)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .06,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.tertiary,
        ),
        child: Row(
          children: [
            Image.asset(image),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: Styles.fontText13(context).copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ),
            isIcon
                ? Image.asset(
                    imageIcon,
                    color: Theme.of(context).colorScheme.primary,
                  )
                : Transform.scale(
                    scale: 0.7,
                    child: Switch(
                      value: isSwitched,
                      onChanged: onChanged,
                      activeColor: Theme.of(context).colorScheme.tertiary,
                      activeTrackColor: activeDotColor,
                      inactiveThumbColor:
                          Theme.of(context).colorScheme.inversePrimary,
                      inactiveTrackColor:
                          Theme.of(context).colorScheme.tertiary,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
