import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/core/widget/custom_app_bar.dart';
import 'package:e_commerce_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signup_cubits/signup_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/signup_view_bloc_consumer.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        // add custom app bar
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: CustomAppBar(
            context,
            title: LocaleKeys.SignUp_appBartitle.tr(),
          ),
        ),
        body: SignUpBlocConsumer(),
      ),
    );
  }
}
