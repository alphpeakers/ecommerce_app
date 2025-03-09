import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends GetxController {
  var selectIndex = 0.obs;
  void changeIndex(int index) {
    selectIndex.value = index;
  }
}

//

class CurrencyFormatter extends GetxController {
  String formatPrice(double value) {
    return NumberFormat.currency(
      locale: "en_IN", 
      symbol: "₹", 
      decimalDigits: 0, 
    ).format(value);
  }
}
