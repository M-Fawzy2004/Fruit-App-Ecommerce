import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/feature/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commerce_app/feature/home/presentation/view/widget/main_view_body.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBodyBlocConsumer extends StatelessWidget {
  const MainViewBodyBlocConsumer({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartItemAdded) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              LocaleKeys.Success_titleAdd.tr(),
              backgroundColor: activeDotColor,
            ),
          );
        }
        if (state is CartItemRemoved) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              LocaleKeys.Success_titleRemoved.tr(),
              backgroundColor: activeDotColor,
            ),
          );
        }
      },
      child: MainViewBody(index: index),
    );
  }
}
