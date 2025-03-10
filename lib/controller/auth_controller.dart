import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final TextEditingController phoneController = TextEditingController();
  RxBool isPhoneValid = false.obs;
  @override
  void onInit() {
    phoneController.addListener(checkPhonenumber);
    super.onInit();
  }

  void checkPhonenumber() {
     String phone = phoneController.text.trim();
    isPhoneValid.value = RegExp(r'^\d{10}$').hasMatch(phone);
  }
}
