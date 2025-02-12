import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomLoginDiff extends StatelessWidget {
  const CustomLoginDiff({
    super.key,
    required this.image,
    required this.title,
    this.onTap,
    this.color,
  });

  final String image, title;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.065,
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SvgPicture.asset(
                image,
                // ignore: deprecated_member_use
                color: color,
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.16,
            ),
            Center(
              child: Text(title, style: Styles.fontText16(context)),
            ),
          ],
        ),
      ),
    );
  }
}
