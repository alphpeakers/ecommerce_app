import 'package:animate_do/animate_do.dart';
import 'package:oxyboots/model/onboarding_model.dart/onboard_content.dart';
import 'package:oxyboots/utils/helper/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../controller/onboarding.dart';
import '../../utils/Appcolor/app_theme.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: PageView.builder(
        itemCount: OnboardContentModel.onboardList.length,
        onPageChanged: controller.updatePageIndicator,
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final itemList = OnboardContentModel.onboardList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: double.infinity,
                  // color: Colors.amber,
                  height: 500.h,
                  child: Image.asset(
                    itemList.image,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: FadeInDown(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    itemList.title,
                    style: theme.textTheme.headlineLarge,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: FadeInUp(
                  duration: const Duration(milliseconds: 500),
                  child: Text(itemList.description,
                      style: theme.textTheme.headlineMedium),
                ),
              ),
              SizedBox(height: 25.h),
              Obx(() => Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      children: [
                        ...List.generate(OnboardContentModel.onboardList.length,
                            (index) {
                          bool isActive = controller.currentPage.value == index;
                          return Container(
                            width: isActive ? 42.w : 12.w,
                            height: 6.h,
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: isActive
                                    ? theme.primaryColor
                                    : AppTheme.lightGrey,
                                borderRadius: BorderRadius.circular(5.r)),
                          );
                        }),
                        const Spacer(),
                        ElasticIn(
                          duration: const Duration(milliseconds: 1000),
                          child: CustomButton(
                            color: theme.primaryColor,
                            name: itemList.name,
                            onPressButton: () => controller.changePage(index),
                            width: 185,
                            height: 55,
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          );
        },
      ),
    );
  }
}
