import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../controller/dashboard_controller.dart';
import '../../../utils/Appcolor/app_theme.dart';
import '../../../utils/helper/button.dart';

class CustomBottomSheet extends StatelessWidget {
  final String buttonText;
  final void Function() onPress;
  final CurrencyFormatter currencyController = Get.find();

  CustomBottomSheet({
    super.key, required this.buttonText, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      decoration: const BoxDecoration(color: AppTheme.white),
      height: 250.h,
      child: Column(
        spacing: 18,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SubTotal', style: theme.textTheme.labelLarge),
              Text(
                currencyController.formatPrice(double.parse('4251')),
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Delivery Charge', style: theme.textTheme.labelLarge),
              Text(
                currencyController.formatPrice(double.parse('20')),
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          const DottedLine(
            lineThickness: 1.1,
            dashColor: AppTheme.lightGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Cost', style: theme.textTheme.headlineSmall),
              Text(
                    currencyController.formatPrice(double.parse('12500')),
                    style: theme.textTheme.displayMedium,
                  ),
            ],
          ),
          CustomButton(
            width: double.infinity,
            height: 55,
            color: theme.primaryColor,
            name: buttonText,
            onPressButton: onPress,
          )
        ],
      ),
    );
  }
}
