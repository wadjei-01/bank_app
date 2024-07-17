import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WalletViewModel with ChangeNotifier {
  int _tabsIndex = 0;

  int get tabsIndex => _tabsIndex;

  void setTabsIndex(int index) {
    _tabsIndex = index;
    notifyListeners();
  }

  static final provider =
      ChangeNotifierProvider.autoDispose((ref) => WalletViewModel());
}
