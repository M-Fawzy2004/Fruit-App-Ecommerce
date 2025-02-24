import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/step_different_payment.dart';
import 'package:flutter/material.dart';

class PaymentSection extends StatefulWidget {
  const PaymentSection({super.key});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  bool isTermsAccepted = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'أختار طريقه الدفع المناسبه :',
            style: Styles.fontText13(context),
          ),
          SizedBox(
            height: screenHeight * .016,
          ),
          Text(
            'من فضلك اختر طريقه الدفع المناسبه لك.',
            style: Styles.fontText13(context).copyWith(
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: screenHeight * .016,
          ),
          StepDifferentPayment(),
          SizedBox(
            height: screenHeight * .045,
          ),
          // CustomTextFormField(hintText: 'اسم حامل البطاقه', isPassword: false),
          // SizedBox(
          //   height: screenHeight * .016,
          // ),
          // CustomTextFormField(hintText: 'رقم البطاقة', isPassword: false),
          // SizedBox(
          //   height: screenHeight * .016,
          // ),
          // Row(
          //   children: [
          //     Expanded(
          //       child: CustomTextFormField(
          //         keyboardType: TextInputType.number,
          //         hintText: 'تاريخ الصلاحيه',
          //         isPassword: false,
          //       ),
          //     ),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     Expanded(
          //       child: CustomTextFormField(
          //         keyboardType: TextInputType.number,
          //         hintText: 'CVV',
          //         isPassword: false,
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(
          //   height: screenHeight * .016,
          // ),
          // TermsAndCondition(
          //   textWidget: Text(
          //     'جعل البطاقة افتراضية',
          //     style: Styles.fontText13(context).copyWith(color: Colors.grey),
          //   ),
          //   isAccepted: isTermsAccepted,
          //   onChanged: (value) {
          //     setState(() {
          //       isTermsAccepted = value;
          //     });
          //   },
          // ),
        ],
      ),
    );
  }
}
