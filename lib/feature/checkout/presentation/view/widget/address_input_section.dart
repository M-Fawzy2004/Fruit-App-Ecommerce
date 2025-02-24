import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/save_address_toggle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ValueListenableBuilder<AutovalidateMode>(
        valueListenable: valueListenable,
        builder: (context, value, child) => Form(
          key: formKey,
          autovalidateMode: value,
          child: Column(
            children: [
              CustomTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.name =
                      val!;
                },
                hintText: 'الاسم كامل',
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.email =
                      val!;
                },
                hintText: 'البريد الإلكتروني',
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.address =
                      val!;
                },
                hintText: 'العنوان',
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.city =
                      val!;
                },
                hintText: 'المدينه',
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomTextFormField(
                onSaved: (val) {
                  context
                      .read<OrderEntity>()
                      .shippingAddressEntity
                      .addressDetails = val!;
                },
                hintText: 'رقم الطابق , رقم الشقه ..',
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.phone =
                      val!;
                },
                hintText: 'رقم الهاتف',
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              SaveAddressToggle(),
            ],
          ),
        ),
      ),
    );
  }
}
