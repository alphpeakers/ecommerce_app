import 'package:get/get.dart';

import '../model/home_model/brand_model.dart';

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