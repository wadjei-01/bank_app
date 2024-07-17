import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:models/models.dart';

class OverviewViewModel with ChangeNotifier {
  final timeFilter = ['Today', 'This Week', 'This Month', '3 Months Ago'];

  String _selectedTime = 'Today';

  String get selectedTime => _selectedTime;

  void setSelectedTime(String value) {
    _selectedTime = value;
    notifyListeners();
  }

  static final provider =
      ChangeNotifierProvider.autoDispose((ref) => OverviewViewModel());
}

final transactionListProvider = FutureProvider.autoDispose((ref) {
  return Future.delayed(const Duration(seconds: 3), () {
    return Transaction.list;
  });
});
