import 'package:animate_do/animate_do.dart';
import 'package:oxyboots/routes/app_pages.dart';
import 'package:oxyboots/utils/helper/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showPaymentSuccessDialog(
  BuildContext context,
) {
  final theme = Theme.of(context);
  Get.defaultDialog(
    backgroundColor: theme.scaffoldBackgroundColor,
    barrierDismissible: false,
    title: "",
    content: Column(
      spacing: 20,
      children: [
        ZoomIn(
          duration: const Duration(milliseconds: 600),
          child: Icon(
            Icons.check_circle,
            size: 85.spMax,
            color: Colors.green,
          ),
        ),
        Text(
          "Your Payment Is \nSuccessful",
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        ElasticInUp(
          duration: const Duration(milliseconds: 600),
          child: CustomButton(
            name: 'Back To Shopping',
            onPressButton: () {
              Get.offAllNamed(AppRoutes.dashboardScreen);
            },
            width: 165.w,
            height: 45.h,
            color: theme.primaryColor,
          ),
        )
      ],
    ),
    radius: 15,
  );
}
