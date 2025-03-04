import 'package:e_commerce_app/core/services/get_it_service.dart';
import 'package:e_commerce_app/feature/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signin_cubit/signin_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/recovery_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecoveryView extends StatelessWidget {
  const RecoveryView({super.key});

  static const routeName = '/recovery';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SigninCubit(
          getIt.get<AuthRepo>(),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SafeArea(
            child: RecoveryViewBody(),
          ),
        ),
      ),
    );
  }
}
