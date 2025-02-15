import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/cart_item.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              ProductViewHeader(
                title: LocaleKeys.HomeView_cart.tr(),
                isVisible: false,
                isVisibleNotification: false,
              ),
              SizedBox(height: size.height * 0.02),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.04,
                width: double.infinity,
                color: Color(0xffEBF9F1),
                child: Center(
                  child: Text(
                    'لديك 3 منتجات في سله التسوق',
                    style: Styles.fontText13(context).copyWith(
                      color: activeDotColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              CartItem(),
            ],
          ),
        )
      ],
    );
  }
}
