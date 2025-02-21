import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class DetailsFeatureCard extends StatelessWidget {
  const DetailsFeatureCard({
    super.key,
    required this.title,
    required this.image,
    required this.subtitle,
  });

  final String title;
  final String subtitle;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 7),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiary,
        border: Border.all(color: Colors.transparent),
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        minVerticalPadding: 25,
        title: Text(
          title,
          style: Styles.fontText13(context).copyWith(
            color: Color(0xff23AA49),
            fontWeight: FontWeight.w800,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: Styles.fontText16(context),
        ),
        trailing: Image.asset(image),
      ),
    );
  }
}
