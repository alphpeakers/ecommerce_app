import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../utils/Appcolor/app_theme.dart';
import '../../../utils/helper/inkwel.dart';

class CustomBottomSheetContent extends StatelessWidget {
  CustomBottomSheetContent({super.key});
  final List items2 = ['Men', 'Women', 'Kids'];
  final List items3 = ['UK 4.4', 'US 5.5', 'UK 6.5', 'EU 11.5'];
  @override
  Widget build(BuildContext context) {
    RxInt selectIndex = 0.obs;
    RxInt selectIndexZ = 0.obs;
    double start = 30.0;
    double end = 50.0;
    final theme = Theme.of(context);
    return Container(
      height: 580.h,
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 25,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60.w,
                height: 6.h,
                decoration: BoxDecoration(
                  color: AppTheme.lightGrey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              Text('Filters', style: theme.textTheme.displayLarge),
              SizedBox(
                width: 100.w,
              ),
              const Text('Reset')
            ],
          ),
          Text('Gender', style: theme.textTheme.headlineSmall),
          Obx(
            () => Row(
              spacing: 5,
              children: List.generate(
                items2.length,
                (index) {
                  bool isSelect = selectIndex.value == index;

                  return CustomInkTap(
                    onPress: () => selectIndex.value = index,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.w, vertical: 15.h),
                      decoration: BoxDecoration(
                          color: isSelect ? theme.primaryColor : AppTheme.white,
                          borderRadius: BorderRadius.circular(25.r)),
                      child: Text(
                        items2[index],
                        style: TextStyle(
                          color: isSelect ? Colors.white : Colors.blue,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Text('Size', style: theme.textTheme.headlineSmall),
          Obx(
            () => SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                spacing: 5,
                children: List.generate(
                  items3.length,
                  (index) {
                    bool isSelect = selectIndexZ.value == index;

                    return CustomInkTap(
                      onPress: () => selectIndexZ.value = index,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 25.w, vertical: 15.h),
                        decoration: BoxDecoration(
                            color:
                                isSelect ? theme.primaryColor : AppTheme.white,
                            borderRadius: BorderRadius.circular(25.r)),
                        child: Text(
                          items3[index],
                          style: TextStyle(
                            color: isSelect ? Colors.white : Colors.blue,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Text('Price', style: theme.textTheme.headlineSmall),
          RangeSlider(
            min: 10.0,
            max: 85.0,
            divisions: 100,
            labels: RangeLabels(start.toString(), end.toString()),
            values: RangeValues(start, end),
            onChanged: (value) {
              start = value.start;
              end = value.end;
            },
          ),
          Text(
              'Start: ${start.toStringAsFixed(2)}End :${end.toStringAsFixed(2)}'),
          Container(
            width: double.infinity,
            height: 55.h,
            decoration: BoxDecoration(
                color: theme.primaryColor,
                borderRadius: BorderRadius.circular(30.r)),
            child: const Center(child: Text('Apply')),
          )
        ],
      ),
    );
  }
}
