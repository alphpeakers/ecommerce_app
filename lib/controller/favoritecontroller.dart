import 'package:get/get.dart';

import '../model/home_model/brand_model.dart';
import '../routes/app_pages.dart';

class FavoriteController extends GetxController {
  RxList favouriteItem = <PopularCardModel>[].obs;
  // Add item to favorites
  void addTofavourite(PopularCardModel item) {
    favouriteItem.add(item);
  }

  // Remove item from favorites
  void removeFromFavorites(PopularCardModel item) {
    favouriteItem.remove(item);
  }

// Check if an item is in favorites
  bool isfavourite(PopularCardModel item) {
    return favouriteItem.contains(item);
  }
}

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

  //calculate iteemcard total
  void calculateTotal() {
    currentIndex.value = cardItem.fold(0, (sum, item) => sum + item.quantity);
  }
}
