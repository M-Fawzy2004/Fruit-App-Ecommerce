// ignore_for_file: avoid_print

import 'package:e_commerce_app/constant.dart';
import 'package:e_commerce_app/core/helper/function/custom_snak_bar.dart';
import 'package:flutter/material.dart';

class PaypalManager {
  void handlePaymentWithPayPal({
    required BuildContext context,
    required String amount,
    required String nameCode,
    required String itemCount,
  }) {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => PaypalCheckout(
    //       sandboxMode: true,
    //       clientId: kPaypalClientId,
    //       secretKey: kPaypalSecretKey,
    //       returnURL: "success.snippetcoder.com",
    //       cancelURL: "cancel.snippetcoder.com",
    //       transactions: [
    //         {
    //           "amount": {
    //             "total": amount,
    //             "currency": "USD",
    //             "details": {
    //               "subtotal": amount,
    //               "shipping": "0.00",
    //               "shipping_discount": "0.00"
    //             }
    //           },
    //           "description": "The payment transaction description.",
    //           "item_list": {
    //             "items": [
    //               {
    //                 "name": nameCode,
    //                 "quantity": itemCount,
    //                 "price": amount,
    //                 "currency": "USD",
    //               },
    //             ],
    //           }
    //         }
    //       ],
    //       note: "Contact us for any questions on your order.",
    //       onSuccess: (Map params) async {
    //         print("onSuccess: $params");
    //         ScaffoldMessenger.of(context).showSnackBar(
    //           buildSnakBarError(
    //             'تم الدفع بنجاح',
    //             backgroundColor: Color(0xff1C5D38),
    //           ),
    //         );
    //       },
    //       onError: (error) {
    //         print("onError: $error");
    //         Navigator.pop(context);
    //       },
    //       onCancel: () {
    //         print('cancelled:');
    //         Navigator.pop(context);
    //       },
    //     ),
    //   ),
    // );
  }
}
