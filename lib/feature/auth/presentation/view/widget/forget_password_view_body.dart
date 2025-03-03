import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/widget/phone_number_entry_box.dart';
import 'package:e_commerce_app/feature/auth/presentation/view/pin_code_verf_view.dart';
import 'package:flutter/material.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: ProductViewHeader(
            isVisible: true,
            isVisibleNotification: false,
            title: 'نسيت كلمة المرور',
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.03,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            'لا تقلق ، ما عليك سوى كتابة رقم هاتفك وسنرسل رمز التحقق.',
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
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomButton(
            text: 'نسيت كلمة المرور',
            onTap: () {
              Navigator.pushNamed(context, PinCodeVerificationView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
