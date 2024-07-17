import 'package:intl/intl.dart';
import 'dart:math';

class StringUtils {
  static String getFirstLetter(String value) {
    return value[0].toUpperCase();
  }

  static String getCurrencyFormat(double value) {
    var formatter =
        NumberFormat.decimalPatternDigits(locale: 'en_us', decimalDigits: 2);
    return formatter.format(value);
  }

  static double generateRandomAmount() {
    const double min = 200000, max = 300000;
    final random = Random();
    return random.nextDouble() * (max - min) + min;
  }

  static String getRandomizedCardNumber() {
    final random = Random();
    const len = 3;
    final int max = 9999;
    final int min = 1000;

    String cardNumber = '';

    for (int i = 0; i <= len; i++) {
      final digits = (min + random.nextInt(max - min)).toString();

      if (i != 3) {
        cardNumber = '$cardNumber$digits ';
      } else {
        cardNumber = cardNumber + digits;
      }

      print(cardNumber);
    }
    return cardNumber;
  }
}
