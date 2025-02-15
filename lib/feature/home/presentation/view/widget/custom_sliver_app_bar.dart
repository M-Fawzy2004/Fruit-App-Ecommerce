import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/text_app_bar_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    super.key,
    required this.isArabic,
  });

  final bool isArabic;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(Assets.imagesProfileImagepng),
            radius: 25,
          ),
          TextAppBarHeader(isArabic: isArabic),
          Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kColorGery2,
            ),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                Assets.imagesNotification,
                // ignore: deprecated_member_use
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
