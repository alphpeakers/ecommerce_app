import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/Appcolor/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utils/helper/button.dart';

class OtpScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final String phone = Get.arguments["phoneController"];
    return Scaffold(
      backgroundColor: AppTheme.lightGrey,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
          child: Column(
            spacing: 10,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Verify Details',
                style: theme.textTheme.displayMedium,
              ),
              Text(
                "We've sent an OTP to $phone",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.h),
              Pinput(
                controller: otpController,
                length: 4,
                keyboardType: TextInputType.number,
                pinAnimationType: PinAnimationType.fade,
                defaultPinTheme: PinTheme(
                  width: 50.w,
                  height: 50.h,
                  textStyle:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: Colors.blue),
                  ),
                ),
                focusedPinTheme: PinTheme(
                  width: 50.w,
                  height: 50.h,
                  textStyle:
                      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(color: AppTheme.primary, width: 2),
                  ),
                ),
              ),
              SizedBox(height: 25.h),
              CustomButton(
                  name: 'Verify',
                  onPressButton: () {
                    Get.offAllNamed(AppRoutes.home);
                  },
                  width: double.infinity,
                  height: 55),
            ],
          ),
        ),
      ),
    );
  }
}
