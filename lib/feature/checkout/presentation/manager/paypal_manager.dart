// ignore_for_file: avoid_print

import 'package:e_commerce_app/constant.dart';
import 'package:flutter_paypal_checkout/flutter_paypal_checkout.dart';

class PaypalManager {
  void handlePaymentWithPayPal({
    required String amount,
    required String name,
    required String itemCount,
  }) {
    PaypalCheckout(
      sandboxMode: true,
      clientId: kPaypalClientId,
      secretKey: kPaypalSecretKey,
      returnURL: "success.snippetcoder.com",
      cancelURL: "cancel.snippetcoder.com",
      transactions: [
        {
          "amount": {
            "total": amount,
            "currency": "EGP",
            "details": {
              "subtotal": amount,
              "shipping": '0',
              "shipping_discount": 0
            }
          },
          "description": "The payment transaction description.",
          // "payment_options": {
          //   "allowed_payment_method":
          //       "INSTANT_FUNDING_SOURCE"
          // },
          "item_list": {
            "items": [
              {
                "name": name,
                "quantity": itemCount,
                "price": amount,
                "currency": "EGP",
              },
            ],

            // shipping address is not required though
            //   "shipping_address": {
            //     "recipient_name": "Raman Singh",
            //     "line1": "Delhi",
            //     "line2": "",
            //     "city": "Delhi",
            //     "country_code": "IN",
            //     "postal_code": "11001",
            //     "phone": "+00000000",
            //     "state": "Texas"
            //  },
          }
        }
      ],
      note: "Contact us for any questions on your order.",
      onSuccess: (Map params) async {
        print("onSuccess: $params");
      },
      onError: (error) {
        print("onError: $error");
      },
      onCancel: () {
        print('cancelled:');
      },
    );
  }
}
