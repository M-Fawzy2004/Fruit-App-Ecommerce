import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/widget/custom_modal_progress_hud.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signin_cubit/signin_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/signin_view_body.dart';
import 'package:e_commerce_app/feature/home/presentation/view/main_view.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBlocConsumer extends StatelessWidget {
  const SignInViewBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninCubitState>(
      listener: (context, state) {
        if (state is SigninCubitSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              LocaleKeys.FirbaseExecption_loginSuccess.tr(),
              backgroundColor: Color(0xff1C5D38),
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const MainView()),
            (route) => false,
          );
        }
        if (state is SigninCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              state.message,
              backgroundColor: Color(0xff1C5D38),
            ),
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          text: LocaleKeys.Loading_loginTextAccount.tr(),
          inAsyncCall: state is SigninCubitLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}
