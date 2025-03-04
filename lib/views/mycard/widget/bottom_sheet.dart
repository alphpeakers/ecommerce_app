import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/Appcolor/app_theme.dart';
import '../../../utils/helper/button.dart';
import 'Dialog_box.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
      decoration: BoxDecoration(color: AppTheme.white),
      height: 250.h,
      child: Column(
        spacing: 18,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SubTotal', style: theme.textTheme.labelLarge),
              Text(
                '1250.00',
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('SubTotal', style: theme.textTheme.labelLarge),
              Text(
                '10.00',
                style: theme.textTheme.headlineSmall,
              ),
            ],
          ),
          DottedLine(
            lineThickness: 1.1,
            dashColor: AppTheme.lightGrey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total Cost', style: theme.textTheme.headlineSmall),
              Text(
                '1250.00',
                style: theme.textTheme.displayLarge,
              ),
            ],
          ),
          CustomButton(
            width: double.infinity,
            height: 55,
            name: 'Payment',
            onPressButton: () => showPaymentSuccessDialog(context),
          )
        ],
      ),
    );
  }
}
