import 'package:awesome_drawer_bar/awesome_drawer_bar.dart';
import 'package:ecommerce_app/utils/Appcolor/app_theme.dart';
import 'package:ecommerce_app/utils/helper/inkwel.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../controller/homecontroller.dart';
import '../../../model/home_model/sidebar_model.dart';

final DrawerControllerX drawerController = Get.put(DrawerControllerX());

class Sidebar extends StatelessWidget {
  final Widget child;

  const Sidebar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return AwesomeDrawerBar(
      type: StyleState.scaleRotate,
      controller: drawerController.drawerController,
      menuScreen: MenuScreen(),
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

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

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
                  radius: 35,
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
                        contentPadding: EdgeInsets.only(right: 20),
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
                  child: Divider(
                    color: AppTheme.grey,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListTile(
                  contentPadding: EdgeInsets.only(right: 20),
                  title: Text('Sign Out', style: theme.textTheme.titleSmall),
                  leading: SvgPicture.asset(ImageConstants.signOut),
                )
              ],
            ),
          ),
        ));
  }
}
