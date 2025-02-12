import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).colorScheme.tertiary,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.favorite_outline),
            ),
          ),
          Positioned.fill(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Image.asset(
                    Assets.imagesPineappleCuate,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                ListTile(
                  title: Text(
                    'بطيخ',
                    style: Styles.fontText13(context),
                  ),
                  subtitle: FittedBox(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '20جنية',
                            style: Styles.fontText16(context).copyWith(
                              color: Color(0xffF4A91F),
                            ),
                          ),
                          TextSpan(
                            text: " / ",
                            style: Styles.fontText16(context).copyWith(
                              color: Color(0xffF4A91F),
                            ),
                          ),
                          TextSpan(
                            text: 'الكيلو',
                            style: Styles.fontText13(context).copyWith(
                              color: Color(0xffF8C76D),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  trailing: CircleAvatar(
                    backgroundColor: Color(0xff1B5E37),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.add,
                        color: Theme.of(context).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
