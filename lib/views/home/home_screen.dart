import 'package:flutter/gestures.dart';
import 'package:oxyboots/controller/dashboard_controller.dart';
import 'package:oxyboots/routes/app_pages.dart';
import 'package:oxyboots/utils/Appcolor/app_theme.dart';
import 'package:oxyboots/utils/helper/inkwel.dart';
import 'package:oxyboots/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../controller/product_controller.dart';
import '../../model/home_model/tabbar_model.dart';
import 'widget/bottom_sheet.dart';
import 'widget/popular_shoes.dart';
import 'widget/sidebar.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final DashboardController dashboardController = Get.find();
  final CheckoutController checkoutController = Get.find();

  final List items = [
    PopularCard(),
    const PumaBrand(),
    const AdidasBrand(),
    const ConverseBrand(),
    const ReebokBrand()
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Sidebar(
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: theme.scaffoldBackgroundColor,
          statusBarIconBrightness: Brightness.dark,
        ),
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          body: SafeArea(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      enableFeedback: false,
                      highlightColor: Colors.transparent,
                      onTap: () => dashboardController.toggleDrawer(),
                      child: Container(
                          height: 45.h,
                          width: 45.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: AppTheme.white),
                          child: Center(
                              child: SvgPicture.asset(ImageConstants.menu))),
                    ),
                    Column(
                      children: [
                        Text('Store Location',
                            style: theme.textTheme.labelSmall),
                        Row(
                          children: [
                            SvgPicture.asset(ImageConstants.location,
                                height: 20.h, width: 20.w),
                            Text('Mondolibug,Sylhet',
                                style: theme.textTheme.headlineSmall),
                          ],
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        CustomInkTap(
                          onPress: () => Get.toNamed(AppRoutes.myCardScreen),
                          child: Container(
                            height: 45.h,
                            width: 45.w,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: AppTheme.white),
                            child: Center(
                                child: SvgPicture.asset(ImageConstants.myCard)),
                          ),
                        ),
                        CircleAvatar(
                          radius: 8.r,
                          backgroundColor: AppTheme.dark,
                          child: Text(
                            checkoutController.currentIndex.toString(),
                            style: TextStyle(
                                fontSize: 10.sp, color: AppTheme.white),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 25.h),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(20.r),
                  ),
                  child: Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(ImageConstants.search, height: 20.h),
                      InkWell(
                          splashColor: Colors.transparent,
                          enableFeedback: false,
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Get.toNamed(AppRoutes.searchScreen);
                          },
                          child: Text('Looking for shoes',
                              style: theme.textTheme.labelSmall)),
                      const Spacer(),
                      CustomInkTap(
                        onPress: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              backgroundColor: theme.scaffoldBackgroundColor,
                              context: context,
                              builder: (context) => CustomBottomSheetContent());
                        },
                        child: CircleAvatar(
                            radius: 15.r,
                            backgroundColor: theme.primaryColor,
                            child: SvgPicture.asset(ImageConstants.filter2)),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 25.h),
                //Tabbar
                DefaultTabController(
                  length: TabbarModel.tabList.length,
                  child: SizedBox(
                    height: 50.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: TabbarModel.tabList.length,
                      itemBuilder: (context, index) => Obx(() {
                        bool isSelect =
                            dashboardController.currentPage.value == index;
                        final itemTab = TabbarModel.tabList[index];
                        return GestureDetector(
                          onTap: () => dashboardController.changeTab(index),
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8.w),
                            padding: isSelect
                                ? EdgeInsets.symmetric(
                                    horizontal: 6.w, vertical: 7.h)
                                : EdgeInsets.symmetric(horizontal: 2.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: isSelect
                                  ? theme.primaryColor
                                  : AppTheme.white,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                    backgroundColor: AppTheme.white,
                                    radius: 25,
                                    child: SvgPicture.asset(itemTab.image)),
                                if (isSelect) ...[
                                  SizedBox(width: 8.w),
                                  Text(itemTab.title,
                                      style: theme.textTheme.titleSmall),
                                  SizedBox(width: 8.w),
                                ],
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                Expanded(
                    child: TabBarView(
                        controller: dashboardController.tabController,
                        physics: const NeverScrollableScrollPhysics(),
                        children: List.generate(
                          items.length,
                          (index) {
                            return items[index];
                          },
                        )))
              ],
            ),
          )),
        ),
      ),
    );
  }
}

//
class PumaBrand extends StatelessWidget {
  const PumaBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Puma'),
    );
  }
}

class AdidasBrand extends StatelessWidget {
  const AdidasBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Adidas'),
    );
  }
}

class ConverseBrand extends StatelessWidget {
  const ConverseBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Converse'),
    );
  }
}

class ReebokBrand extends StatelessWidget {
  const ReebokBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('UnderArmour'),
    );
  }
}
