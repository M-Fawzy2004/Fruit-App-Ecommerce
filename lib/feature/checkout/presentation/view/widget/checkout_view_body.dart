// ignore_for_file: avoid_print
import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:e_commerce_app/core/widget/custom_button.dart';
import 'package:e_commerce_app/core/widget/product_view_header.dart';
import 'package:e_commerce_app/feature/checkout/presentation/manager/paymob_manageer.dart';
import 'package:e_commerce_app/feature/checkout/presentation/manager/paypal_manager.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/checkout_step_page_view.dart';
import 'package:e_commerce_app/feature/checkout/presentation/view/widget/checkout_steps.dart';
import 'package:e_commerce_app/feature/home/entities/cart_entity.dart';
import 'package:e_commerce_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key, required this.cartEntity});

  final CartEntity cartEntity;

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  PageController pageController = PageController();
  ValueNotifier<AutovalidateMode> valueNotifier =
      ValueNotifier(AutovalidateMode.disabled);
  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        currentPageIndex = pageController.page!.round();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    valueNotifier.dispose();
    super.dispose();
  }

  int currentPageIndex = 0;
  int? selectedPaymentIndex;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        ProductViewHeader(
          isVisible: true,
          isVisibleNotification: false,
          title: LocaleKeys.Shopping_shopping.tr(),
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        CheckoutSteps(
          currentPageIndex: currentPageIndex,
          pageController: pageController,
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
        Expanded(
          child: CheckOutStepPageView(
            pageController: pageController,
            formKey: _formKey,
            valueListenable: valueNotifier,
            onPaymentMethodSelected: (int value) {
              setState(() {
                selectedPaymentIndex = value;
              });
            },
          ),
        ),
        CustomButton(
          text: getButtonNextText(currentPageIndex),
          onTap: () {
            if (currentPageIndex == 0) {
              _handleShippingSection();
            } else if (currentPageIndex == 1) {
              _handleAddressSection();
            } else if (currentPageIndex == 2) {
              _handleShippingSection();
            } else if (currentPageIndex == 3) {
              _handlePayment();
            }
          },
        ),
        SizedBox(
          height: screenHeight * 0.02,
        ),
      ],
    );
  }

  //  handlePaymentSection
  void _handleShippingSection() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  //  getButtonNextText
  String getButtonNextText(int currentPageIndex) {
    switch (currentPageIndex) {
      case 0:
        return 'التالي';
      case 1:
        return 'التالي';
      case 2:
        return 'الدفع بواسطه Card';
      default:
        return 'الدفع';
    }
  }

  //  handleAddressSection
  void _handleAddressSection() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    } else {
      valueNotifier.value = AutovalidateMode.always;
    }
  }

  void _handlePayment() {
    if (selectedPaymentIndex == 0) {
      _handlePayPalSection(
        cartEntity: widget.cartEntity,
      );
    } else if (selectedPaymentIndex == 1) {
      _handlePaymobSection(
        carteEntity: widget.cartEntity,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        buildSnakBarError(
          'يرجى اختيار طريقه الدفع',
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  void _handlePaymobSection({required CartEntity carteEntity}) {
    PaymobManager()
        .getPaymentKey(carteEntity.calculateTotalPrice(), "EGP")
        .then((String paymentKey) {
      launchUrl(
        Uri.parse(
          "https://accept.paymob.com/api/acceptance/iframes/902493?payment_token=$paymentKey",
        ),
      );
    });
  }

  void _handlePayPalSection({
    required CartEntity cartEntity,
  }) {
    PaypalManager().handlePaymentWithPayPal(
      amount: cartEntity.calculateTotalPrice().toString(),
      nameCode: cartEntity.getProductNames(),
      itemCount: cartEntity.cartItems.length.toString(),
      context: context,
    );
  }
}
