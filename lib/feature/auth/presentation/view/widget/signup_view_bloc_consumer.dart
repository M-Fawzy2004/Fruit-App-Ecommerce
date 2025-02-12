import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/widget/custom_modal_progress_hud.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signup_cubits/signup_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/signup_view_body.dart';
import 'package:e_commerce_app/feature/home/presentation/view/home_view.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocConsumer extends StatelessWidget {
  const SignUpBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupCubitState>(
      listener: (context, state) {
        if (state is SignupCubitSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(
              LocaleKeys.FirbaseExecption_signupSuccess.tr(),
              backgroundColor: Color(0xff1C5D38),
            ),
          );
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomeView()),
            (route) => false,
          );
        }
        if (state is SignupCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            buildSnakBarError(state.message),
          );
        }
      },
      builder: (context, state) {
        return CustomModalProgressHUD(
          text: LocaleKeys.Loading_createTextAccount.tr(),
          inAsyncCall: state is SignupCubitLoading ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }
}
