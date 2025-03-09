import 'package:get/get.dart';

import 'controller/favoritecontroller.dart';

class SampleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut <CheckoutController>(() => CheckoutController());
  }
}