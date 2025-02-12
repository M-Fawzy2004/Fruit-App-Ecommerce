import 'package:flutter/material.dart';

abstract class Styles {
  static TextStyle titleSplashView(context) {
    return TextStyle(
      fontSize: 23,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  static TextStyle fontText13(context) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.primary,
    );
  }

  static TextStyle fontText16(context) {
    return TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  static TextStyle fontText19(context) {
    return TextStyle(
      fontSize: 19,
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }

  static TextStyle titleLoginStyle() {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color: Color(0xff949D9E),
    );
  }

  static TextStyle textInputStyle(context) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      color: Theme.of(context).colorScheme.inversePrimary,
    );
  }
}
