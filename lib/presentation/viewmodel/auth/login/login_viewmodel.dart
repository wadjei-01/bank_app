import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginViewModel with ChangeNotifier {
  bool _obsecureText = true;

  bool get obsecureText => _obsecureText;

  void switchObsecure() {
    _obsecureText = !_obsecureText;
    notifyListeners();
  }

  static final provider =
      ChangeNotifierProvider.autoDispose((ref) => LoginViewModel());
}
