// ignore_for_file: prefer_final_fields

import 'package:e_commerce_app/core/helper/function/get_user.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = getUser().name;
  String _email = getUser().email;

  String get name => _name;
  String get email => _email;

  void updateName(String newName) {
    _name = newName;
    notifyListeners();
  }
}
