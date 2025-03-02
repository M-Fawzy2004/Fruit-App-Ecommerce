import 'package:e_commerce_app/feature/auth/presentation/view/widget/custom_form_text_field.dart';
import 'package:e_commerce_app/feature/checkout/domain/entities/order_entity.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/save_address_toggle.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
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
                  context.read<OrderEntity>().shippingAddressEntity.name = val!;
                },
                hintText: LocaleKeys.CheckOut_fullNameText.tr(),
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
                hintText: LocaleKeys.CheckOut_emailText.tr(),
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
                hintText: LocaleKeys.CheckOut_address.tr(),
                isPassword: false,
              ),
              SizedBox(
                height: screenHeight * .02,
              ),
              CustomTextFormField(
                onSaved: (val) {
                  context.read<OrderEntity>().shippingAddressEntity.city = val!;
                },
                hintText: LocaleKeys.CheckOut_cityText.tr(),
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
                hintText: LocaleKeys.CheckOut_countryText.tr(),
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
                hintText: LocaleKeys.CheckOut_phoneText.tr(),
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
