import 'package:intl/intl.dart';

class CurrencyFormatter {
  static final NumberFormat _usdFormatter = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );

  static String format(double amount) {
    return _usdFormatter.format(amount);
  }

  // Returns string with + or - sign, e.g., "+$200.00"
  static String formatWithSign(double amount) {
    final formatted = _usdFormatter.format(amount.abs());
    return amount >= 0 ? "+$formatted" : "-$formatted";
  }
}