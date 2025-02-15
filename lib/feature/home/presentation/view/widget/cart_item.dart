import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_item_action_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CartItem extends StatefulWidget {
  const CartItem({super.key});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IntrinsicHeight(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.14,
            width: MediaQuery.sizeOf(context).width * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.tertiary,
            ),
            child: Center(
              child: Image.asset(
                height: MediaQuery.sizeOf(context).height * 0.14 - 30,
                Assets.imagesFrawola,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'أناناس',
                      style: Styles.fontText16(context),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(Assets.imagesTrash),
                    ),
                  ],
                ),
                Text(
                  'كيلو 5',
                  style: Styles.fontText16(context).copyWith(
                    color: Color(0xffF4A91F),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  children: [
                    CartItemActionButton(
                      onTap: () {
                        setState(() {
                          index++;
                        });
                      },
                      icon: Icons.add,
                      containerColor: activeDotColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: FittedBox(
                        child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.035,
                          width: MediaQuery.sizeOf(context).width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          child: Center(
                            child: Text(
                              '$index',
                              style: Styles.fontText19(context),
                            ),
                          ),
                        ),
                      ),
                    ),
                    CartItemActionButton(
                      onTap: () {
                        setState(() {
                          if (index == 1) {
                            return;
                          } else {
                            index--;
                          }
                        });
                      },
                      icon: Icons.remove,
                      containerColor: Theme.of(context).colorScheme.tertiary,
                    ),
                    Spacer(),
                    Text(
                      '${index * 60} جنيه',
                      style: Styles.fontText19(context).copyWith(
                        color: Color(0xffF4A91F),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
