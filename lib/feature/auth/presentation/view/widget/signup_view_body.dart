import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signup_cubits/signup_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/signin_view.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/not_have_and_have_account.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/terms_and_condition.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String name, email, password;
  bool isTermsAccepted = false;
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
                hintText: LocaleKeys.SignUp_fullNameText.tr(),
                isPassword: false,
                onSaved: (val) => name = val!,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomTextFormField(
                hintText: LocaleKeys.SignUp_emailText.tr(),
                isPassword: false,
                onSaved: (val) => email = val!,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              CustomTextFormField(
                hintText: LocaleKeys.SignUp_passwordText.tr(),
                isPassword: true,
                onSaved: (val) => password = val!,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              TermsAndCondition(
                isAccepted: isTermsAccepted,
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              CustomButton(
                  text: LocaleKeys.SignUp_register.tr(),
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      if (isTermsAccepted) {
                        context
                            .read<SignupCubit>()
                            .createUserWithEmailAndPassword(
                              email,
                              name,
                              password,
                            );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          buildSnakBarError(
                            LocaleKeys.Validation_buildSnakBar.tr(),
                          ),
                        );
                      }
                    }
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.035),
              NotHaveAccountAndHaveAccount(
                onTap: () {
                  Navigator.pushNamed(context, SignInView.routeName);
                },
                title1: LocaleKeys.SignUp_haveAccount.tr(),
                title2: LocaleKeys.SignUp_login.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
