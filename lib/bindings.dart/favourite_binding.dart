import 'package:get/get.dart';
import 'package:oxyboots/controller/favourite_controller.dart';


class FavouriteBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<FavoriteController>(() => FavoriteController());
  }
}