import 'package:oxyboots/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/onboarding_model.dart/onboard_content.dart';

class OnboardingController extends GetxController {
  final PageController pageController = PageController();
  var currentPage = 0.obs;

  void changePage(int index) {
    if (index == OnboardContentModel.onboardList.length - 1) {
      Get.offAllNamed(AppRoutes.phoneAuthScreen);
    } else {
      pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutSine);
    }
  }

  void updatePageIndicator(int index) {
    currentPage.value = index;
  }
}
