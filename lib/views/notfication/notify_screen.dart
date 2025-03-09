import 'package:oxyboots/utils/Appcolor/app_theme.dart';
import 'package:oxyboots/utils/helper/appbar.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppbar(
              onTab: () {},
              onTabtext: 'Clear All',
              isMenu: false,
              text2: 'Notification',
              isTabicon: false,
            ),
            Expanded(
              
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 20.h),
                    Text('Today', style: theme.textTheme.headlineSmall),
                    notficationContent(theme),
                    SizedBox(height: 20.h),
                    Text('YesterDay', style: theme.textTheme.headlineSmall),
                    notficationContent(theme),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }

  Widget notficationContent(ThemeData theme) {
    return SizedBox(
      child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: PopularCardModel.listItem.length,
          itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80.h,
                      width: 80.w,
                      padding: const EdgeInsets.all(10),
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
                          child: const Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              'We have new\nProucts with offers'),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        const Text('35893'),
                      ],
                    ),
                    const Spacer(),
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
