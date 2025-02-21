import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class ProductDetailsInfoSection extends StatelessWidget {
  const ProductDetailsInfoSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '20جنية / الكيلو',
                    style: Styles.fontText16(context).copyWith(
                      color: Color(0xffF4A91F),
                    ),
                  ),
                ],
              ),
              Spacer(),
              Icon(Icons.add),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star,
                  color: Color(0xffFFC529),
                ),
              ),
              Text(
                '4.5',
                style: Styles.fontText13(context).copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.02,
              ),
              Text(
                '(+35)',
                style: Styles.fontText13(context).copyWith(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.02,
              ),
              Text(
                'المراجعه',
                style: Styles.fontText13(context).copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: activeDotColor,
                  color: activeDotColor,
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.015,
          ),
          Text(
            'ينتمي إلى الفصيلة القرعية ولثمرته لُب حلو المذاق وقابل للأكل، وبحسب علم النبات فهي تعتبر ثمار لبيّة، تستعمل لفظة البطيخ للإشارة إلى النبات نفسه أو إلى الثمرة تحديداً',
            style: Styles.fontText13(context),
          ),
        ],
      ),
    );
  }
}
