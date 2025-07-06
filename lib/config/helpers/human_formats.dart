

import 'package:intl/intl.dart';

class HumanFormats {
static String number(double number) {
  if (number >= 1000) {
    return NumberFormat.compact(
      
      locale: 'en',
    ).format(number);
  } else {
    return number.toStringAsFixed(2);
  }
}
}