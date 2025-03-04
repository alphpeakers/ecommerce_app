import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

void showPaymentSuccessDialog(BuildContext context) {
  final theme = Theme.of(context);
  Get.defaultDialog(
    backgroundColor: theme. scaffoldBackgroundColor,
    barrierDismissible: false,
    title: "",
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(ImageConstants.success),
        SizedBox(height: 22.h),
        Text(
          "Your Payment Is \nSuccessful",
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 16.h),
        ElevatedButton(
          onPressed: () {
            Get.offAllNamed(AppRoutes.home);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
          ),
          child: Text(
            "Back To Shopping",
            style: theme.textTheme.labelMedium,
          ),
        ),
      ],
    ),
    radius: 15,
  );
}
