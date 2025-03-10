import 'package:animate_do/animate_do.dart';
import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:oxyboots/routes/app_pages.dart';
import 'package:oxyboots/utils/Appcolor/app_theme.dart';
import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/dashboard_controller.dart';
import '../../../model/home_model/sidebar_model.dart';
import '../../../utils/helper/button.dart';

// final DrawerControllerX drawerController = Get.put(DrawerControllerX());

class Sidebar extends StatelessWidget {
  final Widget child;

  const Sidebar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AwesomeDrawerBar(
      type: StyleState.scaleRotate,
      controller: Get.find<DashboardController>().drawerController,
      menuScreen: const MenuScreen(),
      mainScreen: child,
      borderRadius: 28.0,
      showShadow: true,
      angle: -6,
      backgroundColor: Colors.grey[300]!,
      slideWidth: 250.w,
      openCurve: Curves.fastOutSlowIn,
      closeCurve: Curves.easeInOut,
      shadowColor: AppTheme.info,
      slideHeight: 50.h,
    );
  }
}

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: AppTheme.info,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 60.h, horizontal: 20.w),
            child: Column(
              spacing: 7,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 35.r,
                  backgroundImage:
                      const AssetImage(ImageConstants.profileImage),
                ),
                Text('Hey, 👋', style: theme.textTheme.labelSmall),
                Text('Alisson Beckeor', style: theme.textTheme.titleMedium),
                SizedBox(
                  height: 15.h,
                ),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: SidebarModel.itemList.length,
                  itemBuilder: (context, index) {
                    final listData = SidebarModel.itemList[index];
                    return CustomInkTap(
                      onPress: () => Get.toNamed(listData.routeName),
                      child: ListTile(
                        contentPadding: const EdgeInsets.only(right: 20),
                        title: Text(listData.title,
                            style: theme.textTheme.titleSmall),
                        leading: SvgPicture.asset(
                          listData.image,
                          color: AppTheme.grey,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  width: 150.w,
                  child: const Divider(
                    color: AppTheme.grey,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  onTap: () {
                    dialogLogout(theme);
                  },
                  contentPadding: const EdgeInsets.only(right: 20),
                  title: Text('Sign Out', style: theme.textTheme.titleSmall),
                  leading: SvgPicture.asset(ImageConstants.signOut),
                )
              ],
            ),
          ),
        ));
  }

  Future<dynamic> dialogLogout(ThemeData theme) {
    return Get.dialog(
      barrierDismissible: false,
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r), // Rounded corners
        ),
        child: Container(
          padding: const EdgeInsets.all(16),
          width: 250, // Set custom width
          height: 130, // Set custom height
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              FadeInDown(
                duration: const Duration(milliseconds: 200),
                child: Text(
                  'Are you sure you want \nto Log out?',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FadeInUp(
                      duration: const Duration(milliseconds: 200),
                      child: CustomButton(
                        name: 'Cancel',
                        onPressButton: () => Get.back(),
                        width: 80,
                        height: 30,
                        color: AppTheme.grey,
                      )),
                  FadeInUp(
                    duration: const Duration(milliseconds: 200),
                    child: CustomButton(
                      name: 'Log out',
                      onPressButton: () =>
                          Get.offAllNamed(AppRoutes.phoneAuthScreen),
                      width: 80,
                      height: 30,
                      color: AppTheme.dark,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
