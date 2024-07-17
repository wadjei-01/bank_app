import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:template_app/presentation/screens/main/home/home_screen.dart';

class BaseViewModel with ChangeNotifier {
  String _currentNavPath = HomeScreen.id;

  String getCurrentNavPath() => _currentNavPath;

  set currentNavPath(String value) {
    _currentNavPath = value;
    notifyListeners();
  }

  static final provider =
      ChangeNotifierProvider.autoDispose((ref) => BaseViewModel());
}
