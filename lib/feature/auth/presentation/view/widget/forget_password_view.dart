import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/auth/presentation/manager/signin_cubit/signin_cubit_cubit.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/phone_number_entry_box.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final GlobalKey<FormState> formKey = GlobalKey();
  late String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ProductViewHeader(
            isVisible: true,
            isVisibleNotification: false,
            title: LocaleKeys.ResetPass_forgetPass.tr(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            LocaleKeys.ResetPass_dontWorry.tr(),
            style: Styles.fontText16(context),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: PhoneNumberEntryBox(),
        ),
        SliverToBoxAdapter(
          child: Text(
            LocaleKeys.ResetPass_inputEmail.tr(),
            style: Styles.fontText13(context),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
        ),
        SliverToBoxAdapter(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: CustomTextFormField(
              isPassword: false,
              hintText: LocaleKeys.ResetPass_enterEmail.tr(),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomButton(
            text: LocaleKeys.ResetPass_forgetPass.tr(),
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                context.read<SigninCubit>().verfPhoneNumber(phoneNumber);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
        ),
      ],
    );
  }
}
