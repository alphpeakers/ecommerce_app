import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/home_model/brand_model.dart';
import '../routes/app_pages.dart';



class CheckoutController extends GetxController {
  var currentIndex = 0.obs;
  var isFirstClick = true.obs;
  var cardItem = <PopularCardModel>[].obs;
  // Add item to cart
  void addToCart(PopularCardModel item) {
    cardItem.add(item);
    calculateTotal();
  }

  // Remove item from cart
  void removeFromCart(PopularCardModel item) {
    cardItem.remove(item);
    calculateTotal();
  }

  void handleButtonClick(PopularCardModel item) {
    if (isFirstClick.value) {
      addToCart(item);
    } else {
      Get.toNamed(AppRoutes.myCardScreen);
      
    }
    isFirstClick.value = false;
  }

  //calculate itemcard total
  void calculateTotal() {
    currentIndex.value = cardItem.fold(0, (sum, item) => sum + item.quantity);
  }
  //CurrencyFormatter
    String formatPrice(double value) {
    return NumberFormat.currency(
      locale: "en_IN", 
      symbol: "₹", 
      decimalDigits: 0, 
    ).format(value);
  }
}
