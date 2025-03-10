import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';

import '../model/home_model/tabbar_model.dart';

class DashboardController extends GetxController
    with GetSingleTickerProviderStateMixin {
  //late PageController pageController;
  late TabController tabController;

  RxInt currentPage = 0.obs;
  var selectIndex = 0.obs;
  final AwesomeDrawerBarController drawerController =
      AwesomeDrawerBarController();
  RxInt tabPage = 0.obs;

//tabbar
  @override
  void onInit() {
    tabController =
        TabController(length: TabbarModel.tabList.length, vsync: this);
    tabController.addListener(() {
      currentPage.value = tabController.index;
    });
    super.onInit();
  }

  void changeTab(int index) {
    tabController.animateTo(index);
    currentPage.value = index;
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

//bottom nav
  void changeIndex(int index) {
    selectIndex.value = index;
  }

//drawer
  void toggleDrawer() {
    drawerController.toggle!();
  }
}
