import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomViewAppBar extends StatelessWidget {
  const CustomViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SvgPicture.asset(Assets.imagesProfileImage),
      title: Text(
        'صباح الخير !..',
        style: Styles.fontText13(context).copyWith(
          color: Color(0xff949D9E),
        ),
      ),
      subtitle: Text(''),
    );
  }
}
