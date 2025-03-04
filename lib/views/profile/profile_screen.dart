import 'package:ecommerce_app/utils/helper/button.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/Appcolor/app_theme.dart';
import '../../utils/helper/appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: SingleChildScrollView(
                    child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      CustomAppbar(
                        text: 'Profile',
                        isTabtext: false,
                        isTabicon: true,
                        imageIcon: ImageConstants.edit,
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 50,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Allison Becker'),
                        ],
                      ),
                      Text(
                        'Full Name',
                        style: theme.textTheme.headlineSmall,
                      ),
                      newMethod(context),
                      Text(
                        'Email Address',
                        style: theme.textTheme.headlineSmall,
                      ),
                      newMethod(context),
                      Text(
                        'Phone No',
                        style: theme.textTheme.headlineSmall,
                      ),
                      newMethod(context),
                      Text(
                        'Address',
                        style: theme.textTheme.headlineSmall,
                      ),
                      newMethod(context),
                      Text(
                        'Password',
                        style: theme.textTheme.headlineSmall,
                      ),
                      newMethod(context),
                      SizedBox(height: 25.h),
                      CustomButton(
                        name: 'Save',
                        onPressButton: () {},
                        width: double.infinity,
                        height: 55,
                      )
                    ])))));
  }

  Widget newMethod(BuildContext context) {
    return Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextField(
        readOnly: true,
        //  controller: searchController,
        onSubmitted: (value) => FocusScope.of(context).unfocus(),
        autocorrect: true,
        decoration: InputDecoration(
          hintText: "Allison Becker",
          hintStyle: Theme.of(context).textTheme.labelSmall,
          border: InputBorder.none,
          contentPadding:
              EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
        ),
      ),
    );
  }
}
