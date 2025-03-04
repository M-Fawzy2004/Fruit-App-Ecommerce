import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signin_cubit/signin_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/recovery_view.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/signup_view.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_login_different.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_or_login.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/not_have_and_have_account.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  late String email, password;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (val) => email = val!,
                hintText: LocaleKeys.Login_emailText.tr(),
                isPassword: false,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              CustomTextFormField(
                onSaved: (val) => password = val!,
                hintText: LocaleKeys.Login_passwordText.tr(),
                isPassword: true,
              ),
              Align(
                alignment:
                    EasyLocalization.of(context)?.locale.languageCode == 'ar'
                        ? Alignment.bottomLeft
                        : Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        RecoveryView.routeName,
                      );
                    },
                    child: Text(
                      LocaleKeys.Login_forgotPassword.tr(),
                      style: Styles.fontText13(context)
                          .copyWith(color: kGreenColor),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              CustomButton(
                text: LocaleKeys.Login_signIn.tr(),
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    context
                        .read<SigninCubit>()
                        .signInWithEmailAndPassword(email, password);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              NotHaveAccountAndHaveAccount(
                onTap: () => Navigator.pushNamed(context, SignUpView.routeName),
                title1: LocaleKeys.Login_cotHaveAccount.tr(),
                title2: LocaleKeys.Login_createAccount.tr(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.035,
              ),
              CutomOrLogin(),
              CustomLoginDifferent(),
            ],
          ),
        ),
      ),
    );
  }
}
