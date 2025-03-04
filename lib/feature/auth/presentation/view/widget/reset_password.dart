import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProductViewHeader(
            isVisible: true,
            isVisibleNotification: false,
            title: LocaleKeys.ResetPass_newPass.tr(),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            LocaleKeys.ResetPass_createPass.tr(),
            style: Styles.fontText16(context),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: LocaleKeys.ResetPass_newPass.tr(),
                isPassword: true,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.01,
              ),
              CustomTextFormField(
                hintText: LocaleKeys.ResetPass_savePass.tr(),
                isPassword: true,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomButton(
            text: LocaleKeys.ResetPass_newPass.tr(),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}
