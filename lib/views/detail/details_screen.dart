import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/helper/button.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../model/home_model/brand_model.dart';
import '../../utils/Appcolor/app_theme.dart';
import '../../utils/helper/appbar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PopularCardModel data = Get.arguments;
    final theme = Theme.of(context);
    return Scaffold(
        bottomSheet: Container(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 18.h),
          decoration: BoxDecoration(
            color: theme.scaffoldBackgroundColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Price',
                    style: theme.textTheme.labelSmall,
                  ),
                  SizedBox(height: 4.h),
                  Text('\$849.69', style: theme.textTheme.displayMedium),
                ],
              ),
              CustomButton(
                  name: 'Add To Cart',
                  onPressButton: () => Get.toNamed(AppRoutes.myCardScreen),
                  width: 160,
                  height: 50)
            ],
          ),
        ),
        backgroundColor: theme.scaffoldBackgroundColor,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: CustomAppbar(
                  text: 'Product Details',
                  isTabtext: false,
                  imageIcon: ImageConstants.like,
                  isTabicon: true,
                ),
              ),
              Container(
                  height: 230.h,
                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  color: theme.scaffoldBackgroundColor,
                  child: Center(
                      child: Image.asset(
                    data.image,
                  ))),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppTheme.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(22.r),
                        topLeft: Radius.circular(22.r))),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 15.h),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.name, style: theme.textTheme.bodySmall),
                      Text(
                        data.title,
                        style: theme.textTheme.displayLarge,
                      ),
                      Text(data.price, style: theme.textTheme.displayMedium),
                      Text(
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        data.description!,
                        style: theme.textTheme.labelSmall,
                      ),
                      // SizedBox(height: 25.h),
                      Text('Gallery', style: theme.textTheme.headlineSmall),
                      Row(
                        children: List.generate(
                          3,
                          (index) {
                            return gallery();
                          },
                        ),
                      ),
                      //Size
                      Row(
                        children: [
                          Text('Size', style: theme.textTheme.headlineSmall),
                          Spacer(),
                          Row(
                            spacing: 10,
                            children: [
                              Text('EU', style: theme.textTheme.headlineSmall),
                              Text('US', style: theme.textTheme.headlineSmall),
                              Text('UK', style: theme.textTheme.headlineSmall),
                            ],
                          ),
                        ],
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            8,
                            (index) {
                              return sizeChart();
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 95.h,
                      ),
                    ],
                  ),
                ),
              )
            ]))));
  }

  Widget sizeChart() {
    return Row(
      children: [
        Container(
          width: 35.w,
          height: 35.h,
          decoration:
              BoxDecoration(color: AppTheme.background, shape: BoxShape.circle),
          child: Center(child: Text('12')),
        ),
        SizedBox(width: 10.w)
      ],
    );
  }

  Widget gallery() {
    return Row(
      children: [
        Container(
            height: 50.h,
            width: 50.w,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(8.r)),
            child: SvgPicture.asset(ImageConstants.adidasLogo)),
        SizedBox(width: 15.w)
      ],
    );
  }
}
