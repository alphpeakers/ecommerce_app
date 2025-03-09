import 'package:oxyboots/utils/Appcolor/app_theme.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:oxyboots/views/favourite/favourite_screen.dart';
import 'package:oxyboots/views/home/home_screen.dart';
import 'package:oxyboots/views/notfication/notify_screen.dart';
import 'package:oxyboots/views/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../controller/dashboard_controller.dart';

class Dashboard extends StatelessWidget {
  final DashboardController navController = Get.put(DashboardController());
  final List<Widget> screens = [
    HomeScreen(),
    FavouriteScreen(),
    const NotifyScreen(),
    ProfileScreen(),
  ];

  Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Obx(() => IndexedStack(
            index: navController.selectIndex.value,
            children: screens,
          )),
      bottomNavigationBar: Obx(() => NavigationBar(
              height: 70,
              labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
              backgroundColor: AppTheme.white,
              indicatorColor: AppTheme.lightGrey,
              selectedIndex: navController.selectIndex.value,
              onDestinationSelected: (value) =>
                  navController.changeIndex(value),
              destinations: [
                NavigationDestination(
                    icon: SvgPicture.asset(
                      ImageConstants.home,
                      colorFilter: ColorFilter.mode(
                        navController.selectIndex.value == 0
                            ? theme.primaryColor
                            : AppTheme.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: ''),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      ImageConstants.like,
                      colorFilter: ColorFilter.mode(
                        navController.selectIndex.value == 1
                            ? theme.primaryColor
                            : AppTheme.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: ''),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      ImageConstants.notify,
                      colorFilter: ColorFilter.mode(
                        navController.selectIndex.value == 2
                            ? theme.primaryColor
                            : AppTheme.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: ''),
                NavigationDestination(
                    icon: SvgPicture.asset(
                      ImageConstants.user,
                      colorFilter: ColorFilter.mode(
                        navController.selectIndex.value == 3
                            ? theme.primaryColor
                            : AppTheme.grey,
                        BlendMode.srcIn,
                      ),
                    ),
                    label: ''),
              ])),
    );
  }
}
