import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Tab
class TabBarController extends GetxController {
  late PageController pageController;
  RxInt currentPage = 0.obs;

  void changeTab(int index) {
    currentPage.value = index;
    pageController.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.ease);
  }

  @override
  void onInit() {
    pageController = PageController(initialPage: currentPage.value);
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}

//drawer
class DrawerControllerX extends GetxController {
  late final AwesomeDrawerBarController drawerController;
  RxInt currentPage = 0.obs;
  @override
  void onInit() {
    super.onInit();
    drawerController = AwesomeDrawerBarController();
  }

  void toggleDrawer() {
    drawerController.toggle!();
  }
  void onChanged(int index){
    currentPage.value = index;
    currentPage.value != currentPage.value;
  }
  @override
  void onClose() {
   drawerController.close;
    super.onClose();
  }
}
