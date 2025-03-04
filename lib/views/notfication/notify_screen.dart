import 'package:ecommerce_app/utils/Appcolor/app_theme.dart';
import 'package:ecommerce_app/utils/helper/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/home_model/brand_model.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomAppbar(
                onTab: () {},
                onTabtext: 'Clear All',
                text: 'Notifications',
                isTabtext: true,
                isTabicon: false,
              ),
              SizedBox(height: 20.h),
              Text('Today', style: theme.textTheme.headlineSmall),
              newMethod(theme),
              SizedBox(height: 20.h),
              Text('YesterDay', style: theme.textTheme.headlineSmall),
              newMethod(theme),
            ],
          ),
        ),
      )),
    );
  }

  Widget newMethod(ThemeData theme) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: PopularCardModel.listItem.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.w,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppTheme.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Image.asset(
                        PopularCardModel.listItem[index].image,
                      ),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130.w,
                          height: 35.h,
                          child: Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'We have new\nProucts with offers'),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Text('35893'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: 10,
                      children: [
                        Text('6 min ago', style: theme.textTheme.labelSmall),
                        CircleAvatar(
                          radius: 5,
                          backgroundColor: theme.primaryColor,
                        )
                      ],
                    ),
                  ],
                ),
              )),
    );
  }
}
