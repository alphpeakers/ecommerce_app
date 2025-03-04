import 'package:ecommerce_app/utils/helper/appbar.dart';
import 'package:ecommerce_app/utils/helper/button.dart';
import 'package:ecommerce_app/utils/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:get/get.dart';
import '../../model/home_model/brand_model.dart';
import '../../routes/app_pages.dart';
import '../../utils/Appcolor/app_theme.dart';

class MycardScreen extends StatelessWidget {
  const MycardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        bottomSheet: Container(
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
                    style: theme.textTheme.displayMedium,
                  ),
                ],
              ),
              CustomButton(
                name: 'Checkout',
                onPressButton: () {
                  Get.toNamed(AppRoutes.checkOutScreen);
                },
                width: double.infinity,
                height: 55,
              )
            ],
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    CustomAppbar(
                      text: 'MyCart',
                      isTabicon: false,
                      isTabtext: false,
                    ),
                    SizedBox(
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
                                          borderRadius:
                                              BorderRadius.circular(10.r)),
                                      child: Image.asset(
                                        PopularCardModel.listItem[index].image,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 15.w,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 130.w,
                                          height: 15.h,
                                          child: Text(
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            'Nike Clup Max',
                                            style:
                                                theme.textTheme.headlineSmall,
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          '893',
                                          style: theme.textTheme.bodyMedium,
                                        ),
                                        SizedBox(height: 13),
                                        Row(
                                          spacing: 15,
                                          children: [
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: AppTheme.white,
                                              child: Center(
                                                  child: Icon(
                                                Icons.remove,
                                                size: 18,
                                              )),
                                            ),
                                            Text('5'),
                                            CircleAvatar(
                                              radius: 12,
                                              backgroundColor: AppTheme.primary,
                                              child: Center(
                                                  child: Icon(
                                                Icons.add,
                                                color: AppTheme.white,
                                                size: 18,
                                              )),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      spacing: 30,
                                      children: [
                                        Text('XXL',
                                            style:
                                                theme.textTheme.headlineSmall),
                                        SvgPicture.asset(ImageConstants.delete)
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                    )
                  ],
                )))));
  }
}
