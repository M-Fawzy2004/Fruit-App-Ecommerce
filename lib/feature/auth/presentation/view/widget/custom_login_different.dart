import 'package:e_commerce_app/core/utils/assets.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signin_cubit/signin_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_login_diff.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLoginDifferent extends StatelessWidget {
  const CustomLoginDifferent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.035,
        ),
        CustomLoginDiff(
          image: Assets.imagesGoogle,
          title: LocaleKeys.Login_loginWithG.tr(),
          onTap: () {
            context.read<SigninCubit>().signInWithGoogle();
          },
        ),
        // SizedBox(
        //   height: MediaQuery.of(context).size.height * 0.02,
        // ),
        // CustomLoginDiff(
        //   image: Assets.imagesApple,
        //   color: Theme.of(context).colorScheme.inversePrimary,
        //   title: LocaleKeys.Login_loginWithA.tr(),
        //   onTap: () {},
        // ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        CustomLoginDiff(
          image: Assets.imagesFacebook,
          title: LocaleKeys.Login_loginWithF.tr(),
          onTap: () {
            context.read<SigninCubit>().signInWithFacebook();
          },
        ),
      ],
    );
  }
}
